import posix
import strutils
import sequtils
import sugar
import strformat
import os
import logging
import sugar
import streams
import colorize
import m_swap_h


const debug = false


when not debug:
    import z_zone_h
    proc I_Error(msg: cstring) {.importc, header:"i_system.h", varargs.}
else:
    proc Z_Malloc(size: cint; tag: cint; `ptr`: pointer): pointer =
        return alloc(size)

    proc Z_Free(p: pointer) =
        dealloc(p)

    proc Z_ChangeTag(p: pointer, tag: cint) =
        echo "change tag: " & $cast[uint](p) & " => " & $tag

    proc I_Error(msg: cstring) =
        echo msg
        exitnow -1

type
    wadinfo_t* {.bycopy.} = object
        identification*: array[4, char] ##  Should be "IWAD" or "PWAD".
        numlumps*: cint
        infotableofs*: cint

    filelump_t* {.bycopy.} = object
        filepos*: cint
        size*: cint
        name*: array[8, char]

type
    lumpinfo_t* {.bycopy.} = object
        name*: array[8, char]
        handle*: cint
        position*: cint
        size*: cint

proc tostr(lump_p: ptr lumpinfo_t): string =
    let n = lump_p.name.join("").fgMagenta
    let h = $lump_p.handle
    let p = $lump_p.position
    let s = $lump_p.size
    return &"lump[name={n},handle={h},offset={p},size={s}]"
      

var reloadlump: cint
var reloadname*: cstring
var numlumps*: cint
var lumpinfo* {.exportc.} : ptr lumpinfo_t 
var lumpcache*: ptr UncheckedArray[pointer]

proc asArray(str: string): ptr UncheckedArray[char] =
    var length = len(str)
    var arr = cast[ptr UncheckedArray[char]](alloc(length + 1 * sizeof(char)))
    for c in 0..length - 1:
        arr[c] = str[c]
    return arr

proc readHeader*(wad: FileStream): wadinfo_t =
    var header: wadinfo_t
    discard wad.readData(addr(header), sizeof(header))
    header.numlumps = LONG(header.numlumps)
    header.infotableofs = LONG(header.infotableofs)
    return header

proc W_AddFile*(fname: cstring) {.exportc.} =
    var filename = $fname
    # var header: wadinfo_t
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
        echo "not .wad"
        fileinfo = addr(singleinfo)
        singleinfo.filepos = 0
        singleinfo.size = LONG(cast[int32](getFileSize(filename)))
        singleinfo.name = cast[ptr array[8, char]](asArray basename)[]
        numlumps = numlumps + 1
    else:
        var fs = newFileStream(file)

        var header: wadinfo_t = readHeader(fs)

        #var rb = fs.readData(addr(header), sizeof(header))
        #echo "read: " & $rb
        #header.numlumps = LONG(header.numlumps)
        #header.infotableofs = LONG(header.infotableofs)
        
        length = header.numlumps * cint(sizeof(filelump_t))
        
        echo $header.numlumps
        echo $header.infotableofs
        
        file.setFilePos(header.infotableofs)
        fileinfo = cast[ptr filelump_t](alloc(length))
        discard fs.readData(fileinfo, length)
        
        # echo $length
        # echo $fileinfo.filepos
        #  echo $fileinfo.name
        # echo $fileinfo.size

        numlumps = numlumps + header.numlumps
        echo "nlumps:" & $numlumps

    echo &"realloc lumpinfo to {$(numlumps * sizeof(lumpinfo_t))}"
    var p = reallocShared(
        cast[pointer](lumpinfo), 
        numlumps * sizeof(lumpinfo_t))
    
    if p == nil:
      echo "error reallocating lumpinfo"
      return
    
    lumpinfo = cast[ptr lumpinfo_t](p)
    
    var tmp = cast[uint](sizeof(lumpinfo_t) * startlump) #*numlumps
    echo $tmp
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

      debug("found: " & tostr(lump_p))

      i = i + 1
      lump_p = cast[ptr lumpinfo_t](cast[uint](lump_p) + uint(sizeof(lumpinfo_t)))
      fileinfo = cast[ptr filelump_t](cast[uint](fileinfo) + uint(sizeof(filelump_t)))
    
    
    if reloadname != nil:
      discard close(handle)

    


proc W_Reload*() {.exportc.} =
    var header: wadinfo_t
    var lumpcount: cint
    var lump_p: ptr lumpinfo_t
    var length: cint
    var fileinfo: ptr filelump_t

    if reloadname == nil:
        return
    
    var file: File = open($reloadname, fmRead, -1)
    var handle: cint = getFileHandle(file)
    #posix.open(filename, O_RDONLY)

    if handle == -1:
        echo &"could not open {reloadname}"
        return

    var fs = newFileStream(file)
    var rb = fs.readData(addr(header), sizeof(header))
    echo "read: " & $rb
    lumpcount = LONG(header.numlumps)
    header.infotableofs = LONG(header.infotableofs)
    length = lumpcount * cint(sizeof(filelump_t))

    file.setFilePos(header.infotableofs)
    fileinfo = cast[ptr filelump_t](alloc(length))
    discard fs.readData(fileinfo, length)

    var tmp = cast[uint](lumpcount * sizeof(lumpinfo_t) * reloadlump)
    lump_p = cast[ptr lumpinfo_t](cast[uint](lumpinfo) + tmp)

    var i: cint = reloadlump
    var lcache = cast[ptr UncheckedArray[pointer]](lumpcache)
    
    while (i < reloadlump + lumpcount):

        if lcache[i] != nil:
            Z_Free(lumpcache[i])
        lump_p.position = LONG(fileinfo.filepos)
        lump_p.size = LONG(fileinfo.size)
        i = i + 1
        lump_p = cast[ptr lumpinfo_t](cast[uint](lump_p) + uint(sizeof(lumpinfo_t)))
        fileinfo = cast[ptr filelump_t](cast[uint](fileinfo) + uint(sizeof(filelump_t)))

        fs.close()


proc W_InitMultipleFiles*(filenames: cstringArray) {.exportc.} =
    var size: cint
    numlumps = 0
    lumpinfo = cast[ptr lumpinfo_t](alloc(1))

    var i: cint = 0
    var file: string
    while true:
        file = $filenames[i]
        echo $file
        if file == "":
            break
        echo &"add file: {file}"
        W_AddFile(cstring(file))
        i = i + 1

    echo &"lumpcache alloc numlump = {numlumps}"
    size = numlumps * cint(sizeof(pointer))
    echo &"lumpcache alloc: {size}"
    lumpcache = cast[ptr UncheckedArray[pointer]](alloc(size))

    if lumpcache == nil:
        echo "could not allocate lumpcache"
    
    zeroMem(lumpcache, size)


proc W_InitFile*(filename: cstring) {.exportc.} =
    var names: array[2, string]
    names[0] = $filename
    names[1] = newString(0)
    var namesArr = allocCStringArray(names)
    W_InitMultipleFiles(namesArr)
    deallocCStringArray(namesArr)

proc W_NumLumps*(): cint {.exportc.} =
    return numlumps;

proc lumpX(x: cint, stride: int = sizeof(lumpinfo_t)): ptr lumpinfo_t =
        cast[ptr lumpinfo_t](cast[uint](lumpinfo) + uint(stride * x))

proc lumpNameToStr(arr: array[0..7, char]): string =
        var name2 = newStringOfCap(7)
        for i in 0..7:
            if arr[i] == '\0':
                break
            add(name2, $arr[i])
        return name2

proc W_CheckNumForName*(name: cstring): cint {.exportc.} =
    var upper = ($name).substr(0,7).toUpperAscii()

    var idx = numlumps - 1

    var lump_p = lumpX(idx)
    
    while idx >= 0:
        var name2 = lumpNameToStr(lump_p.name)
        if name2.toUpperAscii() == upper:
            return idx

        idx = idx - 1
        lump_p = lumpX(idx)
        
    return -1

proc W_GetNumForName*(name: cstring): cint {.exportc.} =

    var i = W_CheckNumForName(name)
    if i == -1:
        I_Error(&"W_GetNumForName: {name} not found!")
    return i

proc W_LumpLength*(lump: cint): cint {.exportc.} =
    if lump >= numlumps:
        I_Error(&"W_LumpLength: {lump} >= {numlumps}")
    
    var lumpX = lumpX(lump)
    return lumpX.size   
    
proc W_ReadLump*(lump: cint, dest: pointer) {.exportc.} =
    if lump >= numlumps:
        I_Error(&"W_ReadLump: {lump} >= {numlumps}")
    
    var l: ptr lumpinfo_t = lumpX(lump)
    
    var handle: cint

    if l.handle == -1:
        var file: File = open($reloadname, fmRead, -1)
        handle = getFileHandle(file)
    else:
        handle = l.handle
        var file: File
        discard open(file, handle, fmRead)
        file.setFilePos(l.position)
        var fs = newFileStream(file)
        var c = fs.readData(dest, l.size)
        if c < l.size:
            I_Error(&"W_ReadLump: only read {c} of {l.size} on lump {lump}")
        if l.handle == -1:
            fs.close()
            close(file)    

proc W_CacheLumpNum*(lump: cint, tag: cint): pointer {.exportc.} = 
   
    if lump >= numlumps:
        I_Error(&"W_CacheLumpNum {lump} >= numlumps ({numlumps})")
    
    if lumpcache[lump] == nil:
        discard Z_Malloc(W_LumpLength(lump), tag, addr(lumpcache[lump]))
        W_ReadLump(lump, lumpcache[lump])
    else:
        Z_ChangeTag(lumpcache[lump], tag)
    
    return lumpcache[lump]
        
proc W_CacheLumpName*(lump: cstring, tag: cint): pointer {.exportc.} =
    let lumpNum = W_GetNumForName(lump)
    return W_CacheLumpNum(lumpNum, tag)