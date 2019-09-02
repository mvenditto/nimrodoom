{.emit: """
#include <stdlib.h>
#include <unistd.h>
#include <sys/ipc.h>
#include <sys/shm.h>
#include <stdarg.h>
#include <sys/time.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <errno.h>
#include "doomstat.h"
#include "i_system.h"
#include "v_video.h"
#include "m_argv.h"
#include "d_main.h"
#include "doomdef.h"
""".}

import os
{.passC:"-I" & currentSourcePath().splitPath.head .}

import sdl

var screen: PSurface
var firsttimee = true
var X_width: cint
var X_height: cint
const multiply: cint = 1
var colors: array[256, sdl.Color]

const SCREENWIDTH: cint = 320
const SCREENHEIGHT: cint = 200

proc I_Quit {.importc, header:"i_system.h", noconv.}
proc I_Error(error: cstring) {.importc, header:"i_system.h", noconv.}

var screens* {.importc, header:"v_video.h".}: array[5, ptr UncheckedArray[byte]]

var gammatable {.importc, header:"v_video.h".}: array[5, array[256, byte]]
var usegamma {.importc, header:"v_video.h".}: cint

proc I_InitGraphics*(): void {.exportc.} =
    echo "> I_InitGraphics: " & $SCREENWIDTH & " " & $SCREENHEIGHT
    
    #if not firsttime:
    #    return
    #firsttime = false

    setControlCHook(I_Quit);

    X_width = SCREENWIDTH * multiply;
    X_height = SCREENHEIGHT * multiply;

    if init(INIT_EVERYTHING) == -1:
        I_Error("SDL initializing error")
    
    screen = setVideoMode(SCREENWIDTH, SCREENHEIGHT, 8, SWSURFACE)

    if screen == nil:
        I_Error("SDL setting video mode error")

    var sin = screen == nil
    echo "> " & $sin
    screens[0] = cast[ptr UncheckedArray[byte]](screen.pixels)
    
proc I_ShutdownGraphics*(): void {.exportc.} =
    echo "> I_ShutdownGraphics"
    freeSurface(screen)

proc I_UpdateNoBlit*(): void {.exportc.} =
    echo "> I_UpdateNoBlit"
    discard

proc I_FinishUpdate*(): void {.exportc.} =
    echo "> I_FinishUpdate"
    discard flip(screen)

template `\\`(x: untyped): untyped = cast[ptr type(x[0])](addr x)

proc I_SetPalette*(palette: ptr byte): void {.exportc.} =
    echo "> I_SetPalette"

    echo $palette[]

    # var palette = cast[ptr UncheckedArray[byte]](palette_void_ptr)
    var pi: int = 0
    var c: byte
    var firstcall = true

    if firstcall:
        firstcall = false

    var pp: ptr byte = palette

    proc inc(): ptr byte =
        cast[ptr byte](cast[uint](pp) + 1u)
          
    for i in 0..255:
        c = gammatable[usegamma][pp[]]
        pp = inc()
        colors[i].r = (c shl 8) + c
        c = gammatable[usegamma][pp[]]
        pp = inc()
        colors[i].g = (c shl 8) + c
        c = gammatable[usegamma][pp[]]
        pp = inc()
        colors[i].b = (c shl 8) + c
    
    discard screen.setColors(\\colors, 0, 256)
    
    
proc I_StartFrame*() {.exportc.} = 
    echo "> I_StartFrame"
    discard

proc I_ReadScreen*(src: ptr UncheckedArray[byte]) {.exportc.} =
    echo "> I_ReadScreen"
    copyMem(src, screens[0], SCREENWIDTH * SCREENHEIGHT)

proc xlatekey*(event: PEvent): int {.exportc.}=
    return 0

proc I_ProcessEvent*(sdl_event: PEvent) {.exportc.} =
    discard

proc I_StartTic() {.exportc.} =
    echo "> I_StartTic"
    if screen == nil:
        echo "> screen is nil"
        return

    var event: sdl.Event
    while pollEvent(addr(event)) == 1:  
        I_ProcessEvent(addr(event))   
    
