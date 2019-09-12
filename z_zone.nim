import strutils
import strformat
import os

when defined(debug):
    proc I_Error(msg: cstring) = 
        echo msg
    proc I_ZoneBase(size: var cint): ptr byte = 
        size = 6*1024*1024;
        return cast[ptr byte](alloc(size))
else:
    proc I_Error(msg: cstring) {.importc, header:"i_system.h", varargs.}
    proc I_ZoneBase(size: ptr cint): ptr byte  {.importc, header:"i_system.h".}

type
    memblock_s* {.bycopy, pure.} = object
        size*: cint                ##  including the header and possibly tiny fragments
        user*: ptr pointer         ##  NULL if a free block
        tag*: cint                 ##  purgelevel
        id*: cint                  ##  should be ZONEID
        next*: ptr memblock_s
        prev*: ptr memblock_s
    
    memblock_t = memblock_s

    memzone_t* {.bycopy, pure.} = object
        size*: cint
        blocklist*: memblock_t
        rover*: ptr memblock_t
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
  MAINFRAGMENT = 64

var mainzone: ptr memzone_t

proc Z_ClearZone*(zone: ptr memzone_t) {.exportc.} =
    
    var blockk = cast[ptr memblock_t](cast[uint](zone) + uint(sizeof(memzone_t)))
    zone.blocklist.next = blockk
    zone.blocklist.prev = blockk

    zone.blocklist.user = cast[ptr pointer](zone)
    zone.blocklist.tag = PU_STATIC
    zone.rover = blockk
    
    blockk.prev = addr(zone.blocklist)
    blockk.next = addr(zone.blocklist)

    blockk.user = nil
    blockk.size = zone.size - cint(sizeof(memzone_t))


proc Z_Init*() {.exportc.} =
    var 
        blockk: ptr memblock_t
        size: cint
    
    mainzone = cast[ptr memzone_t](I_ZoneBase(size))
    mainzone.size = size

    blockk = cast[ptr memblock_t](cast[uint](mainzone) + uint(sizeof(memzone_t)))
    mainzone.blocklist.next = blockk
    mainzone.blocklist.prev = blockk
    
    mainzone.blocklist.user = cast[ptr pointer](mainzone)
    mainzone.blocklist.tag = PU_STATIC
    mainzone.rover = blockk

    blockk.prev = addr(mainzone.blocklist)
    blockk.next = addr(mainzone.blocklist)

    blockk.user = nil
    
    blockk.size = mainzone.size - cint(sizeof(memzone_t))

proc Z_Free*(`ptr`: ptr pointer) {.exportc.} =
    var
        blockk: ptr memblock_t
        other: ptr memblock_t
    
    blockk = cast[ptr memblock_t](cast[uint](`ptr`) - uint(sizeof(memblock_t)))

    if blockk.id != ZONEID:
        I_Error ("Z_Free: freed a pointer without ZONEID")
    
    if blockk.user > cast[ptr pointer](0x100):
        # ???
        blockk.user[] = nil
    
    blockk.user = nil
    blockk.tag = 0
    blockk.id = 0

    other = blockk.prev

    if other.user == nil:
        other.size += blockk.size
        other.next = blockk.next
        other.next.prev = other

        if blockk == mainzone.rover:
            mainzone.rover = other
        
        blockk = other
    
    other = blockk.next

    if other.user == nil:
        blockk.size += other.size
        blockk.next = other.next
        blockk.next.prev = blockk

        if other == mainzone.rover:
            mainzone.rover = blockk

proc Z_Malloc*(
    size: var cint, 
    tag: cint, 
    user: var pointer): pointer {.exportc.} =
    var
        extra: cint
        start: ptr memblock_t
        rover: ptr memblock_t
        newblock: ptr memblock_t
        base: ptr memblock_t

    size = (size + 3) and not 3
    size += cint(sizeof(memblock_t))
    
    base = mainzone.rover

    if base.prev.user == nil:
        base = base.prev

    rover = base
    start = base.prev

    while base.user != nil or base.size < size:
        if rover == start:
            I_Error(&"Z_Malloc: failed on allocation of {size} bytes");
        
        if rover.user != nil:
            if rover.tag < PU_PURGELEVEL:
                rover = rover.next
                base = rover
            else:
                base = base.prev
                Z_Free(cast[ptr pointer](cast[uint](rover) + uint(sizeof(memblock_t))))
                base = base.next
                rover = base.next
        else:
            rover = rover.next

    extra = base.size - size
    
    if extra > MAINFRAGMENT:
        newblock = cast[ptr memblock_t](cast[uint](base) + uint(size))
        newblock.size = extra

        newblock.user = nil
        newblock.tag = 0
        newblock.prev = base
        newblock.next = base.next
        newblock.next.prev = newblock

        base.next = newblock
        base.size = size
    
    if user != nil:
        base.user = addr(user)
        user = cast[pointer](
            cast[uint](base) + uint(sizeof(memblock_t)))
    else:
        if tag >= PU_PURGELEVEL:
            I_Error("Z_Malloc: an owner is required for purgable blocks");
        base.user = cast[ptr pointer](2)

    base.tag = tag

    mainzone.rover = base.next

    base.id = ZONEID

    return cast[pointer](cast[uint](base) + uint(sizeof(memblock_t)))
