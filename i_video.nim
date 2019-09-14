{.emit: """
#include "doomstat.h"
#include "v_video.h"
#include "d_main.h"
#include "doomdef.h"
""".}

import os
{.passC:"-I" & currentSourcePath().splitPath.head .}

import sdl2/sdl
import doomdef
import d_event

var firsttimee = true
var X_width: cint
var X_height: cint
const multiply: cint = 1
var colors: array[256, sdl.Color]

const
  Title = "nimrod00m"
  WindowFlags = 0
  RendererFlags = sdl.RendererAccelerated


type
  App = ref AppObj
  AppObj = object
    window*: sdl.Window # Window pointer
    renderer*: sdl.Renderer # Rendering state pointer

var app = App(window: nil, renderer: nil)
var surface: Surface
var psurface: Surface
var texture: Texture

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

    if init(sdl.InitVideo) == -1:
        I_Error("SDL initializing error")
    
    app.window = sdl.createWindow(
        Title,
        sdl.WindowPosUndefined,
        sdl.WindowPosUndefined,
        X_width * 2,
        X_height * 2,
        WindowFlags
    )

    if app.window == nil:
        I_Error("ERROR: Can't create window: ")

    # Create renderer
    app.renderer = sdl.createRenderer(app.window, -1, RendererFlags)
    if app.renderer == nil:
        I_Error("ERROR: Can't create renderer: ")
    
    discard sdl.setHint(sdl.HINT_RENDER_SCALE_QUALITY, "nearest")
    discard app.renderer.renderSetLogicalSize(320, 200)

    surface = sdl.createRGBSurface(0, 320, 200, 8, 0, 0, 0, 0)
    psurface = sdl.createRGBSurface(0, 320, 200, 32, 0, 0, 0, 0)

    texture = app.renderer.createTexture(
        sdl.PIXELFORMAT_RGBA8888, sdl.TEXTUREACCESS_STREAMING, 320, 200);


    screens[0] = cast[ptr UncheckedArray[byte]](surface.pixels)
    
proc I_ShutdownGraphics*(): void {.exportc.} =
    app.renderer.destroyRenderer()
    app.window.destroyWindow()
    sdl.quit()

proc I_UpdateNoBlit*(): void {.exportc.} =
    #echo "> I_UpdateNoBlit"
    discard

proc I_FinishUpdate*(): void {.exportc.} =
    #echo "> I_FinishUpdate"
    discard sdl.blitSurface(surface, nil, psurface, nil)
    var pitch: cint
    var pixels: pointer

    discard sdl.lockTexture(texture, nil, addr(pixels), addr(pitch))
    discard sdl.convertPixels(320, 200, 
        psurface.format.format, 
        psurface.pixels, psurface.pitch, 
        sdl.PIXELFORMAT_RGBA8888, pixels, pitch)
    sdl.unlockTexture(texture)
    discard app.renderer.renderCopy(texture, nil, nil)
    app.renderer.renderPresent();

template `\\`(x: untyped): untyped = cast[ptr type(x[0])](addr x)

proc I_SetPalette*(palette: ptr byte): void {.exportc.} =
    #echo "> I_SetPalette"

    # echo $palette[]

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
    
    # discard screen.setColors(\\colors, 0, 256)
    discard sdl.setPaletteColors(surface.format.palette, addr(colors[0]), 0, 256)
    
    
proc I_StartFrame*() {.exportc.} = 
    #echo "> I_StartFrame"
    discard

proc I_ReadScreen*(src: ptr UncheckedArray[byte]) {.exportc.} =
    #echo "> I_ReadScreen"
    copyMem(src, screens[0], SCREENWIDTH * SCREENHEIGHT)

proc xlatekey*(e: Event): cint {.exportc.} =
    var rc: cint
    case e.key.keysym.sym:
        of sdl.K_LEFT:
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
        of K_LALT, K_LGUI, K_RALT, K_RGUI:
            rc = KEY_RALT  
        else: 
            if rc >= 65 and rc <= 90: # [a-zA-Z]
                rc = rc + 32
                
    return rc

proc I_ProcessEvent*(e: Event) {.exportc.} =
    var event: event_t
    case e.kind:
        of sdl.KeyDown:
            event.`type` = ev_keydown
            event.data1 = xlatekey(e)
            discard
        of sdl.KeyUp:
            event.`type` = ev_keyup
            event.data1 = xlatekey(e)
        of sdl.Quit:
            I_Quit();
        else:
            return

    D_PostEvent(addr(event))

proc I_StartTic() {.exportc.} =
    #echo "> I_StartTic"
    if app.window == nil:
        echo "> screen is nil"
        return

    var e: sdl.Event

    while sdl.pollEvent(addr(e)) != 0:
        I_ProcessEvent(e)
    
