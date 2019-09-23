from doomtypes import 
        fixed_t,
        doWhile,
        lighttable_t,
        patch_t

from i_video import screens
from doomdef import GameMode_t
from doomdef import SCREENWIDTH, SCREENHEIGHT
import z_zone_h
import w_wad

import strformat
import logging

const
    MAXWIDTH = 1120
    MAXHEIGHT = 832
    FRACBITS* = 16
    SBARHEIGHT = 32
    FUZZTABLE = 50 
    FUZZOFF = SCREENWIDTH

var
    ylookup {.exportc.}: array[MAXHEIGHT, ptr byte]
    columnofs{.exportc.}: array[MAXWIDTH, int]
    dc_x {.exportc.}: cint
    dc_yh {.exportc.}: cint
    dc_yl {.exportc.}: cint
    dc_iscale {.exportc.}: fixed_t
    dc_texturemid {.exportc.}: fixed_t
    dc_source {.exportc.}: ptr UncheckedArray[byte]
    dccount {.exportc.}: cint 
    centery {.exportc.}: cint
    dc_colormap {.exportc.}: ptr UncheckedArray[lighttable_t]
    viewwidth {.exportc.}: cint
    scaledviewwidth {.exportc.}: cint
    viewheight {.exportc.}: cint
    viewwindowx {.exportc.}: cint
    viewwindowy {.exportc.}: cint
    viewimage {.exportc.}: ptr UncheckedArray[byte]
    translations {.exportc.}: array[3, array[256, byte]]

var 
    fuzzpos {.exportc.}: cint
    fuzzoffset {.exportc.}: array[FUZZTABLE, int] = [
        FUZZOFF,-FUZZOFF,FUZZOFF,-FUZZOFF,FUZZOFF,FUZZOFF,-FUZZOFF,
        FUZZOFF,FUZZOFF,-FUZZOFF,FUZZOFF,FUZZOFF,FUZZOFF,-FUZZOFF,
        FUZZOFF,FUZZOFF,FUZZOFF,-FUZZOFF,-FUZZOFF,-FUZZOFF,-FUZZOFF,
        FUZZOFF,-FUZZOFF,-FUZZOFF,FUZZOFF,FUZZOFF,FUZZOFF,FUZZOFF,-FUZZOFF,
        FUZZOFF,-FUZZOFF,FUZZOFF,FUZZOFF,-FUZZOFF,-FUZZOFF,FUZZOFF,
        FUZZOFF,-FUZZOFF,-FUZZOFF,-FUZZOFF,-FUZZOFF,FUZZOFF,FUZZOFF,
        FUZZOFF,FUZZOFF,-FUZZOFF,FUZZOFF,FUZZOFF,-FUZZOFF,FUZZOFF 
    ]
    colormaps {.exportc.}: ptr UncheckedArray[lighttable_t]
    dc_translation {.exportc.}: ptr UncheckedArray[byte]
    translationtables {.exportc.}: ptr UncheckedArray[byte]

var
    ds_xfrac* {.exportc.}: fixed_t
    ds_yfrac* {.exportc.}: fixed_t
    ds_xstep* {.exportc.}: fixed_t
    ds_ystep* {.exportc.}: fixed_t
    ds_y* {.exportc}: cint
    ds_x1* {.exportc}: cint
    ds_x2* {.exportc}: cint
    ds_colormap {.exportc.}: ptr UncheckedArray[lighttable_t]
    ds_source {.exportc.}: ptr UncheckedArray[byte]
    gamemode {.exportc.}: GameMode_t

proc R_DrawColumn*() {.exportc.} =
    var
        count: cint
        dest: ptr byte
        frac: fixed_t
        fracstep: fixed_t
    
    count = dc_yh - dc_yl

    if count < 0:
        return

    dest = cast[ptr byte](cast[uint](ylookup[dc_yl]) + uint(columnofs[dc_x]))
    fracstep = dc_iscale
    frac = dc_texturemid + (dc_yl - centery) * fracstep

    proc deccount(): cint =
        result = count
        count -= 1

    doWhile deccount() > 0:
        var ds = dc_source[(frac shr FRACBITS) and 127]
        dest[] = dc_colormap[ds]
        dest = cast[ptr byte](cast[uint](dest) + SCREENWIDTH)
        frac += fracstep

proc R_DrawColumnLow*() {.exportc.} =
    var
        count: cint
        dest: ptr byte
        dest2: ptr byte
        frac: fixed_t
        fracstep: fixed_t
    
    count = dc_yh + dc_yl

    if count < 0:
        return;

    dc_x = dc_x shl 1

    dest = cast[ptr byte](cast[uint](ylookup[dc_yl]) + uint(columnofs[dc_x]))
    dest2 = cast[ptr byte](cast[uint](ylookup[dc_yl]) + uint(columnofs[dc_x + 1]))

    fracstep = dc_iscale
    frac = dc_texturemid + (dc_yl - centery) * fracstep

    proc deccount(): cint =
        result = count
        count -= 1

    doWhile deccount() > 0:
        var val = dc_colormap[dc_source[((frac shr FRACBITS) and 127)]]
        dest2[] = val
        dest[] = val
        dest = cast[ptr byte](cast[uint](dest) + SCREENWIDTH)
        dest2 = cast[ptr byte](cast[uint](dest2) + SCREENWIDTH)
        frac += fracstep

proc R_DrawFuzzColumn*() {.exportc.} =
    var
        count: cint
        dest: ptr byte
        frac: fixed_t
        fracstep: fixed_t

    if dc_yl != 0:
        dc_yl = 1
    
    if dc_yh == viewheight - 1:
        dc_yh = viewheight - 2

    count = dc_yh - dc_yl

    if count < 0:
        return

    dest = cast[ptr byte](cast[uint](ylookup[dc_yl]) + uint(columnofs[dc_x]))

    fracstep = dc_iscale
    frac = dc_texturemid + (dc_yl - centery)*fracstep

    proc deccount(): cint =
        result = count
        count -= 1

    doWhile deccount() > 0:
        dest[] = colormaps[6*256+cast[ptr UncheckedArray[byte]](dest)[fuzzoffset[fuzzpos]].int]

        fuzzpos += 1
        if fuzzpos == FUZZTABLE:
            fuzzpos = 0
        
        dest = cast[ptr byte](cast[uint](dest) + SCREENWIDTH)
        frac += fracstep

proc R_DrawTranslatedColumn() {.exportc.} =
    var
        count: cint
        dest: ptr byte
        frac: fixed_t
        fracstep: fixed_t
    
    count = dc_yh - dc_yl

    if count < 0:
        return

    dest = cast[ptr byte](cast[uint](ylookup[dc_yl]) + uint(columnofs[dc_x]))

    fracstep = dc_iscale
    frac = dc_texturemid + (dc_yl - centery)*fracstep

    proc deccount(): cint =
        result = count
        count -= 1

    doWhile deccount() > 0:
        dest[] = dc_colormap[dc_translation[frac shr FRACBITS]]
        dest = cast[ptr byte](cast[uint](dest) + SCREENWIDTH)
        frac += fracstep

proc R_InitTranslationTables*() {.exportc.} =
    
    translationtables = 
        cast[ptr UncheckedArray[byte]]((Z_Malloc(cint(256*3+255), PU_STATIC, cast[pointer](0))))
    
    translationtables = cast[ptr UncheckedArray[byte]]((cast[int](translationtables)+255) and not 255)

    for i in 0..255:
        if i >= 0x70 and i <= 0x7f:
            translationtables[i] = 0x60u8 + (i.byte and 0xf)
            translationtables[i+256] = 0x40u8 + (i.byte and 0xf)
            translationtables[i+512] = 0x20u8 + (i.byte and 0xf)
        else:
            translationtables[i+512] = i.byte
            translationtables[i+256] = i.byte
            translationtables[i] = i.byte

proc R_DrawSpan*() {.exportc.} =
    var
        xfrac: fixed_t
        yfrac: fixed_t
        dest: ptr byte
        count: cint
        spot: cint

    xfrac = ds_xfrac
    yfrac = ds_yfrac

    dest = cast[ptr byte](cast[uint](ylookup[ds_y]) + uint(columnofs[ds_x1]))

    count = ds_x2 - ds_x1

    proc deccount(): cint =
        result = count
        count -= 1

    doWhile deccount() > 0:
        spot = ((yfrac shr (16 - 6)) and (63 * 64)) + (( xfrac shr 16) and 63)

        dest[] = ds_colormap[ds_source[spot]]
        dest = cast[ptr byte](cast[uint](dest) + 1)   

        xfrac += ds_xstep
        yfrac += ds_ystep 

proc R_DrawSpanLow*() {.exportc.} =
    var
        xfrac: fixed_t
        yfrac: fixed_t
        dest: ptr byte
        count: cint
        spot: cint

    xfrac = ds_xfrac
    yfrac = ds_yfrac

    ds_x1 = ds_x1 shl 1
    ds_x2 = ds_x2 shl 1

    dest = cast[ptr byte](cast[uint](ylookup[ds_y]) + uint(columnofs[ds_x1]))

    count = ds_x2 - ds_x1

    proc deccount(): cint =
        result = count
        count -= 1

    doWhile deccount() > 0:
        spot = ((yfrac shr (16 - 6)) and (63 * 64)) + (( xfrac shr 16) and 63)

        dest[] = ds_colormap[ds_source[spot]]
        dest = cast[ptr byte](cast[uint](dest) + 1)   
        dest[] = ds_colormap[ds_source[spot]]
        dest = cast[ptr byte](cast[uint](dest) + 1)  

        xfrac += ds_xstep
        yfrac += ds_ystep 

proc R_InitBuffer*(width: cint, height: cint) {.exportc.} =
    
    viewwindowx = (SCREENWIDTH-width) shr 1; 
    
    for i in 0..width-1:
        columnofs[i] = viewwindowx + i

    if width == SCREENWIDTH:
        viewwindowy = 0
    else:
        viewwindowy = (SCREENHEIGHT-SBARHEIGHT-height) shr 1; 
    
    for i in 0..height-1:
        var s0 = cast[uint](screens[0]) + uint((i + viewwindowy) * SCREENWIDTH)
        ylookup[i] = cast[ptr byte](s0)

proc V_DrawPatch(x: cint, y: cint, scrn: cint, patch: ptr patch_t) {.importc, header:"v_video.h".}
proc R_FillBackScreen() {.exportc.} =
    var
        src: ptr byte
        dest: ptr byte
        x: cint
        y: cint
        patch: ptr patch_t
    
    var name1: cstring = "FLOOR7_2"
    var name2: cstring = "GRNROCK"
    var name: ptr cstring

    if scaledviewwidth == SCREENWIDTH:
        return
    
    if gamemode == commercial:
        name = addr(name2)
    else:
        name = addr(name1)
    
    src = cast[ptr byte](
        W_CacheLumpName(name[], PU_CACHE))
    
    dest = cast[ptr byte](screens[1])

    
    for y in 0..SCREENWIDTH-SBARHEIGHT-1:

        for x in 0..int(SCREENWIDTH/64)-1:
            var srcPtr = cast[ptr byte](cast[uint](src) + ((y and 63) shl 6).uint)
            copyMem(dest.pointer, srcPtr.pointer, 64)
            dest = cast[ptr byte](cast[uint](dest) + 64)

        if (SCREENWIDTH and 63) != 0:
            var srcPtr = cast[ptr byte](cast[uint](src) + ((y and 63) shl 6).uint)
            copyMem(dest.pointer, srcPtr.pointer, SCREENWIDTH and 64)
            dest = cast[ptr byte](cast[uint](dest) + (SCREENWIDTH and 64))

    patch = cast[ptr patch_t](W_CacheLumpName("brdr_t", PU_CACHE))

    x = 0
    while x < scaledviewwidth:
        V_DrawPatch(viewwindowx+x,viewwindowy-8,1,patch)
        patch = cast[ptr patch_t](W_CacheLumpName("brdr_b", PU_CACHE))
        x += 8

    x = 0
    while x < scaledviewwidth:
        V_DrawPatch(viewwindowx+x,viewwindowy+viewheight,1,patch);
        patch = cast[ptr patch_t](W_CacheLumpName("brdr_b", PU_CACHE))
        x += 8
    
    y = 0
    while y < viewheight:
        V_DrawPatch(viewwindowx-8,viewwindowy+y,1,patch);
        patch = cast[ptr patch_t](W_CacheLumpName("brdr_r", PU_CACHE))
        y += 8

    y = 0
    while y < viewheight:
        V_DrawPatch(viewwindowx+scaledviewwidth,viewwindowy+y,1,patch);
        y += 8

    V_DrawPatch(viewwindowx-8,
        viewwindowy-8,
        1,
        cast[ptr patch_t](W_CacheLumpName("brdr_tl",PU_CACHE)))
    
    V_DrawPatch(viewwindowx+scaledviewwidth,
        viewwindowy-8,
        1,
        cast[ptr patch_t](W_CacheLumpName("brdr_tr",PU_CACHE)))
    
    V_DrawPatch(viewwindowx-8,
        viewwindowy+viewheight,
        1,
        cast[ptr patch_t](W_CacheLumpName("brdr_bl",PU_CACHE)))
    
    V_DrawPatch(viewwindowx+scaledviewwidth, 
        viewwindowy+viewheight,
        1,
        cast[ptr patch_t](W_CacheLumpName("brdr_br",PU_CACHE)))

proc R_VideoErase*(ofs: cuint, count: cint) {.exportc.} =
    var screen0 = cast[uint](screens[0]) + ofs
    var screen1 = cast[uint](screens[1]) + ofs
    # debug(&"R_VideoErase {ofs} {count}")
    copyMem(cast[pointer](screen0), cast[pointer](screen1), count)

proc V_MarkRect(x: cint, y: cint, width: cint, height: cint) {.importc, header:"v_video.h".}

proc R_DrawViewBorder*() {.exportc.} =
    var 
        top: cint
        side: cint
        ofs: cint
    
    if scaledviewwidth == SCREENWIDTH:
        return
    
    top = ((SCREENHEIGHT-SBARHEIGHT)-viewheight) shr 1
    side = (SCREENWIDTH-scaledviewwidth) shr 1

    # copy top and one line of left side 
    R_VideoErase(0, top*SCREENWIDTH+side); 
 
    # copy one line of right side and bottom 
    ofs = (viewheight+top)*SCREENWIDTH-side; 
    R_VideoErase(ofs.cuint, top*SCREENWIDTH+side);
 
    # copy sides using wraparound 
    ofs = top*SCREENWIDTH + SCREENWIDTH-side
    side = side shl 1

    for i in 1..viewheight - 1:
        R_VideoErase(ofs.cuint, side)
        ofs += SCREENWIDTH
    
    V_MarkRect(0,0,SCREENWIDTH, SCREENHEIGHT-SBARHEIGHT)

{.emit: """/*VARSECTION*/ 
NIM_EXTERNC
""".}