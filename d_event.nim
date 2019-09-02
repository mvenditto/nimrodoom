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
##
##
## -----------------------------------------------------------------------------

#import
#  doomtype

##
##  Event handling.
##
##  Input event types.

type
  evtype_t* = enum
    ev_keydown, ev_keyup, ev_mouse, ev_joystick


##  Event structure.

type
  event_t* {.bycopy.} = object
    `type`*: evtype_t
    data1*: cint               ##  keys / mouse/joystick buttons
    data2*: cint               ##  mouse/joystick x move
    data3*: cint               ##  mouse/joystick y move

discard """
  gameaction_t* = enum
    ga_nothing, ga_loadlevel, ga_newgame, ga_loadgame, ga_savegame, ga_playdemo,
    ga_completed, ga_victory, ga_worlddone, ga_screenshot


##
##  Button/action code definitions.
##

type                          ##  Press "Fire".
  buttoncode_t* = enum
    BT_ATTACK = 1,              ##  Use button, to open doors, activate switches.
    BT_USE = 2,                 ##  Flag: game events, not really buttons.
    BTS_SAVEMASK = (4 + 8 + 16), BT_SPECIALMASK = 3, ##  Flag, weapon change pending.
                                           ##  If true, the next 3 bits hold weapon num.
    BT_CHANGE = 4,              ##  The 3bit weapon mask and shift, convenience.
    BT_WEAPONMASK = (8 + 16 + 32), BT_SPECIAL = 128

const
  BTS_PAUSE = BT_ATTACK
  BTS_SAVEGAME = BT_USE
  BTS_SAVESHIFT = BT_USE
  BT_WEAPONSHIFT = BT_SPECIALMASK

##
##  GLOBAL VARIABLES
##

const
  MAXEVENTS* = 64

var events*: array[MAXEVENTS, event_t]

var eventhead*: cint

var eventtail*: cint

var gameaction*: gameaction_t

## -----------------------------------------------------------------------------
##
##  $Log:$
##
## -----------------------------------------------------------------------------
"""
