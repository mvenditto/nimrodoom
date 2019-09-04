{.emit: """
#include "doomstat.h"
#include "v_video.h"
#include "d_main.h"
#include "doomdef.h"
""".}

import os
{.passC:"-I" & currentSourcePath().splitPath.head .}

import sdl
import doomdef
import d_event

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
proc D_PostEvent*(ev: ptr event_t) {.importc, header:"d_main.h", noconv.}

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

proc xlatekey*(event: PEvent): cint {.exportc.} =

    var ke = evKeyboard(event);
    var rc: cint = ke.keysym.sym
    case rc:
        of K_LEFT:
            rc = KEY_LEFTARROW
        of K_RIGHT:
            rc = KEY_RIGHTARROW
        of K_DOWN:
            rc = KEY_DOWNARROW
        of K_UP:
            rc = KEY_UPARROW
        of K_ESCAPE:
            rc = KEY_ESCAPE
        of K_RETURN:
            rc = KEY_ENTER
        of K_TAB:
            rc = KEY_TAB
        of K_F1:
            rc = KEY_F1
        of K_F2:
            rc = KEY_F2
        of K_F3:
            rc = KEY_F3
        of K_F4:
            rc = KEY_F4
        of K_F5:
            rc = KEY_F5
        of K_F6:
            rc = KEY_F6
        of K_F7:
            rc = KEY_F7
        of K_F8:
            rc = KEY_F8
        of K_F9:
            rc = KEY_F9
        of K_F10:
            rc = KEY_F10
        of K_F11:
            rc = KEY_F11
        of K_F12:
            rc = KEY_F12
        of K_BACKSPACE, K_DELETE:
            rc = KEY_BACKSPACE
        of K_PAUSE:
            rc = KEY_PAUSE
        of K_KP_EQUALS, K_EQUALS:
            rc = KEY_EQUALS
        of K_KP_MINUS, K_MINUS:
            rc = KEY_MINUS
        of K_RSHIFT, K_LSHIFT:
            rc = KEY_RSHIFT
        of K_LCTRL, K_RCTRL:
            rc = KEY_RCTRL
        of K_LALT, K_LMETA, K_RALT, K_RMETA:
            rc = KEY_RALT  
        else: 
            if rc >= 65 and rc <= 90: # [a-zA-Z]
                rc = rc + 32
    return rc

proc I_ProcessEvent*(sdl_event: PEvent) {.exportc.} =
    var event: event_t
    case sdl_event.kind:
        of KEYDOWN:
            event.`type` = ev_keydown
            event.data1 = xlatekey(sdl_event)
            discard
        of KEYUP:
            event.`type` = ev_keyup
            event.data1 = xlatekey(sdl_event)
            discard;
        of QUITEV:
            I_Quit();    
        else:
            return
    D_PostEvent(addr(event))

proc I_StartTic() {.exportc.} =
    echo "> I_StartTic"
    if screen == nil:
        echo "> screen is nil"
        return

    var event: sdl.Event
    while pollEvent(addr(event)) != 0:
        echo " >process event"  
        I_ProcessEvent(addr(event))   
    
