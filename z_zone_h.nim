##  Emacs style mode select   -*- C++ -*-
## -----------------------------------------------------------------------------
##
##  $Id:$
##
##  Copyright (C) 1993-1996 by id Software, Inc.
##
##  This source is available for distribution and/or modification
##  only under the terms of the DOOM Source Code License as
##  published by id Software. All rights reserved.
##
##  The source is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
##  for more details.
##
##  DESCRIPTION:
##       Zone Memory Allocation, perhaps NeXT ObjectiveC inspired.
## 	Remark: this was the only stuff that, according
## 	 to John Carmack, might have been useful for
## 	 Quake.
##
## ---------------------------------------------------------------------

##
##  ZONE MEMORY
##  PU - purge tags.
##  Tags < 100 are not overwritten until freed.
discard """
const
  PU_STATIC* = 1
  PU_SOUND* = 2
  PU_MUSIC* = 3
  PU_DAVE* = 4
  PU_LEVEL* = 50
  PU_LEVSPEC* = 51
  PU_PURGELEVEL* = 100
  PU_CACHE* = 101

  ZONEID = 0x1d4a11

type
  memblock_s* {.bycopy.} = object
    size*: cint                ##  including the header and possibly tiny fragments
    user*: ptr pointer         ##  NULL if a free block
    tag*: cint                 ##  purgelevel
    id*: cint                  ##  should be ZONEID
    next*: ptr memblock_s
    prev*: ptr memblock_s

  memzone_t* {.bycopy.} = object
    size*: cint
    blocklist*: memblock_t
    rover*: ptr memblock_t
  
  memblock_t* = memblock_s


proc Z_Init*() {.importc, header:"z_zone.h".} 
proc Z_Malloc*(size: cint; tag: cint; `ptr`: pointer): pointer {.importc, header:"z_zone.h".} 
proc Z_Free*(`ptr`: pointer) {.importc, header:"z_zone.h".} 
proc Z_FreeTags*(lowtag: cint; hightag: cint) {.importc, header:"z_zone.h".} 
proc Z_DumpHeap*(lowtag: cint; hightag: cint) {.importc, header:"z_zone.h".} 
proc Z_FileDumpHeap*(f: ptr FILE) {.importc, header:"z_zone.h".} 
proc Z_CheckHeap*() {.importc, header:"z_zone.h".} 
proc Z_ChangeTag2*(`ptr`: pointer; tag: cint) {.importc, header:"z_zone.h".} 
proc Z_FreeMemory*(): cint {.importc, header:"z_zone.h".} 


template Z_ChangeTag*(p, t: untyped) =
  let pp = cast[uint](p) - uint(sizeof(memblock_s))
  if cast[ptr memblock_s](pp).id != 0x1d4a11:
    let(file, line, col) = instantiationInfo()
    I_Error("Z_CT at: " & $(cast[ptr memblock_s](pp).id) & " : " & $file & ":" & $line & ":" & $col);
  Z_ChangeTag2(p, t);
"""

const
  PU_STATIC* = 1
  PU_SOUND* = 2
  PU_MUSIC* = 3
  PU_DAVE* = 4
  PU_LEVEL* = 50
  PU_LEVSPEC* = 51
  PU_PURGELEVEL* = 100
  PU_CACHE* = 101

  ZONEID* = 0x1d4a11
  MAINFRAGMENT* = 64

type
  memblock_s* {.bycopy.} = object
    size*: cint                ##  including the header and possibly tiny fragments
    user*: ptr pointer         ##  NULL if a free block
    tag*: cint                 ##  purgelevel
    id*: cint                  ##  should be ZONEID
    next*: ptr memblock_s
    prev*: ptr memblock_s

  memzone_t*  {.bycopy.} = object
    size*: cint
    blocklist*: memblock_t
    rover*: ptr memblock_t
  
  memblock_t* {.bycopy.} = memblock_s

proc Z_Init*() {.importc, header:"z_zone.h".} 
proc Z_Malloc*(size: cint; tag: cint; `ptr`: pointer): pointer {.importc, header:"z_zone.h".} 
proc Z_Free*(`ptr`: pointer) {.importc, header:"z_zone.h".} 
proc Z_FreeTags*(lowtag: cint; hightag: cint) {.importc, header:"z_zone.h".} 
proc Z_DumpHeap*(lowtag: cint; hightag: cint) {.importc, header:"z_zone.h".} 
proc Z_FileDumpHeap*(f: ptr FILE) {.importc, header:"z_zone.h".} 
proc Z_CheckHeap*() {.importc, header:"z_zone.h".} 
proc Z_ChangeTag2*(`ptr`: pointer; tag: cint) {.importc, header:"z_zone.h".} 
proc Z_FreeMemory*(): cint {.importc, header:"z_zone.h".} 