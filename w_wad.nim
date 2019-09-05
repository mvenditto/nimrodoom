{.emit: """
/*
#include "doomtype.h"
#include "m_swap.h"
#include "i_system.h"
#include "z_zone.h"
*/
""".}

import posix
import strutils
import sequtils
import sugar
import strformat
import os
import sugar
import streams
import m_swap_h

type
    wadinfo_t {.bycopy.} = object
        identification*: array[4, char] ##  Should be "IWAD" or "PWAD".
        numlumps*: cint
        infotableofs*: cint

    filelump_t {.bycopy.} = object
        filepos*: cint
        size*: cint
        name*: array[8, char]

type
    lumpinfo_t {.bycopy.} = object
        name*: array[8, char]
        handle*: cint
        position*: cint
        size*: cint

var reloadlump: cint
var reloadname: cstring
var numlumps: cint
var lumpinfo: ptr lumpinfo_t
var lumpcache: ptr pointer

proc asArray(str: string): ptr UncheckedArray[char] =
    var length = len(str)
    var arr = cast[ptr UncheckedArray[char]](alloc(length + 1 * sizeof(char)))
    for c in 0..length - 1:
        arr[c] = str[c]
    return arr

proc W_AddFile*(fname: cstring) {.exportc.} =
    var filename = $fname
    var header: wadinfo_t
    var lump_p: ptr lumpinfo_t
    var fileinfo: ptr filelump_t
    var singleinfo: filelump_t
    var storehandle: cint
    var startlump: cint
    var length: cint

    echo filename

    if filename[0] == '~':
        filename = filename.substr(1)
        reloadname = filename
        reloadlump = numlumps

    var file: File = open(filename, fmRead, -1)
    var handle: cint = getFileHandle(file)
    #posix.open(filename, O_RDONLY)

    if handle == -1:
        echo &"could not open {filename}"
        return

    echo "adding " & filename
    startlump = numlumps

    let(path, basename, ext) = splitFile(filename)

    echo (basename, ext)
    
    if ext != ".wad": 
        fileinfo = addr(singleinfo)
        singleinfo.filepos = 0
        singleinfo.size = LONG(cast[int32](getFileSize(filename)))
        singleinfo.name = cast[ptr array[8, char]](asArray basename)[]
        numlumps = numlumps + 1
    else:
        var fs = newFileStream(file)
        var rb = fs.readData(addr(header), sizeof(header))
        echo "read: " & $rb
        header.numlumps = LONG(header.numlumps)
        header.infotableofs = LONG(header.infotableofs)
        length = header.numlumps * cint(sizeof(filelump_t))
        
        echo $header.numlumps
        echo $header.infotableofs
        echo $length
        
        file.setFilePos(header.infotableofs)
        fileinfo = cast[ptr filelump_t](alloc(length))
        discard fs.readData(fileinfo, length)
        numlumps = numlumps + header.numlumps
        echo "nlumps:" & $numlumps

    var p = realloc(lumpinfo, numlumps * sizeof(lumpinfo_t))
    if p == nil:
      echo "error reallocating lumpinfo"
      return
    
    lumpinfo = cast[ptr lumpinfo_t](p)
    
    var tmp = cast[uint](numlumps * sizeof(lumpinfo_t) * startlump)
    lump_p = cast[ptr lumpinfo_t](cast[uint](p) + tmp)

    if reloadname == nil:
       storehandle = handle
    else:
       storehandle = -1
    
    var i = startlump
    while i < numlumps:

      lump_p.handle = storehandle
      lump_p.position = LONG(fileinfo.filepos)
      lump_p.size = LONG(fileinfo.size)
      lump_p.name = fileinfo.name

      # echo lump_p.name.join("") & " | " & $lump_p.handle & " | " & $lump_p.position & " | " & $lump_p.size
      
      i = i + 1
      lump_p = cast[ptr lumpinfo_t](cast[uint](lump_p) + uint(sizeof(lumpinfo_t)))
      fileinfo = cast[ptr filelump_t](cast[uint](fileinfo) + uint(sizeof(filelump_t)))

    if reloadname != nil:
      discard close(handle)


