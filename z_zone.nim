import ptrutils
import strformat
import logging
import z_zone_h

var mainzone: ptr memzone_t

template doWhile(a: untyped, b: untyped): untyped =
  while true:
    b
    if not a:
      break

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

proc I_Error(msg: cstring) {.importc, header:"i_system.h", varargs.}
proc I_ZoneBase(size: ptr cint): ptr byte  {.importc, header:"i_system.h".}

proc Z_Init*() {.exportc.} =
    var 
        blockk: ptr memblock_t
        size: cint
    
    when defined(debug):
        mainzone = cast[ptr memzone_t](I_ZoneBase(size))
    else:
        mainzone = cast[ptr memzone_t](I_ZoneBase(addr(size)))

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


proc Z_FreeMemory*(): cint {.exportc.} =
    var
        blockk: ptr memblock_t
        free: cint
    
    free = 0
    blockk = mainzone.blocklist.next

    while blockk != addr(mainzone.blocklist):

        if blockk.user == nil or blockk.tag >= PU_PURGELEVEL:
            free += blockk.size

        blockk = blockk.next
    
    return free

proc Z_Free*(pntr: pointer) {.exportc.} =
    var
        blockk: ptr memblock_t
        other: ptr memblock_t
   
    blockk = cast[ptr memblock_t](cast[uint](pntr) - uint(sizeof(memblock_t)))

    echo &"free {cast[uint](blockk)} of size {blockk.size}"

    if blockk.id != ZONEID:
        I_Error ("Z_Free: freed a pointer without ZONEID");
    
    
    if blockk.user > cast[ptr pointer](0x100):
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
            

proc Z_DumpHeap*(lowtag: cint, hightag: cint) {.exportc.} =
    var blockk: ptr memblock_t

    debug(&"zone size: {mainzone.size}  location: {cast[uint](addr(mainzone))}")
    debug(&"tag range: {lowtag} to {hightag}")

    blockk = mainzone.blocklist.next
    while true:

        debug("Z_DumpHeap: loop")

        if blockk.tag >= lowtag and blockk.tag <= hightag:
            debug(&"block:{@blockk} size:{blockk.size} user:{@(blockk.user)} tag:{blockk.tag} id:{blockk.id}")

        if blockk.next == addr(mainzone.blocklist):
            break # all blocks have been hit
        
        if cast[ptr byte](cast[uint](blockk) + uint(blockk.size)) != cast[ptr byte](blockk.next):
            error("ERROR: block size does not touch the next block"); 
        
        if blockk.next.prev != blockk:
            error("ERROR: next block doesn't have proper back link")
        
        if blockk.user == nil and blockk.next.user == nil:
            error("ERROR: two consecutive free blocks")

        blockk = blockk.next

proc Z_CheckHeap*() {.exportc.} =
    var 
        blockk: ptr memblock_t
        
    blockk = mainzone.blocklist.next
    
    while true:
        if blockk.next == addr(mainzone.blocklist):
            break # all blocks have been hit

        if cast[ptr byte](cast[uint](blockk) + uint(blockk.size)) != cast[ptr byte](blockk.next):
            I_Error("Z_CheckHeap: block size does not touch the next block"); 
        
        if blockk.next.prev != blockk:
            I_Error("Z_CheckHeap: next block doesn't have proper back link")
        
        if blockk.user == nil and blockk.next.user == nil:
            I_Error("Z_CheckHeap: two consecutive free blocks")

        blockk = blockk.next  
    
proc Z_FileDumpHeap*(f: File) {.exportc.} =
    var 
        blockk: ptr memblock_t
    
    f.writeLine(&"zone size: {mainzone.size}  location: {@mainzone}")

    blockk = mainzone.blocklist.next
    while true:

        f.writeLine(&"block:{@blockk} size:{blockk.size} user:{@(blockk.user)} tag:{blockk.tag}")

        if blockk.next == addr(mainzone.blocklist):
            break # all blocks have been hit
        
        if cast[ptr byte](cast[uint](blockk) + uint(blockk.size)) != cast[ptr byte](blockk.next):
            error("ERROR: block size does not touch the next block"); 
        
        if blockk.next.prev != blockk:
            error("ERROR: next block doesn't have proper back link")
        
        if blockk.user == nil and blockk.next.user == nil:
            error("ERROR: two consecutive free blocks")

        blockk = blockk.next

proc Z_FreeTags*(lowtag: cint, hightag: cint) {.exportc.} =
    var 
        blockk: ptr memblock_t
        next: ptr memblock_t
    
    blockk = mainzone.blocklist.next
    while(blockk != addr(mainzone.blocklist)):
        next = blockk.next

        if blockk.user == nil:
            debug(&"Z_FreeTags already free? => {@blockk}")
            blockk = next
            continue
        
        if blockk.tag >= lowtag and blockk.tag <= hightag:
            debug(&"Z_FreeTags => {@blockk}")
            Z_Free(cast[ptr pointer](cast[uint](blockk) + uint(sizeof(memblock_t))))
        
        debug(&"Z_FreeTags {lowtag} {hightag} ? {blockk.tag}")
        blockk = next

proc Z_ChangeTag2*(ptrr: pointer, tag: cint, file: cstring, line: cint) {.exportc.} =
    var 
        blockk: ptr memblock_t
    
    blockk = cast[ptr memblock_t](cast[uint](ptrr) - uint(sizeof(memblock_t)))

    if blockk.id != ZONEID:
        I_Error("Z_ChangeTag: freed a pointer without ZONEID")

    if tag >= PU_PURGELEVEL and cast[uint](blockk.user) < 0x100:
        I_Error("Z_ChangeTag: an owner is required for purgable blocks")

    blockk.tag = tag

proc Z_Malloc*(
    sizee: cint, 
    tag: cint, 
    user: pointer): pointer {.exportc.} =
    var
        extra: cint
        start: ptr memblock_t
        rover: ptr memblock_t
        newblock: ptr memblock_t
        base: ptr memblock_t
        size: cint

    size = (sizee + 3) and not 3
    size += cint(sizeof(memblock_t))
    
    base = mainzone.rover

    if base.prev.user == nil:
        base = base.prev

    rover = base
    start = base.prev

    doWhile base.user != nil or base.size < size:

        # debug(&"Z_Malloc :. loop. {@rover} == {@start}")

        if rover == start:
            Z_FileDumpHeap(open("dump", fmWrite))
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
        base.user = cast[ptr pointer](user)
        var pp = cast[pointer](cast[uint](base) + uint(sizeof(memblock_t)))
        cast[ptr pointer](user)[] = pp
    else:
        if tag >= PU_PURGELEVEL:
            I_Error("Z_Malloc: an owner is required for purgable blocks");
        base.user = cast[ptr pointer](2)
    
    base.tag = tag
    mainzone.rover = base.next
    base.id = ZONEID

    return cast[pointer](cast[uint](base) + uint(sizeof(memblock_t)))

