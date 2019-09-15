import os
import sdl2/sdl
import strformat
import doomdef
import d_event
import math
import logging

var 
    colors: array[256, sdl.Color]
    X_width: cint
    X_height: cint
    lastMouseButtonState: uint32
    window: sdl.Window
    renderer: sdl.Renderer 
    surface: sdl.Surface
    psurface: sdl.Surface
    texture: sdl.Texture

    menuactive {.importc, header:"doomstat.h".} : bool
    paused {.importc, header:"doomstat.h".} : bool
    gamestate {.importc, header:"doomstat.h".} : gamestate_t

const 
    WINWIDTH: cint = SCREENWIDTH * 2 
    WINHEIGHT: cint = SCREENHEIGHT * 2
    Title = "nimrod00m"
    WindowFlags = 0
    RendererFlags = sdl.RendererAccelerated

proc I_Quit {.importc, header:"i_system.h", noconv.}
proc I_Error(error: cstring) {.importc, header:"i_system.h", noconv.}
proc D_PostEvent*(ev: ptr event_t) {.importc, header:"d_main.h", noconv.}

var screens* {.importc, header:"v_video.h".}: array[5, ptr UncheckedArray[byte]]
var gammatable {.importc, header:"v_video.h".}: array[5, array[256, byte]]
var usegamma {.importc, header:"v_video.h".}: cint

proc I_InitGraphics*(): void {.exportc.} =
    echo "> I_InitGraphics: " & $SCREENWIDTH & " " & $SCREENHEIGHT
    
    setControlCHook(I_Quit);

    X_width = SCREENWIDTH;
    X_height = SCREENHEIGHT;

    if init(sdl.InitVideo) == -1:
        I_Error("SDL initializing error")
    
    window = sdl.createWindow(
        Title,
        sdl.WindowPosUndefined,
        sdl.WindowPosUndefined,
        WINWIDTH,
        WINHEIGHT,
        WindowFlags
    )

    if window == nil:
        I_Error(&"ERROR: Can't create window: {sdl.getError()}")

    # Create renderer
    renderer = sdl.createRenderer(window, -1, RendererFlags)
    if renderer == nil:
        I_Error(&"ERROR: Can't create renderer: {sdl.getError()}")
    
    discard sdl.setHint(sdl.HINT_RENDER_SCALE_QUALITY, "nearest")
    discard renderer.renderSetLogicalSize(SCREENWIDTH, SCREENHEIGHT)

    surface = sdl.createRGBSurface(0, SCREENWIDTH, SCREENHEIGHT, 8, 0, 0, 0, 0)
    psurface = sdl.createRGBSurface(0, SCREENWIDTH, SCREENHEIGHT, 32, 0, 0, 0, 0)

    texture = renderer.createTexture(
        sdl.PIXELFORMAT_RGBA8888, sdl.TEXTUREACCESS_STREAMING, SCREENWIDTH, SCREENHEIGHT);

    screens[0] = cast[ptr UncheckedArray[byte]](surface.pixels)
    
proc I_ShutdownGraphics*(): void {.exportc.} =
    sdl.freeSurface(surface)
    sdl.freeSurface(psurface)
    sdl.destroyTexture(texture)
    renderer.destroyRenderer()
    window.destroyWindow()
    sdl.quit()

proc I_UpdateNoBlit*(): void {.exportc.} =
    #echo "> I_UpdateNoBlit"
    discard

proc I_ShouldGrabMouse(): bool =

    if window == nil:
        return false

    if sdl.getMouseFocus() != addr(window):
        return false
    
    if menuactive or paused:
        return false
    
    return gamestate == GS_LEVEL

var grabbed: bool

proc I_SetGrabMouse(grab: bool) =
    discard sdl.showCursor(cint(grab));

    if grab and not grabbed:
        sdl.setWindowGrab(window, true)
    else: 
        if not grab and grabbed:
            sdl.warpMouseInWindow(addr(window), WINWIDTH - 10 * cint(WINHEIGHT / SCREENWIDTH), WINHEIGHT - 16);
    
    grabbed = grab

proc I_FinishUpdate*(): void {.exportc.} =
    #echo "> I_FinishUpdate"

    I_SetGrabMouse(I_ShouldGrabMouse())

    discard sdl.blitSurface(surface, nil, psurface, nil)
    var pitch: cint
    var pixels: pointer

    discard sdl.lockTexture(texture, nil, addr(pixels), addr(pitch))
    discard sdl.convertPixels(SCREENWIDTH, SCREENHEIGHT, 
        psurface.format.format, 
        psurface.pixels, psurface.pitch, 
        sdl.PIXELFORMAT_RGBA8888, pixels, pitch)
    sdl.unlockTexture(texture)
    discard renderer.renderCopy(texture, nil, nil)
    renderer.renderPresent();

proc I_SetPalette*(palette: ptr byte): void {.exportc.} =
    #echo "> I_SetPalette"
    
    var c: byte
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
        of K_LALT, K_LGUI:
            rc = KEY_LALT
        of K_RALT, K_RGUI:
            rc = KEY_RALT
        else: 
            rc = cint(e.key.keysym.sym)
            if rc >= 65 and rc <= 90: # [a-zA-Z]
                rc = rc + 32
                
    return rc

proc I_PollMouse() =

    var
        x: cint
        y: cint
        px = addr(x)
        py = addr(y)
        buttonState: uint32
    
    buttonState = sdl.getRelativeMouseState(px, py)

    if x != 0 or y != 0 or buttonState != lastMouseButtonState:
        var e: event_t
        e.`type` = ev_mouse
        e.data1 = cint(buttonState)
        e.data2 = x
        e.data3 = -y
        D_PostEvent(addr(e))
        lastMouseButtonState = buttonState

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
            discard
        of sdl.Quit:
            I_Quit();
        else:
            return

    D_PostEvent(addr(event))

proc I_StartTic() {.exportc.} =
    #echo "> I_StartTic"
    
    I_PollMouse()    

    var e: sdl.Event

    while sdl.pollEvent(addr(e)) != 0:
        I_ProcessEvent(e)
    
