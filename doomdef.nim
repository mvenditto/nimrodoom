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
##   Internally used data structures for virtually everything,
##    key definitions, lots of other stuff.
##
## -----------------------------------------------------------------------------

##
##  Global parameters/defines.
##
##  DOOM version

discard """
const
  VERSION* = 110

##  Game mode handling - identify IWAD version
##   to handle IWAD dependend animations etc.

type
  GameMode_t* = enum
    shareware,                ##  DOOM 1 shareware, E1, M9
    registered,               ##  DOOM 1 registered, E3, M27
    commercial,               ##  DOOM 2 retail, E1 M34
               ##  DOOM 2 german edition not handled
    retail,                   ##  DOOM 1 retail, E4, M36
    indetermined              ##  Well, no IWAD found.


##  Mission packs - might be useful for TC stuff?

type
  GameMission_t* = enum
    doom,                     ##  DOOM 1
    doom2,                    ##  DOOM 2
    pack_tnt,                 ##  TNT mission pack
    pack_plut,                ##  Plutonia pack
    none


##  Identify language to use, software localization.

type
  Language_t* = enum
    english, french, german, unknown


##  If rangecheck is undefined,
##  most parameter validation debugging code will not be compiled

const
  RANGECHECK* = true

##  Do or do not use external soundserver.
##  The sndserver binary to be run separately
##   has been introduced by Dave Taylor.
##  The integrated sound support is experimental,
##   and unfinished. Default is synchronous.
##  Experimental asynchronous timer based is
##   handled by SNDINTR.

const
  SNDSERV* = 1

## #define SNDINTR  1
##  This one switches between MIT SHM (no proper mouse)
##  and XFree86 DGA (mickey sampling). The original
##  linuxdoom used SHM, which is default.
## #define X11_DGA		1
##
##  For resize of screen, at start of game.
##  It will not work dynamically, see visplanes.
##

const
  BASE_WIDTH* = 320

##  It is educational but futile to change this
##   scaling e.g. to 2. Drawing of status bar,
##   menues etc. is tied to the scale implied
##   by the graphics.

const
  SCREEN_MUL* = 1
  INV_ASPECT_RATIO* = 0.625

##  Defines suck. C sucks.
##  C++ might sucks for OOP, but it sure is a better C.
##  So there.

const
  SCREENWIDTH* = 320

## SCREEN_MUL*BASE_WIDTH //320

const
  SCREENHEIGHT* = 200

## (int)(SCREEN_MUL*BASE_WIDTH*INV_ASPECT_RATIO) //200
##  The maximum number of players, multiplayer/networking.

const
  MAXPLAYERS* = 4

##  State updates, number of tics / second.

const
  TICRATE* = 35


##
##  Difficulty/skill settings/filters.
##
##  Skill flags.

const
  MTF_EASY* = 1
  MTF_NORMAL* = 2
  MTF_HARD* = 4

##  Deaf monsters/do not react to sound.

const
  MTF_AMBUSH* = 8

type
  skill_t* = enum
    sk_baby, sk_easy, sk_medium, sk_hard, sk_nightmare


##
##  Key cards.
##

type
  card_t* = enum
    it_bluecard, it_yellowcard, it_redcard, it_blueskull, it_yellowskull,
    it_redskull, NUMCARDS


##  The defined weapons,
##   including a marker indicating
##   user has not changed weapon.

type
  weapontype_t* = enum
    wp_fist, wp_pistol, wp_shotgun, wp_chaingun, wp_missile, wp_plasma, wp_bfg,
    wp_chainsaw, wp_supershotgun, NUMWEAPONS, ##  No pending weapon change.
    wp_nochange


##  Ammunition types defined.

type
  ammotype_t* = enum
    am_clip,                  ##  Pistol / chaingun ammo.
    am_shell,                 ##  Shotgun / double barreled shotgun.
    am_cell,                  ##  Plasma rifle, BFG.
    am_misl,                  ##  Missile launcher.
    NUMAMMO, am_noammo         ##  Unlimited for chainsaw / fist.


##  Power up artifacts.

type
  powertype_t* = enum
    pw_invulnerability, pw_strength, pw_invisibility, pw_ironfeet, pw_allmap,
    pw_infrared, NUMPOWERS


##
##  Power up durations,
##   how many seconds till expiration,
##   assuming TICRATE is 35 ticks/second.
##

type
  powerduration_t* = enum
    INVULNTICS = (30 * TICRATE), INVISTICS = (60 * TICRATE), INFRATICS = (120 * TICRATE),
    IRONTICS = (60 * TICRATE)


##
##  DOOM keyboard definition.
##  This is the stuff configured by Setup.Exe.
##  Most key data are simple ascii (uppercased).
##

"""

##  The current state of the game: whether we are
##  playing, gazing at the intermission screen,
##  the game final animation, or a demo.

type
  gamestate_t* = enum
    GS_LEVEL, GS_INTERMISSION, GS_FINALE, GS_DEMOSCREEN

const
  SCREENWIDTH* = 320
  SCREENHEIGHT* = 200

const
  KEY_RIGHTARROW* = 0x000000AE
  KEY_LEFTARROW* = 0x000000AC
  KEY_UPARROW* = 0x000000AD
  KEY_DOWNARROW* = 0x000000AF
  KEY_ESCAPE* = 27
  KEY_ENTER* = 13
  KEY_TAB* = 9
  KEY_F1* = (0x00000080 + 0x0000003B)
  KEY_F2* = (0x00000080 + 0x0000003C)
  KEY_F3* = (0x00000080 + 0x0000003D)
  KEY_F4* = (0x00000080 + 0x0000003E)
  KEY_F5* = (0x00000080 + 0x0000003F)
  KEY_F6* = (0x00000080 + 0x00000040)
  KEY_F7* = (0x00000080 + 0x00000041)
  KEY_F8* = (0x00000080 + 0x00000042)
  KEY_F9* = (0x00000080 + 0x00000043)
  KEY_F10* = (0x00000080 + 0x00000044)
  KEY_F11* = (0x00000080 + 0x00000057)
  KEY_F12* = (0x00000080 + 0x00000058)
  KEY_BACKSPACE* = 127
  KEY_PAUSE* = 0x000000FF
  KEY_EQUALS* = 0x0000003D
  KEY_MINUS* = 0x0000002D
  KEY_RSHIFT* = (0x00000080 + 0x00000036)
  KEY_RCTRL* = (0x00000080 + 0x0000001D)
  KEY_RALT* = (0x00000080 + 0x00000038)
  KEY_LALT* = KEY_RALT

##  DOOM basic types (boolean),
##   and max/min values.
## #include "doomtype.h"
##  Fixed point.
## #include "m_fixed.h"
##  Endianess handling.
## #include "m_swap.h"
##  Binary Angles, sine/cosine/atan lookups.
## #include "tables.h"
##  Event type.
## #include "d_event.h"
##  Game function, skills.
## #include "g_game.h"
##  All external data is defined here.
## #include "doomdata.h"
##  All important printed strings.
##  Language selection (message strings).
## #include "dstrings.h"
##  Player is a special actor.
## struct player_s;
## #include "d_items.h"
## #include "d_player.h"
## #include "p_mobj.h"
## #include "d_net.h"
##  PLAY
## #include "p_tick.h"
##  Header, generated by sound utility.
##  The utility was written by Dave Taylor.
## #include "sounds.h"
