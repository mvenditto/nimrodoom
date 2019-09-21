#
#  Event handling.
#
#  Input event types.

template doWhile*(a: untyped, b: untyped): untyped =
  while true:
    b
    if not a:
      break

type
  fixed_t* = cint
type
  angle_t* = cuint
type
  boolean* = enum
    false, true


const
  FINEANGLES* = 8192
  FINEMASK* = (FINEANGLES - 1)

type
  evtype_t* = enum
    ev_keydown, ev_keyup, ev_mouse, ev_joystick

  event_t* {.bycopy.} = object
    `type`*: evtype_t
    data1*: cint               #  keys / mouse/joystick buttons
    data2*: cint               #  mouse/joystick x move
    data3*: cint               #  mouse/joystick y move

  gameaction_t* = enum
    ga_nothing, ga_loadlevel, ga_newgame, ga_loadgame, ga_savegame, ga_playdemo,
    ga_completed, ga_victory, ga_worlddone, ga_screenshot

#  Used by ST StatusBar stuff.

const
  AM_MSGHEADER* = (('a'.byte shl 24) + ('m'.byte  shl 16))
  AM_MSGENTERED* = (AM_MSGHEADER or ('e'.byte  shl 8))
  AM_MSGEXITED* = (AM_MSGHEADER or ('x'.byte  shl 8))

#  Called by main loop.

#proc AM_Responder*(ev: ptr event_t): boolean
#  Called by main loop.

#proc AM_Ticker*()
#  Called by main loop,
#  called instead of view drawer if automap active.

#proc AM_Drawer*()
#  Called to force the automap to quit
#  if the level is completed while it is up.

#proc AM_Stop*()
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Printed strings for translation.
# 	English language support (default).
#
# -----------------------------------------------------------------------------

#
# 	Printed strings for translation
#
#
#  D_Main.C
#

const
  D_DEVSTR* = "Development mode ON.\n"
  D_CDROM* = "CD-ROM Version: default.cfg from c:\bdoomdata\n"

#
# 	M_Menu.C
#

const
  PRESSKEY* = "press a key."
  PRESSYN* = "press y or n."
  QUITMSG* = "are you sure you want to\nquit this great game?"
  LOADNET* = "you can\'t do load while in a net game!\n\n" & PRESSKEY
  QLOADNET* = "you can\'t quickload during a netgame!\n\n" & PRESSKEY
  QSAVESPOT* = "you haven\'t picked a quicksave slot yet!\n\n" & PRESSKEY
  SAVEDEAD* = "you can\'t save if you aren\'t playing!\n\n" & PRESSKEY
  QSPROMPT* = "quicksave over your game named\n\n\'%s\'?\n\n" & PRESSYN
  QLPROMPT* = "do you want to quickload the game named\n\n\'%s\'?\n\n" & PRESSYN
  NEWGAME* = "you can\'t start a new game\nwhile in a network game.\n\n" & PRESSKEY
  NIGHTMARE* = "are you sure? this skill level\nisn\'t even remotely fair.\n\n" & PRESSYN
  SWSTRING* = "this is the shareware version of doom.\n\nyou need to order the entire trilogy.\n\n" & PRESSKEY
  MSGOFF* = "Messages OFF"
  MSGON* = "Messages ON"
  NETEND* = "you can\'t end a netgame!\n\n" & PRESSKEY
  ENDGAME* = "are you sure you want to end the game?\n\n" & PRESSYN
  DOSY* = "(press y to quit)"
  DETAILHI* = "High detail"
  DETAILLO* = "Low detail"
  GAMMALVL0* = "Gamma correction OFF"
  GAMMALVL1* = "Gamma correction level 1"
  GAMMALVL2* = "Gamma correction level 2"
  GAMMALVL3* = "Gamma correction level 3"
  GAMMALVL4* = "Gamma correction level 4"
  EMPTYSTRING* = "empty slot"

#
# 	P_inter.C
#

const
  GOTARMOR* = "Picked up the armor."
  GOTMEGA* = "Picked up the MegaArmor!"
  GOTHTHBONUS* = "Picked up a health bonus."
  GOTARMBONUS* = "Picked up an armor bonus."
  GOTSTIM* = "Picked up a stimpack."
  GOTMEDINEED* = "Picked up a medikit that you REALLY need!"
  GOTMEDIKIT* = "Picked up a medikit."
  GOTSUPER* = "Supercharge!"
  GOTBLUECARD* = "Picked up a blue keycard."
  GOTYELWCARD* = "Picked up a yellow keycard."
  GOTREDCARD* = "Picked up a red keycard."
  GOTBLUESKUL* = "Picked up a blue skull key."
  GOTYELWSKUL* = "Picked up a yellow skull key."
  GOTREDSKULL* = "Picked up a red skull key."
  GOTINVUL* = "Invulnerability!"
  GOTBERSERK* = "Berserk!"
  GOTINVIS* = "Partial Invisibility"
  GOTSUIT* = "Radiation Shielding Suit"
  GOTMAP* = "Computer Area Map"
  GOTVISOR* = "Light Amplification Visor"
  GOTMSPHERE* = "MegaSphere!"
  GOTCLIP* = "Picked up a clip."
  GOTCLIPBOX* = "Picked up a box of bullets."
  GOTROCKET* = "Picked up a rocket."
  GOTROCKBOX* = "Picked up a box of rockets."
  GOTCELL* = "Picked up an energy cell."
  GOTCELLBOX* = "Picked up an energy cell pack."
  GOTSHELLS* = "Picked up 4 shotgun shells."
  GOTSHELLBOX* = "Picked up a box of shotgun shells."
  GOTBACKPACK* = "Picked up a backpack full of ammo!"
  GOTBFG9000* = "You got the BFG9000!  Oh, yes."
  GOTCHAINGUN* = "You got the chaingun!"
  GOTCHAINSAW* = "A chainsaw!  Find some meat!"
  GOTLAUNCHER* = "You got the rocket launcher!"
  GOTPLASMA* = "You got the plasma gun!"
  GOTSHOTGUN* = "You got the shotgun!"
  GOTSHOTGUN2* = "You got the super shotgun!"

#
#  P_Doors.C
#

const
  PD_BLUEO* = "You need a blue key to activate this object"
  PD_REDO* = "You need a red key to activate this object"
  PD_YELLOWO* = "You need a yellow key to activate this object"
  PD_BLUEK* = "You need a blue key to open this door"
  PD_REDK* = "You need a red key to open this door"
  PD_YELLOWK* = "You need a yellow key to open this door"

#
# 	G_game.C
#

const
  GGSAVED* = "game saved."

#
# 	HU_stuff.C
#

const
  HUSTR_MSGU* = "[Message unsent]"
  HUSTR_E1M1* = "E1M1: Hangar"
  HUSTR_E1M2* = "E1M2: Nuclear Plant"
  HUSTR_E1M3* = "E1M3: Toxin Refinery"
  HUSTR_E1M4* = "E1M4: Command Control"
  HUSTR_E1M5* = "E1M5: Phobos Lab"
  HUSTR_E1M6* = "E1M6: Central Processing"
  HUSTR_E1M7* = "E1M7: Computer Station"
  HUSTR_E1M8* = "E1M8: Phobos Anomaly"
  HUSTR_E1M9* = "E1M9: Military Base"
  HUSTR_E2M1* = "E2M1: Deimos Anomaly"
  HUSTR_E2M2* = "E2M2: Containment Area"
  HUSTR_E2M3* = "E2M3: Refinery"
  HUSTR_E2M4* = "E2M4: Deimos Lab"
  HUSTR_E2M5* = "E2M5: Command Center"
  HUSTR_E2M6* = "E2M6: Halls of the Damned"
  HUSTR_E2M7* = "E2M7: Spawning Vats"
  HUSTR_E2M8* = "E2M8: Tower of Babel"
  HUSTR_E2M9* = "E2M9: Fortress of Mystery"
  HUSTR_E3M1* = "E3M1: Hell Keep"
  HUSTR_E3M2* = "E3M2: Slough of Despair"
  HUSTR_E3M3* = "E3M3: Pandemonium"
  HUSTR_E3M4* = "E3M4: House of Pain"
  HUSTR_E3M5* = "E3M5: Unholy Cathedral"
  HUSTR_E3M6* = "E3M6: Mt. Erebus"
  HUSTR_E3M7* = "E3M7: Limbo"
  HUSTR_E3M8* = "E3M8: Dis"
  HUSTR_E3M9* = "E3M9: Warrens"
  HUSTR_E4M1* = "E4M1: Hell Beneath"
  HUSTR_E4M2* = "E4M2: Perfect Hatred"
  HUSTR_E4M3* = "E4M3: Sever The Wicked"
  HUSTR_E4M4* = "E4M4: Unruly Evil"
  HUSTR_E4M5* = "E4M5: They Will Repent"
  HUSTR_E4M6* = "E4M6: Against Thee Wickedly"
  HUSTR_E4M7* = "E4M7: And Hell Followed"
  HUSTR_E4M8* = "E4M8: Unto The Cruel"
  HUSTR_E4M9* = "E4M9: Fear"
  HUSTR_1* = "level 1: entryway"
  HUSTR_2* = "level 2: underhalls"
  HUSTR_3* = "level 3: the gantlet"
  HUSTR_4* = "level 4: the focus"
  HUSTR_5* = "level 5: the waste tunnels"
  HUSTR_6* = "level 6: the crusher"
  HUSTR_7* = "level 7: dead simple"
  HUSTR_8* = "level 8: tricks and traps"
  HUSTR_9* = "level 9: the pit"
  HUSTR_10* = "level 10: refueling base"
  HUSTR_11* = "level 11: \'o\' of destruction!"
  HUSTR_12* = "level 12: the factory"
  HUSTR_13* = "level 13: downtown"
  HUSTR_14* = "level 14: the inmost dens"
  HUSTR_15* = "level 15: industrial zone"
  HUSTR_16* = "level 16: suburbs"
  HUSTR_17* = "level 17: tenements"
  HUSTR_18* = "level 18: the courtyard"
  HUSTR_19* = "level 19: the citadel"
  HUSTR_20* = "level 20: gotcha!"
  HUSTR_21* = "level 21: nirvana"
  HUSTR_22* = "level 22: the catacombs"
  HUSTR_23* = "level 23: barrels o\' fun"
  HUSTR_24* = "level 24: the chasm"
  HUSTR_25* = "level 25: bloodfalls"
  HUSTR_26* = "level 26: the abandoned mines"
  HUSTR_27* = "level 27: monster condo"
  HUSTR_28* = "level 28: the spirit world"
  HUSTR_29* = "level 29: the living end"
  HUSTR_30* = "level 30: icon of sin"
  HUSTR_31* = "level 31: wolfenstein"
  HUSTR_32* = "level 32: grosse"
  PHUSTR_1* = "level 1: congo"
  PHUSTR_2* = "level 2: well of souls"
  PHUSTR_3* = "level 3: aztec"
  PHUSTR_4* = "level 4: caged"
  PHUSTR_5* = "level 5: ghost town"
  PHUSTR_6* = "level 6: baron\'s lair"
  PHUSTR_7* = "level 7: caughtyard"
  PHUSTR_8* = "level 8: realm"
  PHUSTR_9* = "level 9: abattoire"
  PHUSTR_10* = "level 10: onslaught"
  PHUSTR_11* = "level 11: hunted"
  PHUSTR_12* = "level 12: speed"
  PHUSTR_13* = "level 13: the crypt"
  PHUSTR_14* = "level 14: genesis"
  PHUSTR_15* = "level 15: the twilight"
  PHUSTR_16* = "level 16: the omen"
  PHUSTR_17* = "level 17: compound"
  PHUSTR_18* = "level 18: neurosphere"
  PHUSTR_19* = "level 19: nme"
  PHUSTR_20* = "level 20: the death domain"
  PHUSTR_21* = "level 21: slayer"
  PHUSTR_22* = "level 22: impossible mission"
  PHUSTR_23* = "level 23: tombstone"
  PHUSTR_24* = "level 24: the final frontier"
  PHUSTR_25* = "level 25: the temple of darkness"
  PHUSTR_26* = "level 26: bunker"
  PHUSTR_27* = "level 27: anti-christ"
  PHUSTR_28* = "level 28: the sewers"
  PHUSTR_29* = "level 29: odyssey of noises"
  PHUSTR_30* = "level 30: the gateway of hell"
  PHUSTR_31* = "level 31: cyberden"
  PHUSTR_32* = "level 32: go 2 it"
  THUSTR_1* = "level 1: system control"
  THUSTR_2* = "level 2: human bbq"
  THUSTR_3* = "level 3: power control"
  THUSTR_4* = "level 4: wormhole"
  THUSTR_5* = "level 5: hanger"
  THUSTR_6* = "level 6: open season"
  THUSTR_7* = "level 7: prison"
  THUSTR_8* = "level 8: metal"
  THUSTR_9* = "level 9: stronghold"
  THUSTR_10* = "level 10: redemption"
  THUSTR_11* = "level 11: storage facility"
  THUSTR_12* = "level 12: crater"
  THUSTR_13* = "level 13: nukage #processing"
  THUSTR_14* = "level 14: steel works"
  THUSTR_15* = "level 15: dead zone"
  THUSTR_16* = "level 16: deepest reaches"
  THUSTR_17* = "level 17: #processing area"
  THUSTR_18* = "level 18: mill"
  THUSTR_19* = "level 19: shipping/respawning"
  THUSTR_20* = "level 20: central #processing"
  THUSTR_21* = "level 21: administration center"
  THUSTR_22* = "level 22: habitat"
  THUSTR_23* = "level 23: lunar mining project"
  THUSTR_24* = "level 24: quarry"
  THUSTR_25* = "level 25: baron\'s den"
  THUSTR_26* = "level 26: ballistyx"
  THUSTR_27* = "level 27: mount pain"
  THUSTR_28* = "level 28: heck"
  THUSTR_29* = "level 29: river styx"
  THUSTR_30* = "level 30: last call"
  THUSTR_31* = "level 31: pharaoh"
  THUSTR_32* = "level 32: caribbean"
  HUSTR_CHATMACRO1* = "I\'m ready to kick butt!"
  HUSTR_CHATMACRO2* = "I\'m OK."
  HUSTR_CHATMACRO3* = "I\'m not looking too good!"
  HUSTR_CHATMACRO4* = "Help!"
  HUSTR_CHATMACRO5* = "You suck!"
  HUSTR_CHATMACRO6* = "Next time, scumbag..."
  HUSTR_CHATMACRO7* = "Come here!"
  HUSTR_CHATMACRO8* = "I\'ll take care of it."
  HUSTR_CHATMACRO9* = "Yes"
  HUSTR_CHATMACRO0* = "No"
  HUSTR_TALKTOSELF1* = "You mumble to yourself"
  HUSTR_TALKTOSELF2* = "Who\'s there?"
  HUSTR_TALKTOSELF3* = "You scare yourself"
  HUSTR_TALKTOSELF4* = "You start to rave"
  HUSTR_TALKTOSELF5* = "You\'ve lost it..."
  HUSTR_MESSAGESENT* = "[Message Sent]"

#  The following should NOT be changed unless it seems
#  just AWFULLY necessary

const
  HUSTR_PLRGREEN* = "Green: "
  HUSTR_PLRINDIGO* = "Indigo: "
  HUSTR_PLRBROWN* = "Brown: "
  HUSTR_PLRRED* = "Red: "
  HUSTR_KEYGREEN* = 'g'
  HUSTR_KEYINDIGO* = 'i'
  HUSTR_KEYBROWN* = 'b'
  HUSTR_KEYRED* = 'r'

#
# 	AM_map.C
#

const
  AMSTR_FOLLOWON* = "Follow Mode ON"
  AMSTR_FOLLOWOFF* = "Follow Mode OFF"
  AMSTR_GRIDON* = "Grid ON"
  AMSTR_GRIDOFF* = "Grid OFF"
  AMSTR_MARKEDSPOT* = "Marked Spot"
  AMSTR_MARKSCLEARED* = "All Marks Cleared"

#
# 	ST_stuff.C
#

const
  STSTR_MUS* = "Music Change"
  STSTR_NOMUS* = "IMPOSSIBLE SELECTION"
  STSTR_DQDON* = "Degreelessness Mode On"
  STSTR_DQDOFF* = "Degreelessness Mode Off"
  STSTR_KFAADDED* = "Very Happy Ammo Added"
  STSTR_FAADDED* = "Ammo (no keys) Added"
  STSTR_NCON* = "No Clipping Mode ON"
  STSTR_NCOFF* = "No Clipping Mode OFF"
  STSTR_BEHOLD* = "inVuln, Str, Inviso, Rad, Allmap, or Lite-amp"
  STSTR_BEHOLDX* = "Power-up Toggled"
  STSTR_CHOPPERS* = "... doesn\'t suck - GM"
  STSTR_CLEV* = "Changing Level..."

#
# 	F_Finale.C
#

const
  E1TEXT* = "Once you beat the big badasses and\nclean out the moon base you\'re supposed\nto win, aren\'t you? Aren\'t you? Where\'s\nyour fat reward and ticket home? What\nthe hell is this? It\'s not supposed to\nend this way!\n\nIt stinks like rotten meat, but looks\nlike the lost Deimos base.  Looks like\nyou\'re stuck on The Shores of Hell.\nThe only way out is through.\n\nTo continue the DOOM experience, play\nThe Shores of Hell and its amazing\nsequel, Inferno!\n"
  E2TEXT* = "You\'ve done it! The hideous cyber-\ndemon lord that ruled the lost Deimos\nmoon base has been slain and you\nare triumphant! But ... where are\nyou? You clamber to the edge of the\nmoon and look down to see the awful\ntruth.\n\nDeimos floats above Hell itself!\nYou\'ve never heard of anyone escaping\nfrom Hell, but you\'ll make the bastards\nsorry they ever heard of you! Quickly,\nyou rappel down to  the surface of\nHell.\n\nNow, it\'s on to the final chapter of\nDOOM! -- Inferno."
  E3TEXT* = "The loathsome spiderdemon that\nmasterminded the invasion of the moon\nbases and caused so much death has had\nits ass kicked for all time.\n\nA hidden doorway opens and you enter.\nYou\'ve proven too tough for Hell to\ncontain, and now Hell at last plays\nfair -- for you emerge from the door\nto see the green fields of Earth!\nHome at last.\n\nYou wonder what\'s been happening on\nEarth while you were battling evil\nunleashed. It\'s good that no Hell-\nspawn could have come through that\ndoor with you ..."
  E4TEXT* = "the spider mastermind must have sent forth\nits legions of hellspawn before your\nfinal confrontation with that terrible\nbeast from hell.  but you stepped forward\nand brought forth eternal damnation and\nsuffering upon the horde as a true hero\nwould in the face of something so evil.\n\nbesides, someone was gonna pay for what\nhappened to daisy, your pet rabbit.\n\nbut now, you see spread before you more\npotential pain and gibbitude as a nation\nof demons run amok among our cities.\n\nnext stop, hell on earth!"

#  after level 6, put this:

const
  C1TEXT* = "YOU HAVE ENTERED DEEPLY INTO THE INFESTED\nSTARPORT. BUT SOMETHING IS WRONG. THE\nMONSTERS HAVE BROUGHT THEIR OWN REALITY\nWITH THEM, AND THE STARPORT\'S TECHNOLOGY\nIS BEING SUBVERTED BY THEIR PRESENCE.\n\nAHEAD, YOU SEE AN OUTPOST OF HELL, A\nFORTIFIED ZONE. IF YOU CAN GET PAST IT,\nYOU CAN PENETRATE INTO THE HAUNTED HEART\nOF THE STARBASE AND FIND THE CONTROLLING\nSWITCH WHICH HOLDS EARTH\'S POPULATION\nHOSTAGE."

#  After level 11, put this:

const
  C2TEXT* = "YOU HAVE WON! YOUR VICTORY HAS ENABLED\nHUMANKIND TO EVACUATE EARTH AND ESCAPE\nTHE NIGHTMARE.  NOW YOU ARE THE ONLY\nHUMAN LEFT ON THE FACE OF THE PLANET.\nCANNIBAL MUTATIONS, CARNIVOROUS ALIENS,\nAND EVIL SPIRITS ARE YOUR ONLY NEIGHBORS.\nYOU SIT BACK AND WAIT FOR DEATH, CONTENT\nTHAT YOU HAVE SAVED YOUR SPECIES.\n\nBUT THEN, EARTH CONTROL BEAMS DOWN A\nMESSAGE FROM SPACE: \"SENSORS HAVE LOCATED\nTHE SOURCE OF THE ALIEN INVASION. IF YOU\nGO THERE, YOU MAY BE ABLE TO BLOCK THEIR\nENTRY.  THE ALIEN BASE IS IN THE HEART OF\nYOUR OWN HOME CITY, NOT FAR FROM THE\nSTARPORT.\" SLOWLY AND PAINFULLY YOU GET\nUP AND RETURN TO THE FRAY."

#  After level 20, put this:

const
  C3TEXT* = "YOU ARE AT THE CORRUPT HEART OF THE CITY,\nSURROUNDED BY THE CORPSES OF YOUR ENEMIES.\nYOU SEE NO WAY TO DESTROY THE CREATURES\'\nENTRYWAY ON THIS SIDE, SO YOU CLENCH YOUR\nTEETH AND PLUNGE THROUGH IT.\n\nTHERE MUST BE A WAY TO CLOSE IT ON THE\nOTHER SIDE. WHAT DO YOU CARE IF YOU\'VE\nGOT TO GO THROUGH HELL TO GET TO IT?"

#  After level 29, put this:

const
  C4TEXT* = "THE HORRENDOUS VISAGE OF THE BIGGEST\nDEMON YOU\'VE EVER SEEN CRUMBLES BEFORE\nYOU, AFTER YOU PUMP YOUR ROCKETS INTO\nHIS EXPOSED BRAIN. THE MONSTER SHRIVELS\nUP AND DIES, ITS THRASHING LIMBS\nDEVASTATING UNTOLD MILES OF HELL\'S\nSURFACE.\n\nYOU\'VE DONE IT. THE INVASION IS OVER.\nEARTH IS SAVED. HELL IS A WRECK. YOU\nWONDER WHERE BAD FOLKS WILL GO WHEN THEY\nDIE, NOW. WIPING THE SWEAT FROM YOUR\nFOREHEAD YOU BEGIN THE LONG TREK BACK\nHOME. REBUILDING EARTH OUGHT TO BE A\nLOT MORE FUN THAN RUINING IT WAS.\n"

#  Before level 31, put this:

const
  C5TEXT* = "CONGRATULATIONS, YOU\'VE FOUND THE SECRET\nLEVEL! LOOKS LIKE IT\'S BEEN BUILT BY\nHUMANS, RATHER THAN DEMONS. YOU WONDER\nWHO THE INMATES OF THIS CORNER OF HELL\nWILL BE."

#  Before level 32, put this:

const
  C6TEXT* = "CONGRATULATIONS, YOU\'VE FOUND THE\nSUPER SECRET LEVEL!  YOU\'D BETTER\nBLAZE THROUGH THIS ONE!\n"

#  after map 06

const
  P1TEXT* = "You gloat over the steaming carcass of the\nGuardian.  With its death, you\'ve wrested\nthe Accelerator from the stinking claws\nof Hell.  You relax and glance around the\nroom.  Damn!  There was supposed to be at\nleast one working prototype, but you can\'t\nsee it. The demons must have taken it.\n\nYou must find the prototype, or all your\nstruggles will have been wasted. Keep\nmoving, keep fighting, keep killing.\nOh yes, keep living, too."

#  after map 11

const
  P2TEXT* = "Even the deadly Arch-Vile labyrinth could\nnot stop you, and you\'ve gotten to the\nprototype Accelerator which is soon\nefficiently and permanently deactivated.\n\nYou\'re good at that kind of thing."

#  after map 20

const
  P3TEXT* = "You\'ve bashed and battered your way into\nthe heart of the devil-hive.  Time for a\nSearch-and-Destroy mission, aimed at the\nGatekeeper, whose foul offspring is\ncascading to Earth.  Yeah, he\'s bad. But\nyou know who\'s worse!\n\nGrinning evilly, you check your gear, and\nget ready to give the bastard a little Hell\nof your own making!"

#  after map 30

const
  P4TEXT* = "The Gatekeeper\'s evil face is splattered\nall over the place.  As its tattered corpse\ncollapses, an inverted Gate forms and\nsucks down the shards of the last\nprototype Accelerator, not to mention the\nfew remaining demons.  You\'re done. Hell\nhas gone back to pounding bad dead folks \ninstead of good live ones.  Remember to\ntell your grandkids to put a rocket\nlauncher in your coffin. If you go to Hell\nwhen you die, you\'ll need it for some\nfinal cleaning-up ..."

#  before map 31

const
  P5TEXT* = "You\'ve found the second-hardest level we\ngot. Hope you have a saved game a level or\ntwo previous.  If not, be prepared to die\naplenty. For master marines only."

#  before map 32

const
  P6TEXT* = "Betcha wondered just what WAS the hardest\nlevel we had ready for ya?  Now you know.\nNo one gets out alive."
  T1TEXT* = "You\'ve fought your way out of the infested\nexperimental labs.   It seems that UAC has\nonce again gulped it down.  With their\nhigh turnover, it must be hard for poor\nold UAC to buy corporate health insurance\nnowadays..\n\nAhead lies the military complex, now\nswarming with diseased horrors hot to get\ntheir teeth into you. With luck, the\ncomplex still has some warlike ordnance\nlaying around."
  T2TEXT* = "You hear the grinding of heavy machinery\nahead.  You sure hope they\'re not stamping\nout new hellspawn, but you\'re ready to\nream out a whole herd if you have to.\nThey might be planning a blood feast, but\nyou feel about as mean as two thousand\nmaniacs packed into one mad killer.\n\nYou don\'t plan to go down easy."
  T3TEXT* = "The vista opening ahead looks real damn\nfamiliar. Smells familiar, too -- like\nfried excrement. You didn\'t like this\nplace before, and you sure as hell ain\'t\nplanning to like it now. The more you\nbrood on it, the madder you get.\nHefting your gun, an evil grin trickles\nonto your face. Time to take some names."
  T4TEXT* = "Suddenly, all is silent, from one horizon\nto the other. The agonizing echo of Hell\nfades away, the nightmare sky turns to\nblue, the heaps of monster corpses start \nto evaporate along with the evil stench \nthat filled the air. Jeeze, maybe you\'ve\ndone it. Have you really won?\n\nSomething rumbles in the distance.\nA blue light begins to glow inside the\nruined skull of the demon-spitter."
  T5TEXT* = "What now? Looks totally different. Kind\nof like King Tut\'s condo. Well,\nwhatever\'s here can\'t be any worse\nthan usual. Can it?  Or maybe it\'s best\nto let sleeping gods lie.."
  T6TEXT* = "Time for a vacation. You\'ve burst the\nbowels of hell and by golly you\'re ready\nfor a break. You mutter to yourself,\nMaybe someone else can kick Hell\'s ass\nnext time around. Ahead lies a quiet town,\nwith peaceful flowing water, quaint\nbuildings, and presumably no Hellspawn.\n\nAs you step off the transport, you hear\nthe stomp of a cyberdemon\'s iron shoe."

#
#  Character cast strings F_FINALE.C
#

const
  CC_ZOMBIE* = "ZOMBIEMAN"
  CC_SHOTGUN* = "SHOTGUN GUY"
  CC_HEAVY* = "HEAVY WEAPON DUDE"
  CC_IMP* = "IMP"
  CC_DEMON* = "DEMON"
  CC_LOST* = "LOST SOUL"
  CC_CACO* = "CACODEMON"
  CC_HELL* = "HELL KNIGHT"
  CC_BARON* = "BARON OF HELL"
  CC_ARACH* = "ARACHNOTRON"
  CC_PAIN* = "PAIN ELEMENTAL"
  CC_REVEN* = "REVENANT"
  CC_MANCU* = "MANCUBUS"
  CC_ARCH* = "ARCH-VILE"
  CC_SPIDER* = "THE SPIDER MASTERMIND"
  CC_CYBER* = "THE CYBERDEMON"
  CC_HERO* = "OUR HERO"

# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#
#
# -----------------------------------------------------------------------------




#
#  Button/action code definitions.
#

type                          #  Press "Fire".
  buttoncode_t* = enum
    BT_ATTACK = 1,              #  Use button, to open doors, activate switches.
    BT_USE = 2,                 #  Flag: game events, not really buttons.
    BT_SPECIALMASK = 3, #  Flag, weapon change pending. #  If true, the next 3 bits hold weapon num.
    BT_CHANGE = 4,              #  The 3bit weapon mask and shift, convenience.
    BTS_SAVEMASK = (4 + 8 + 16), 
    BT_WEAPONMASK = (8 + 16 + 32), BT_SPECIAL = 128

const
  BTS_PAUSE = BT_ATTACK
  BTS_SAVEGAME = BT_USE
  BTS_SAVESHIFT = BT_USE
  BT_WEAPONSHIFT = BT_SPECIALMASK

#
#  GLOBAL VARIABLES
#

const
  MAXEVENTS* = 64

var events*: array[MAXEVENTS, event_t]

var eventhead*: cint

var eventtail*: cint

var gameaction*: gameaction_t

# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Items: key cards, artifacts, weapon, ammunition.
#
# -----------------------------------------------------------------------------


#  Weapon info: sprite frames, ammunition use.



#  The defined weapons,
#   including a marker indicating
#   user has not changed weapon.

type
  weapontype_t* = enum
    wp_fist, wp_pistol, wp_shotgun, wp_chaingun, wp_missile, wp_plasma, wp_bfg,
    wp_chainsaw, wp_supershotgun, NUMWEAPONS, #  No pending weapon change.
    wp_nochange


  ammotype_t* = enum
    am_clip,                  #  Pistol / chaingun ammo.
    am_shell,                 #  Shotgun / double barreled shotgun.
    am_cell,                  #  Plasma rifle, BFG.
    am_misl,                  #  Missile launcher.
    NUMAMMO, am_noammo         #  Unlimited for chainsaw / fist.


  weaponinfo_t* {.bycopy.} = object
    ammo*: ammotype_t
    upstate*: cint
    downstate*: cint
    readystate*: cint
    atkstate*: cint
    flashstate*: cint


var weaponinfo*: array[NUMWEAPONS, weaponinfo_t]

# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  $Log:$
#
#  DESCRIPTION:
# 	System specific interface stuff.
#
# -----------------------------------------------------------------------------

const
  MAXWADFILES* = 20

var wadfiles*: array[MAXWADFILES, cstring]

#proc D_AddFile*(file: cstring)
#
#  D_DoomMain()
#  Not a globally visible function, just included for source reference,
#  calls all startup code, parses command line options.
#  If not overrided by user input, calls N_AdvanceDemo.
#

#proc D_DoomMain*()
#  Called by IO functions when input is detected.

#proc D_PostEvent*(ev: ptr event_t)
#
#  BASE LEVEL
#

#proc D_PageTicker*()
#proc D_PageDrawer*()
#proc D_AdvanceDemo*()
#proc D_StartTitle*()
#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Networking stuff.
#
# -----------------------------------------------------------------------------


#
#  Network play related stuff.
#  There is a data struct that stores network
#   communication related stuff, and another
#   one that defines the actual packets to
#   be transmitted.
#

const
  DOOMCOM_ID* = 0x12345678

#  Max computers/players in a game.

const
  MAXNETNODES* = 8

#  Networking and tick handling related.

const
  BACKUPTICS* = 12

type
  command_t* = enum
    CMD_SEND = 1, CMD_GET = 2

#  The data sampled per tick (single player)
#  and transmitted to other peers (multiplayer).
#  Mainly movements/button commands per game tick,
#  plus a checksum for internal state consistency.

type
  ticcmd_t* {.bycopy.} = object
    forwardmove*: char         #  *2048 for move
    sidemove*: char            #  *2048 for move
    angleturn*: cshort         #  <<16 for angle delta
    consistancy*: cshort       #  checks for net game
    chatchar*: byte
    buttons*: byte

#
#  Network packet data.
#

type
  doomdata_t* {.bycopy.} = object
    checksum*: cuint           #  High bit is retransmit request.
    #  Only valid if NCMD_RETRANSMIT.
    retransmitfrom*: byte
    starttic*: byte
    player*: byte
    numtics*: byte
    cmds*: array[BACKUPTICS, ticcmd_t]

  doomcom_t* {.bycopy.} = object
    id*: clong                 #  Supposed to be DOOMCOM_ID?
    #  DOOM executes an int to execute commands.
    intnum*: cshort            #  Communication between DOOM and the driver.
                  #  Is CMD_SEND or CMD_GET.
    command*: cshort           #  Is dest for send, set by get (-1 = no packet).
    remotenode*: cshort        #  Number of bytes in doomdata to be sent
    datalength*: cshort        #  Info common to all nodes.
                      #  Console is allways node 0.
    numnodes*: cshort          #  Flag: 1 = no duplication, 2-5 = dup for slow nets.
    ticdup*: cshort            #  Flag: 1 = send a backup tic in every packet.
    extratics*: cshort         #  Flag: 1 = deathmatch.
    deathmatch*: cshort        #  Flag: -1 = new game, 0-5 = load savegame
    savegame*: cshort
    episode*: cshort           #  1-3
    map*: cshort               #  1-9
    skill*: cshort             #  1-5
                 #  Info specific to this node.
    consoleplayer*: cshort
    numplayers*: cshort        #  These are related to the 3-display mode,
                      #   in which two drones looking left and right
                      #   were used to render two additional views
                      #   on two additional computers.
                      #  Probably not operational anymore.
                      #  1 = left, 0 = center, -1 = right
    angleoffset*: cshort       #  1 = drone
    drone*: cshort             #  The packet data to be sent.
    data*: doomdata_t


#  Create any new ticcmds and broadcast to other players.

#proc NetUpdate*()
#  Broadcasts special packets to other players
#   to notify of game exit

#proc D_QuitNetGame*()
# ? how many ticks to run?

#proc TryRunTics*()
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#   all external data is defined here
#   most of the data is loaded into different structures at run time
#   some internal structures shared by many modules are here
#
# -----------------------------------------------------------------------------

#  The most basic types we use, portability.

#  Some global defines, that configure the game.

#
#  Map level types.
#  The following data structures define the persistent format
#  used in the lumps of the WAD files.
#
#  Lump order in a map WAD: each map needs a couple of lumps
#  to provide a complete scene geometry description.

const
  ML_LABEL* = 0                 #  A separator, name, ExMx or MAPxx
  ML_THINGS* = 1                #  Monsters, items..
  ML_LINEDEFS* = 2              #  LineDefs, from editing
  ML_SIDEDEFS* = 3              #  SideDefs, from editing
  ML_VERTEXES* = 4              #  Vertices, edited and BSP splits generated
  ML_SEGS* = 5                  #  LineSegs, from LineDefs split by BSP
  ML_SSECTORS* = 6              #  SubSectors, list of LineSegs
  ML_NODES* = 7                 #  BSP nodes
  ML_SECTORS* = 8               #  Sectors, from editing
  ML_REJECT* = 9                #  LUT, sector-sector visibility
  ML_BLOCKMAP* = 10             #  LUT, motion clipping, walls/grid element

#  A single Vertex.

type
  mapvertex_t* {.bycopy.} = object
    x*: cshort
    y*: cshort


#  A SideDef, defining the visual appearance of a wall,
#  by setting textures and offsets.

type
  mapsidedef_t* {.bycopy.} = object
    textureoffset*: cshort
    rowoffset*: cshort
    toptexture*: array[8, char]
    bottomtexture*: array[8, char]
    midtexture*: array[8, char] #  Front sector, towards viewer.
    sector*: cshort


#  A LineDef, as used for editing, and as input
#  to the BSP builder.

type
  maplinedef_t* {.bycopy.} = object
    v1*: cshort
    v2*: cshort
    flags*: cshort
    special*: cshort
    tag*: cshort               #  sidenum[1] will be -1 if one sided
    sidenum*: array[2, cshort]


#
#  LineDef attributes.
#
#  Solid, is an obstacle.

const
  ML_BLOCKING* = 1

#  Blocks monsters only.

const
  ML_BLOCKMONSTERS* = 2

#  Backside will not be present at all
#   if not two sided.

const
  ML_TWOSIDED* = 4

#  If a texture is pegged, the texture will have
#  the end exposed to air held constant at the
#  top or bottom of the texture (stairs or pulled
#  down things) and will move with a height change
#  of one of the neighbor sectors.
#  Unpegged textures allways have the first row of
#  the texture at the top pixel of the line for both
#  top and bottom textures (use next to windows).
#  upper texture unpegged

const
  ML_DONTPEGTOP* = 8

#  lower texture unpegged

const
  ML_DONTPEGBOTTOM* = 16

#  In AutoMap: don't map as two sided: IT'S A SECRET!

const
  ML_SECRET* = 32

#  Sound rendering: don't let sound cross two of these.

const
  ML_SOUNDBLOCK* = 64

#  Don't draw on the automap at all.

const
  ML_DONTDRAW* = 128

#  Set if already seen, thus drawn in automap.

const
  ML_MAPPED* = 256

#  Sector definition, from editing.

type
  mapsector_t* {.bycopy.} = object
    floorheight*: cshort
    ceilingheight*: cshort
    floorpic*: array[8, char]
    ceilingpic*: array[8, char]
    lightlevel*: cshort
    special*: cshort
    tag*: cshort


#  SubSector, as generated by BSP.

type
  mapsubsector_t* {.bycopy.} = object
    numsegs*: cshort           #  Index of first one, segs are stored sequentially.
    firstseg*: cshort


#  LineSeg, generated by splitting LineDefs
#  using partition lines selected by BSP builder.

type
  mapseg_t* {.bycopy.} = object
    v1*: cshort
    v2*: cshort
    angle*: cshort
    linedef*: cshort
    side*: cshort
    offset*: cshort


#  BSP node structure.
#  Indicate a leaf.

const
  NF_SUBSECTOR* = 0x00008000

type
  mapnode_t* {.bycopy.} = object
    x*: cshort                 #  Partition line from (x,y) to x+dx,y+dy)
    y*: cshort
    dx*: cshort
    dy*: cshort                #  Bounding box for each child,
              #  clip against view frustum.
    bbox*: array[2, array[4, cshort]] #  If NF_SUBSECTOR its a subsector,
                                  #  else it's a node of another subtree.
    children*: array[2, cushort]


#  Thing definition, position, orientation and type,
#  plus skill/visibility flags and attributes.

type
  mapthing_t* {.bycopy.} = object
    x*: cshort
    y*: cshort
    angle*: cshort
    `type`*: cshort
    options*: cshort


#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#   Internally used data structures for virtually everything,
#    key definitions, lots of other stuff.
#
# -----------------------------------------------------------------------------

#
#  Global parameters/defines.
#
#  DOOM version

const
  VERSION* = 110

#  Game mode handling - identify IWAD version
#   to handle IWAD dependend animations etc.

type
  GameMode_t* = enum
    shareware,                #  DOOM 1 shareware, E1, M9
    registered,               #  DOOM 1 registered, E3, M27
    commercial,               #  DOOM 2 retail, E1 M34
               #  DOOM 2 german edition not handled
    retail,                   #  DOOM 1 retail, E4, M36
    indetermined              #  Well, no IWAD found.


#  Mission packs - might be useful for TC stuff?

type
  GameMission_t* = enum
    doom,                     #  DOOM 1
    doom2,                    #  DOOM 2
    pack_tnt,                 #  TNT mission pack
    pack_plut,                #  Plutonia pack
    none


#  Identify language to use, software localization.

type
  Language_t* = enum
    english, french, german, unknown


#  If rangecheck is undefined,
#  most parameter validation debugging code will not be compiled

const
  RANGECHECK* = true

#  Do or do not use external soundserver.
#  The sndserver binary to be run separately
#   has been introduced by Dave Taylor.
#  The integrated sound support is experimental,
#   and unfinished. Default is synchronous.
#  Experimental asynchronous timer based is
#   handled by SNDINTR.

const
  SNDSERV* = 1

# #define SNDINTR  1
#  This one switches between MIT SHM (no proper mouse)
#  and XFree86 DGA (mickey sampling). The original
#  linuxdoom used SHM, which is default.
# #define X11_DGA		1
#
#  For resize of screen, at start of game.
#  It will not work dynamically, see visplanes.
#

const
  BASE_WIDTH* = 320

#  It is educational but futile to change this
#   scaling e.g. to 2. Drawing of status bar,
#   menues etc. is tied to the scale implied
#   by the graphics.

const
  SCREEN_MUL* = 1
  INV_ASPECT_RATIO* = 0.625

#  Defines suck. C sucks.
#  C++ might sucks for OOP, but it sure is a better C.
#  So there.

const
  SCREENWIDTH* = 320

# SCREEN_MUL*BASE_WIDTH //320

const
  SCREENHEIGHT* = 200

# (int)(SCREEN_MUL*BASE_WIDTH*INV_ASPECT_RATIO) //200
#  The maximum number of players, multiplayer/networking.

const
  MAXPLAYERS* = 4

#  State updates, number of tics / second.

const
  TICRATE* = 35

#  The current state of the game: whether we are
#  playing, gazing at the intermission screen,
#  the game final animation, or a demo.

type
  gamestate_t* = enum
    GS_LEVEL, GS_INTERMISSION, GS_FINALE, GS_DEMOSCREEN


#
#  Difficulty/skill settings/filters.
#
#  Skill flags.

const
  MTF_EASY* = 1
  MTF_NORMAL* = 2
  MTF_HARD* = 4

#  Deaf monsters/do not react to sound.

const
  MTF_AMBUSH* = 8

type
  skill_t* = enum
    sk_baby, sk_easy, sk_medium, sk_hard, sk_nightmare


#
#  Key cards.
#

type
  card_t* = enum
    it_bluecard, it_yellowcard, it_redcard, it_blueskull, it_yellowskull,
    it_redskull, NUMCARDS



#  Ammunition types defined.




#  Power up artifacts.

type
  powertype_t* = enum
    pw_invulnerability, pw_strength, pw_invisibility, pw_ironfeet, pw_allmap,
    pw_infrared, NUMPOWERS


#
#  Power up durations,
#   how many seconds till expiration,
#   assuming TICRATE is 35 ticks/second.
#

type
  powerduration_t* = enum
    INVULNTICS = (30 * TICRATE), 
    INVISTICS = (60 * TICRATE), 
    IRONTICS = (61 * TICRATE)
    INFRATICS = (120 * TICRATE),


#
#  DOOM keyboard definition.
#  This is the stuff configured by Setup.Exe.
#  Most key data are simple ascii (uppercased).
#

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
  KEY_BACKSPACE* = 0x0000007F
  KEY_PAUSE* = 0x000000FF
  KEY_EQUALS* = 0x0000003D
  KEY_MINUS* = 0x0000002D
  KEY_RSHIFT* = (0x00000080 + 0x00000036)
  KEY_RCTRL* = (0x00000080 + 0x0000001D)
  KEY_RALT* = (0x00000080 + 0x00000038)
  KEY_LALT* = KEY_RALT

#  new keys:

const
  KEY_CAPSLOCK* = (0x00000080 + 0x0000003A)
  KEY_NUMLOCK* = (0x00000080 + 0x00000045)
  KEY_SCRLCK* = (0x00000080 + 0x00000046)
  KEY_PRTSCR* = (0x00000080 + 0x00000059)
  KEY_HOME* = (0x00000080 + 0x00000047)
  KEY_END* = (0x00000080 + 0x0000004F)
  KEY_PGUP* = (0x00000080 + 0x00000049)
  KEY_PGDN* = (0x00000080 + 0x00000051)
  KEY_INS* = (0x00000080 + 0x00000052)
  KEY_DEL* = (0x00000080 + 0x00000053)
  KEYP_0* = KEY_INS
  KEYP_1* = KEY_END
  KEYP_2* = KEY_DOWNARROW
  KEYP_3* = KEY_PGDN
  KEYP_4* = KEY_LEFTARROW
  KEYP_5* = (0x00000080 + 0x0000004C)
  KEYP_6* = KEY_RIGHTARROW
  KEYP_7* = KEY_HOME
  KEYP_8* = KEY_UPARROW
  KEYP_9* = KEY_PGUP
  KEYP_DIVIDE* = '/'
  KEYP_PLUS* = '+'
  KEYP_MINUS* = '-'
  KEYP_MULTIPLY* = '*'
  KEYP_PERIOD* = 0
  KEYP_EQUALS* = KEY_EQUALS
  KEYP_ENTER* = KEY_ENTER

#  DOOM basic types (boolean),
#   and max/min values.
# #include "doomtype.h"
#  Fixed point.
# #include "m_fixed.h"
#  Endianess handling.
# #include "m_swap.h"
#  Binary Angles, sine/cosine/atan lookups.
# #include "tables.h"
#  Event type.
# #include "d_event.h"
#  Game function, skills.
# #include "g_game.h"
#  All external data is defined here.
# #include "doomdata.h"
#  All important printed strings.
#  Language selection (message strings).
# #include "dstrings.h"
#  Player is a special actor.
# struct player_s;
# #include "d_items.h"
# #include "d_player.h"
# #include "p_mobj.h"
# #include "d_net.h"
#  PLAY
# #include "p_tick.h"
#  Header, generated by sound utility.
#  The utility was written by Dave Taylor.
# #include "sounds.h"

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#    All the global variables that store the internal state.
#    Theoretically speaking, the internal state of the engine
#     should be found by looking at the variables collected
#     here, and every relevant module will have to include
#     this header file.
#    In practice, things are a bit messy.
#
# -----------------------------------------------------------------------------

#  We need globally shared data structures,
#   for defining the global state variables.

#  We need the playr data structure as well.


#  ------------------------
#  Command line parameters.
#

var nomonsters*: boolean

#  checkparm of -nomonsters

var respawnparm*: boolean

#  checkparm of -respawn

var fastparm*: boolean

#  checkparm of -fast

var devparm*: boolean

#  DEBUG: launched with -devparm
#  -----------------------------------------------------
#  Game Mode - identify IWAD as shareware, retail etc.
#

var gamemode*: GameMode_t

var gamemission*: GameMission_t

#  Set if homebrew PWAD stuff has been added.

var modifiedgame*: boolean

#  -------------------------------------------
#  Language.

var language*: Language_t

#  -------------------------------------------
#  Selected skill type, map etc.
#
#  Defaults for menu, methinks.

var startskill*: skill_t

var startepisode*: cint

var startmap*: cint

var autostart*: boolean

#  Selected by user.

var gameskill*: skill_t

var gameepisode*: cint

var gamemap*: cint

#  Nightmare mode flag, single player.

var respawnmonsters*: boolean

#  Netgame? Only true if >1 player.

var netgame*: boolean

#  Flag: true only if started as net deathmatch.
#  An enum might handle altdeath/cooperative better.

var deathmatch*: boolean

#  -------------------------
#  Internal parameters for sound rendering.
#  These have been taken from the DOS version,
#   but are not (yet) supported with Linux
#   (e.g. no sound volume adjustment with menu.
#  These are not used, but should be (menu).
#  From m_menu.c:
#   Sound FX volume has default, 0 - 15
#   Music volume has default, 0 - 15
#  These are multiplied by 8.

var snd_SfxVolume*: cint

#  maximum volume for sound

var snd_MusicVolume*: cint

#  maximum volume for music
#  Current music/sfx card - index useless
#   w/o a reference LUT in a sound module.
#  Ideally, this would use indices found
#   in: /usr/include/linux/soundcard.h

var snd_MusicDevice*: cint

var snd_SfxDevice*: cint

#  Config file? Same disclaimer as above.

var snd_DesiredMusicDevice*: cint

var snd_DesiredSfxDevice*: cint

#  -------------------------
#  Status flags for refresh.
#
#  Depending on view size - no status bar?
#  Note that there is no way to disable the
#   status bar explicitely.

var statusbaractive*: boolean

var automapactive*: boolean

#  In AutoMap mode?

var menuactive*: boolean

#  Menu overlayed?

var paused*: boolean

#  Game Pause?

var viewactive*: boolean

var nodrawers*: boolean

var noblit*: boolean

var viewwindowx*: cint

var viewwindowy*: cint

var viewheight*: cint

var viewwidth*: cint

var scaledviewwidth*: cint

#  This one is related to the 3-screen display mode.
#  ANG90 = left side, ANG270 = right

var viewangleoffset*: cint

#  Player taking events, and displaying.

var consoleplayer*: cint

var displayplayer*: cint

#  -------------------------------------
#  Scores, rating.
#  Statistics on a given map, for intermission.
#

var totalkills*: cint

var totalitems*: cint

var totalsecret*: cint

#  Timer, for scores.

var levelstarttic*: cint

#  gametic at level start

var leveltime*: cint

#  tics in game play for par
#  --------------------------------------
#  DEMO playback/recording related stuff.
#  No demo, there is a human player in charge?
#  Disable save/end game?

var usergame*: boolean

# ?

var demoplayback*: boolean

var demorecording*: boolean

#  Quit after playing a demo from cmdline.

var singledemo*: boolean

# ?

var gamestate*: gamestate_t

# -----------------------------
#  Internal parameters, fixed.
#  These are set by the engine, and not changed
#   according to user inputs. Partly load from
#   WAD, partly set at startup time.

var gametic*: cint



#  Alive? Disconnected?

var playeringame*: array[MAXPLAYERS, boolean]

#  Player spawn spots for deathmatch.

const
  MAX_DM_STARTS* = 10

var deathmatchstarts*: array[MAX_DM_STARTS, mapthing_t]

var deathmatch_p*: ptr mapthing_t

#  Player spawn spots.

var playerstarts*: array[MAXPLAYERS, mapthing_t]


#  LUT of ammunition limits for each kind.
#  This doubles with BackPack powerup item.

var maxammo*: array[NUMAMMO, cint]

# -----------------------------------------
#  Internal parameters, used for engine.
#
#  File handling stuff.

var basedefault*: array[1024, char]

var debugfile*: ptr FILE

#  if true, load all graphics at level load

var precache*: boolean

#  wipegamestate can be set to -1
#   to force a wipe on the next draw

var wipegamestate*: gamestate_t

var mouseSensitivity*: cint

# ?
#  debug flag to cancel adaptiveness

var singletics*: boolean

var bodyqueslot*: cint

#  Needed to store the number of the dummy sky flat.
#  Used for rendering,
#   as well as tracking projectiles etc.

var skyflatnum*: cint

#  Netgame stuff (buffers and pointers, i.e. indices).
#  This is ???

var doomcom*: ptr doomcom_t

#  This points inside doomcom.

var netbuffer*: ptr doomdata_t

var localcmds*: array[BACKUPTICS, ticcmd_t]

var rndindex*: cint

var maketic*: cint

var nettics*: array[MAXNETNODES, cint]

var netcmds*: array[MAXPLAYERS, array[BACKUPTICS, ticcmd_t]]

var ticdup*: cint

# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Simple basic typedefs, isolated here to make it easier
# 	 separating modules.
#
# -----------------------------------------------------------------------------

#  Fixed to use builtin boolean type with C++.

#type
#  byte* = cuchar

#  Predefined with some OS.

const
  MAXCHAR* = high(cchar)
  MAXSHORT* = high(cshort)
#  Max pos 32-bit int.
const
  MAXINT* = high(cint)
  MAXLONG* = high(clong)
  MINCHAR* = low(cchar)
  MINSHORT* = low(cshort)
#  Max negative 32-bit integer.
const
  MININT* = low(cint)
  MINLONG* = low(clong)
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#
#
# -----------------------------------------------------------------------------

#  The player data structure depends on a number
#  of other structs: items (internal inventory),
#  animation states (closely tied to the sprites
#  used to represent them, unfortunately).

#  In addition, the player is just a special
#  case of the generic moving object/actor.

#  Finally, for odd reasons, the player input
#  is buffered within the player data struct,
#  as commands per game tick.


#
#  Player states.
#

type                          #  Playing or camping.
  playerstate_t* = enum
    PST_LIVE,                 #  Dead on the ground, view follows killer.
    PST_DEAD,                 #  Ready to restart/respawn???
    PST_REBORN


#
#  Player internal flags, for cheats and debug.
#

type                          #  No clipping, walk through barriers.
  cheat_t* = enum
    CF_NOCLIP = 1,              #  No damage, no health loss.
    CF_GODMODE = 2,             #  Not really a cheat, just a debug aid.
    CF_NOMOMENTUM = 4






#
#  INTERMISSION
#  Structure passed e.g. to WI_Start(wb)
#

type
  wbplayerstruct_t* {.bycopy.} = object
    `in`*: boolean             #  whether the player is in game
                 #  Player stats, kills, collected items etc.
    skills*: cint
    sitems*: cint
    ssecret*: cint
    stime*: cint
    frags*: array[4, cint]
    score*: cint               #  current score on entry, modified on return

  wbstartstruct_t* {.bycopy.} = object
    epsd*: cint                #  episode # (0-2)
              #  if true, splash the secret level
    didsecret*: boolean        #  previous and next levels, origin 0
    last*: cint
    next*: cint
    maxkills*: cint
    maxitems*: cint
    maxsecret*: cint
    maxfrags*: cint            #  the par time
    partime*: cint             #  index of this player in game
    pnum*: cint
    plyr*: array[MAXPLAYERS, wbplayerstruct_t]


#  Intermission stats.
#  Parameters for world map / intermission.

var wminfo*: wbstartstruct_t
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#
#  $Log:$
#
#  DESCRIPTION:
# 	DOOM strings, by language.
#
# -----------------------------------------------------------------------------

#  All important printed strings.
#  Language selection (message strings).
#  Use -DFRENCH etc.


#  Misc. other strings.

const
  SAVEGAMENAME* = "doomsav"

#
#  File locations,
#   relative to current position.
#  Path names are OS-sensitive.
#

const
  DEVMAPS* = "devmaps"
  DEVDATA* = "devdata"

#  Not done in french?
#  QuitDOOM messages

const
  NUM_QUITMESSAGES* = 22

var endmsg*: ptr cstring

# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Typedefs related to to textures etc.,
# 	 isolated here to make it easier separating modules.
#
# -----------------------------------------------------------------------------

#
#  Flats?
#
#  a pic is an unmasked block of pixels

type
  pic_t* {.bycopy.} = object
    width*: byte
    height*: byte
    data*: byte


# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#   MapObj data. Map Objects or mobjs are actors, entities,
#   thinker, take-your-pick... anything that moves, acts, or
#   suffers state changes of more or less violent nature.
#
# -----------------------------------------------------------------------------


#
#  Experimental stuff.
#  To compile this as "ANSI C with classes"
#   we will need to handle the various
#   action functions cleanly.
#

type
  actionf_v* = proc ()
  actionf_p1* = proc (a1: pointer)
  actionf_p2* = proc (a1: pointer; a2: pointer)
  actionf_t* {.bycopy.} = object {.union.}
    acp1*: actionf_p1
    acv*: actionf_v
    acp2*: actionf_p2


#  Historically, "think_t" is yet another
#   function pointer to a routine to handle
#   an actor.

type
  think_t* = actionf_t

#  Doubly linked list of actors.

type
  thinker_s* {.bycopy.} = object
    prev*: ptr thinker_s
    next*: ptr thinker_s
    function*: think_t

  thinker_t* = thinker_s


# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	System specific interface stuff.
#
# -----------------------------------------------------------------------------





# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#
#
# -----------------------------------------------------------------------------

#
#  FINALE
#
#  Called by main loop.

#proc F_Responder*(ev: ptr event_t): boolean
#  Called by main loop.

#proc F_Ticker*()
#  Called by main loop.

#proc F_Drawer*()
#proc F_StartFinale*()
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Mission start screen wipe/melt, special effects.
# 	
# -----------------------------------------------------------------------------

#
#                        SCREEN WIPE PACKAGE
#

const                         #  simple gradual pixel change for 8-bit only
  wipe_ColorXForm* = 0          #  weird screen melt
  wipe_Melt* = 1
  wipe_NUMWIPES* = 2

#proc wipe_StartScreen*(x: cint; y: cint; width: cint; height: cint): cint
#proc wipe_EndScreen*(x: cint; y: cint; width: cint; height: cint): cint
#proc wipe_ScreenWipe*(wipeno: cint; x: cint; y: cint; width: cint; height: cint;
                     #ticks: cint): cint
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#    Duh.
#
# -----------------------------------------------------------------------------

#
#  GAME
#

#proc G_DeathMatchSpawnPlayer*(playernum: cint)
#proc G_InitNew*(skill: skill_t; episode: cint; map: cint)
#  Can be called by the startup code or M_Responder.
#  A normal game starts at map 1,
#  but a warp test can start elsewhere

#proc G_DeferedInitNew*(skill: skill_t; episode: cint; map: cint)
#proc G_DeferedPlayDemo*(demo: cstring)
#  Can be called by the startup code or M_Responder,
#  calls P_SetupLevel or W_EnterWorld.

#proc G_LoadGame*(name: cstring)
#proc G_DoLoadGame*()
#  Called by M_Responder.

#proc G_SaveGame*(slot: cint; description: cstring)
#  Only called by startup code.

#proc G_RecordDemo*(name: cstring)
#proc G_BeginRecording*()
#proc G_PlayDemo*(name: cstring)
#proc G_TimeDemo*(name: cstring)
#proc G_CheckDemoStatus*(): boolean
#proc G_ExitLevel*()
##proc G_SecretExitLevel*()
#proc G_WorldDone*()
#proc G_Ticker*()
#proc G_Responder*(ev: ptr event_t): boolean
#proc G_ScreenShot*()
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:  none
#
# -----------------------------------------------------------------------------

#  We are referring to patches.

#  background and foreground screen numbers
#  different from other modules.

const
  BG* = 1
  FG* = 0

#  font stuff

const
  HU_CHARERASE* = KEY_BACKSPACE
  HU_MAXLINES* = 4
  HU_MAXLINELENGTH* = 80

#
#  Typedefs of widgets
#
#  Text Line widget
#   (parent of Scrolling Text and Input Text widgets)



#  Patches.
#  A patch holds one or more columns.
#  Patches are used for sprites and all masked pictures,
#  and we compose textures from the TEXTURE1/2 lists
#  of patches.

type
  patch_t* {.bycopy.} = object
    width* {.importc: "width".}: cshort #  bounding box size
    height* {.importc: "height".}: cshort
    leftoffset* {.importc: "leftoffset".}: cshort #  pixels to the left of origin
    topoffset* {.importc: "topoffset".}: cshort #  pixels below the origin
    columnofs* {.importc: "columnofs".}: array[8, cint] #  only [width] used
                                                   #  the [0] is &columnofs[width]

type
  hu_textline_t* {.bycopy.} = object
    x*: cint                   #  left-justified position of scrolling text window
    y*: cint
    f*: ptr ptr patch_t          #  font
    sc*: cint                  #  start character
    l*: array[HU_MAXLINELENGTH + 1, char] #  line of text
    len*: cint                 #  current line length
             #  whether this line needs to be udpated
    needsupdate*: cint


#  Scrolling Text window widget
#   (child of Text Line widget)

type
  hu_stext_t* {.bycopy.} = object
    l*: array[HU_MAXLINES, hu_textline_t] #  text lines to draw
    h*: cint                   #  height in lines
    cl*: cint                  #  current line number
            #  pointer to boolean stating whether to update window
    on*: ptr boolean
    laston*: boolean           #  last value of *->on.


#  Input Text Line widget
#   (child of Text Line widget)

type
  hu_itext_t* {.bycopy.} = object
    l*: hu_textline_t          #  text line to input on
                    #  left margin past which I am not to delete characters
    lm*: cint                  #  pointer to boolean stating whether to update window
    on*: ptr boolean
    laston*: boolean           #  last value of *->on;


#
#  Widget creation, access, and update routines
#
#  initializes heads-up widget library

#proc HUlib_init*()
#
#  textline code
#
#  clear a line of text

#proc HUlib_clearTextLine*(t: ptr hu_textline_t)
#proc HUlib_initTextLine*(t: ptr hu_textline_t; x: cint; y: cint; f: ptr ptr patch_t;
                        #sc: cint)
#  returns success

#proc HUlib_addCharToTextLine*(t: ptr hu_textline_t; ch: char): boolean
#  returns success

#proc HUlib_delCharFromTextLine*(t: ptr hu_textline_t): boolean
#  draws tline

#proc HUlib_drawTextLine*(l: ptr hu_textline_t; drawcursor: boolean)
#  erases text line

#proc HUlib_eraseTextLine*(l: ptr hu_textline_t)
#
#  Scrolling Text window widget routines
#
#  ?

#proc HUlib_initSText*(s: ptr hu_stext_t; x: cint; y: cint; h: cint; font: ptr ptr patch_t;
                     #startchar: cint; on: ptr boolean)
#  add a new line

#proc HUlib_addLineToSText*(s: ptr hu_stext_t)
#  ?

#proc HUlib_addMessageToSText*(s: ptr hu_stext_t; prefix: cstring; msg: cstring)
#  draws stext

#proc HUlib_drawSText*(s: ptr hu_stext_t)
#  erases all stext lines

#proc HUlib_eraseSText*(s: ptr hu_stext_t)
#  Input Text Line widget routines

#proc HUlib_initIText*(it: ptr hu_itext_t; x: cint; y: cint; font: ptr ptr patch_t;
                     #startchar: cint; on: ptr boolean)
#  enforces left margin

#proc HUlib_delCharFromIText*(it: ptr hu_itext_t)
#  enforces left margin

#proc HUlib_eraseLineFromIText*(it: ptr hu_itext_t)
#  resets line and left margin

#proc HUlib_resetIText*(it: ptr hu_itext_t)
#  left of left-margin

#proc HUlib_addPrefixToIText*(it: ptr hu_itext_t; str: cstring)
#  whether eaten

#proc HUlib_keyInIText*(it: ptr hu_itext_t; ch: cuchar): boolean
#proc HUlib_drawIText*(it: ptr hu_itext_t)
#  erases all itext lines

#proc HUlib_eraseIText*(it: ptr hu_itext_t)
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:  Head up display
#
# -----------------------------------------------------------------------------

#
#  Globally visible constants.
#

const
  HU_FONTSTART* = '!'
  HU_FONTEND* = '_'

#  Calculate # of glyphs in font.

const
  HU_FONTSIZE* = (HU_FONTEND.int8 - HU_FONTSTART.int8 + 1)
  HU_BROADCAST* = 5
  HU_MSGREFRESH* = KEY_ENTER
  HU_MSGX* = 0
  HU_MSGY* = 0
  HU_MSGWIDTH* = 64
  HU_MSGHEIGHT* = 1
  HU_MSGTIMEOUT* = (4 * TICRATE)

#
#  HEADS UP TEXT
#

#proc HU_Init*()
#proc HU_Start*()
#proc HU_Responder*(ev: ptr event_t): boolean
#proc HU_Ticker*()
#proc HU_Drawer*()
#proc HU_dequeueChatChar*(): char
#proc HU_Erase*()
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	System specific network interface stuff.
#
# -----------------------------------------------------------------------------


#  Called by D_DoomMain.

#proc I_InitNetwork*()
#proc I_NetCmd*()
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Thing frame/state LUT,
# 	generated by multigen utilitiy.
# 	This one is the original DOOM version, preserved.
#
# -----------------------------------------------------------------------------

#  Needed for action function pointer handling.

type
  spritenum_t* = enum
    SPR_TROO, SPR_SHTG, SPR_PUNG, SPR_PISG, SPR_PISF, SPR_SHTF, SPR_SHT2, SPR_CHGG,
    SPR_CHGF, SPR_MISG, SPR_MISF, SPR_SAWG, SPR_PLSG, SPR_PLSF, SPR_BFGG, SPR_BFGF,
    SPR_BLUD, SPR_PUFF, SPR_BAL1, SPR_BAL2, SPR_PLSS, SPR_PLSE, SPR_MISL, SPR_BFS1,
    SPR_BFE1, SPR_BFE2, SPR_TFOG, SPR_IFOG, SPR_PLAY, SPR_POSS, SPR_SPOS, SPR_VILE,
    SPR_FIRE, SPR_FATB, SPR_FBXP, SPR_SKEL, SPR_MANF, SPR_FATT, SPR_CPOS, SPR_SARG,
    SPR_HEAD, SPR_BAL7, SPR_BOSS, SPR_BOS2, SPR_SKUL, SPR_SPID, SPR_BSPI, SPR_APLS,
    SPR_APBX, SPR_CYBR, SPR_PAIN, SPR_SSWV, SPR_KEEN, SPR_BBRN, SPR_BOSF, SPR_ARM1,
    SPR_ARM2, SPR_BAR1, SPR_BEXP, SPR_FCAN, SPR_BON1, SPR_BON2, SPR_BKEY, SPR_RKEY,
    SPR_YKEY, SPR_BSKU, SPR_RSKU, SPR_YSKU, SPR_STIM, SPR_MEDI, SPR_SOUL, SPR_PINV,
    SPR_PSTR, SPR_PINS, SPR_MEGA, SPR_SUIT, SPR_PMAP, SPR_PVIS, SPR_CLIP, SPR_AMMO,
    SPR_ROCK, SPR_BROK, SPR_CELL, SPR_CELP, SPR_SHEL, SPR_SBOX, SPR_BPAK, SPR_BFUG,
    SPR_MGUN, SPR_CSAW, SPR_LAUN, SPR_PLAS, SPR_SHOT, SPR_SGN2, SPR_COLU, SPR_SMT2,
    SPR_GOR1, SPR_POL2, SPR_POL5, SPR_POL4, SPR_POL3, SPR_POL1, SPR_POL6, SPR_GOR2,
    SPR_GOR3, SPR_GOR4, SPR_GOR5, SPR_SMIT, SPR_COL1, SPR_COL2, SPR_COL3, SPR_COL4,
    SPR_CAND, SPR_CBRA, SPR_COL6, SPR_TRE1, SPR_TRE2, SPR_ELEC, SPR_CEYE, SPR_FSKU,
    SPR_COL5, SPR_TBLU, SPR_TGRN, SPR_TRED, SPR_SMBT, SPR_SMGT, SPR_SMRT, SPR_HDB1,
    SPR_HDB2, SPR_HDB3, SPR_HDB4, SPR_HDB5, SPR_HDB6, SPR_POB1, SPR_POB2, SPR_BRS1,
    SPR_TLMP, SPR_TLP2, NUMSPRITES
  statenum_t* = enum
    S_NULL, S_LIGHTDONE, S_PUNCH, S_PUNCHDOWN, S_PUNCHUP, S_PUNCH1, S_PUNCH2, S_PUNCH3,
    S_PUNCH4, S_PUNCH5, S_PISTOL, S_PISTOLDOWN, S_PISTOLUP, S_PISTOL1, S_PISTOL2,
    S_PISTOL3, S_PISTOL4, S_PISTOLFLASH, S_SGUN, S_SGUNDOWN, S_SGUNUP, S_SGUN1,
    S_SGUN2, S_SGUN3, S_SGUN4, S_SGUN5, S_SGUN6, S_SGUN7, S_SGUN8, S_SGUN9,
    S_SGUNFLASH1, S_SGUNFLASH2, S_DSGUN, S_DSGUNDOWN, S_DSGUNUP, S_DSGUN1, S_DSGUN2,
    S_DSGUN3, S_DSGUN4, S_DSGUN5, S_DSGUN6, S_DSGUN7, S_DSGUN8, S_DSGUN9, S_DSGUN10,
    S_DSNR1, S_DSNR2, S_DSGUNFLASH1, S_DSGUNFLASH2, S_CHAIN, S_CHAINDOWN, S_CHAINUP,
    S_CHAIN1, S_CHAIN2, S_CHAIN3, S_CHAINFLASH1, S_CHAINFLASH2, S_MISSILE,
    S_MISSILEDOWN, S_MISSILEUP, S_MISSILE1, S_MISSILE2, S_MISSILE3, S_MISSILEFLASH1,
    S_MISSILEFLASH2, S_MISSILEFLASH3, S_MISSILEFLASH4, S_SAW, S_SAWB, S_SAWDOWN,
    S_SAWUP, S_SAW1, S_SAW2, S_SAW3, S_PLASMA, S_PLASMADOWN, S_PLASMAUP, S_PLASMA1,
    S_PLASMA2, S_PLASMAFLASH1, S_PLASMAFLASH2, S_BFG, S_BFGDOWN, S_BFGUP, S_BFG1,
    S_BFG2, S_BFG3, S_BFG4, S_BFGFLASH1, S_BFGFLASH2, S_BLOOD1, S_BLOOD2, S_BLOOD3,
    S_PUFF1, S_PUFF2, S_PUFF3, S_PUFF4, S_TBALL1, S_TBALL2, S_TBALLX1, S_TBALLX2,
    S_TBALLX3, S_RBALL1, S_RBALL2, S_RBALLX1, S_RBALLX2, S_RBALLX3, S_PLASBALL,
    S_PLASBALL2, S_PLASEXP, S_PLASEXP2, S_PLASEXP3, S_PLASEXP4, S_PLASEXP5, S_ROCKET,
    S_BFGSHOT, S_BFGSHOT2, S_BFGLAND, S_BFGLAND2, S_BFGLAND3, S_BFGLAND4, S_BFGLAND5,
    S_BFGLAND6, S_BFGEXP, S_BFGEXP2, S_BFGEXP3, S_BFGEXP4, S_EXPLODE1, S_EXPLODE2,
    S_EXPLODE3, S_TFOG, S_TFOG01, S_TFOG02, S_TFOG2, S_TFOG3, S_TFOG4, S_TFOG5, S_TFOG6,
    S_TFOG7, S_TFOG8, S_TFOG9, S_TFOG10, S_IFOG, S_IFOG01, S_IFOG02, S_IFOG2, S_IFOG3,
    S_IFOG4, S_IFOG5, S_PLAY, S_PLAY_RUN1, S_PLAY_RUN2, S_PLAY_RUN3, S_PLAY_RUN4,
    S_PLAY_ATK1, S_PLAY_ATK2, S_PLAY_PAIN, S_PLAY_PAIN2, S_PLAY_DIE1, S_PLAY_DIE2,
    S_PLAY_DIE3, S_PLAY_DIE4, S_PLAY_DIE5, S_PLAY_DIE6, S_PLAY_DIE7, S_PLAY_XDIE1,
    S_PLAY_XDIE2, S_PLAY_XDIE3, S_PLAY_XDIE4, S_PLAY_XDIE5, S_PLAY_XDIE6,
    S_PLAY_XDIE7, S_PLAY_XDIE8, S_PLAY_XDIE9, S_POSS_STND, S_POSS_STND2, S_POSS_RUN1,
    S_POSS_RUN2, S_POSS_RUN3, S_POSS_RUN4, S_POSS_RUN5, S_POSS_RUN6, S_POSS_RUN7,
    S_POSS_RUN8, S_POSS_ATK1, S_POSS_ATK2, S_POSS_ATK3, S_POSS_PAIN, S_POSS_PAIN2,
    S_POSS_DIE1, S_POSS_DIE2, S_POSS_DIE3, S_POSS_DIE4, S_POSS_DIE5, S_POSS_XDIE1,
    S_POSS_XDIE2, S_POSS_XDIE3, S_POSS_XDIE4, S_POSS_XDIE5, S_POSS_XDIE6,
    S_POSS_XDIE7, S_POSS_XDIE8, S_POSS_XDIE9, S_POSS_RAISE1, S_POSS_RAISE2,
    S_POSS_RAISE3, S_POSS_RAISE4, S_SPOS_STND, S_SPOS_STND2, S_SPOS_RUN1,
    S_SPOS_RUN2, S_SPOS_RUN3, S_SPOS_RUN4, S_SPOS_RUN5, S_SPOS_RUN6, S_SPOS_RUN7,
    S_SPOS_RUN8, S_SPOS_ATK1, S_SPOS_ATK2, S_SPOS_ATK3, S_SPOS_PAIN, S_SPOS_PAIN2,
    S_SPOS_DIE1, S_SPOS_DIE2, S_SPOS_DIE3, S_SPOS_DIE4, S_SPOS_DIE5, S_SPOS_XDIE1,
    S_SPOS_XDIE2, S_SPOS_XDIE3, S_SPOS_XDIE4, S_SPOS_XDIE5, S_SPOS_XDIE6,
    S_SPOS_XDIE7, S_SPOS_XDIE8, S_SPOS_XDIE9, S_SPOS_RAISE1, S_SPOS_RAISE2,
    S_SPOS_RAISE3, S_SPOS_RAISE4, S_SPOS_RAISE5, S_VILE_STND, S_VILE_STND2,
    S_VILE_RUN1, S_VILE_RUN2, S_VILE_RUN3, S_VILE_RUN4, S_VILE_RUN5, S_VILE_RUN6,
    S_VILE_RUN7, S_VILE_RUN8, S_VILE_RUN9, S_VILE_RUN10, S_VILE_RUN11, S_VILE_RUN12,
    S_VILE_ATK1, S_VILE_ATK2, S_VILE_ATK3, S_VILE_ATK4, S_VILE_ATK5, S_VILE_ATK6,
    S_VILE_ATK7, S_VILE_ATK8, S_VILE_ATK9, S_VILE_ATK10, S_VILE_ATK11, S_VILE_HEAL1,
    S_VILE_HEAL2, S_VILE_HEAL3, S_VILE_PAIN, S_VILE_PAIN2, S_VILE_DIE1, S_VILE_DIE2,
    S_VILE_DIE3, S_VILE_DIE4, S_VILE_DIE5, S_VILE_DIE6, S_VILE_DIE7, S_VILE_DIE8,
    S_VILE_DIE9, S_VILE_DIE10, S_FIRE1, S_FIRE2, S_FIRE3, S_FIRE4, S_FIRE5, S_FIRE6,
    S_FIRE7, S_FIRE8, S_FIRE9, S_FIRE10, S_FIRE11, S_FIRE12, S_FIRE13, S_FIRE14,
    S_FIRE15, S_FIRE16, S_FIRE17, S_FIRE18, S_FIRE19, S_FIRE20, S_FIRE21, S_FIRE22,
    S_FIRE23, S_FIRE24, S_FIRE25, S_FIRE26, S_FIRE27, S_FIRE28, S_FIRE29, S_FIRE30,
    S_SMOKE1, S_SMOKE2, S_SMOKE3, S_SMOKE4, S_SMOKE5, S_TRACER, S_TRACER2, S_TRACEEXP1,
    S_TRACEEXP2, S_TRACEEXP3, S_SKEL_STND, S_SKEL_STND2, S_SKEL_RUN1, S_SKEL_RUN2,
    S_SKEL_RUN3, S_SKEL_RUN4, S_SKEL_RUN5, S_SKEL_RUN6, S_SKEL_RUN7, S_SKEL_RUN8,
    S_SKEL_RUN9, S_SKEL_RUN10, S_SKEL_RUN11, S_SKEL_RUN12, S_SKEL_FIST1,
    S_SKEL_FIST2, S_SKEL_FIST3, S_SKEL_FIST4, S_SKEL_MISS1, S_SKEL_MISS2,
    S_SKEL_MISS3, S_SKEL_MISS4, S_SKEL_PAIN, S_SKEL_PAIN2, S_SKEL_DIE1, S_SKEL_DIE2,
    S_SKEL_DIE3, S_SKEL_DIE4, S_SKEL_DIE5, S_SKEL_DIE6, S_SKEL_RAISE1, S_SKEL_RAISE2,
    S_SKEL_RAISE3, S_SKEL_RAISE4, S_SKEL_RAISE5, S_SKEL_RAISE6, S_FATSHOT1,
    S_FATSHOT2, S_FATSHOTX1, S_FATSHOTX2, S_FATSHOTX3, S_FATT_STND, S_FATT_STND2,
    S_FATT_RUN1, S_FATT_RUN2, S_FATT_RUN3, S_FATT_RUN4, S_FATT_RUN5, S_FATT_RUN6,
    S_FATT_RUN7, S_FATT_RUN8, S_FATT_RUN9, S_FATT_RUN10, S_FATT_RUN11, S_FATT_RUN12,
    S_FATT_ATK1, S_FATT_ATK2, S_FATT_ATK3, S_FATT_ATK4, S_FATT_ATK5, S_FATT_ATK6,
    S_FATT_ATK7, S_FATT_ATK8, S_FATT_ATK9, S_FATT_ATK10, S_FATT_PAIN, S_FATT_PAIN2,
    S_FATT_DIE1, S_FATT_DIE2, S_FATT_DIE3, S_FATT_DIE4, S_FATT_DIE5, S_FATT_DIE6,
    S_FATT_DIE7, S_FATT_DIE8, S_FATT_DIE9, S_FATT_DIE10, S_FATT_RAISE1,
    S_FATT_RAISE2, S_FATT_RAISE3, S_FATT_RAISE4, S_FATT_RAISE5, S_FATT_RAISE6,
    S_FATT_RAISE7, S_FATT_RAISE8, S_CPOS_STND, S_CPOS_STND2, S_CPOS_RUN1,
    S_CPOS_RUN2, S_CPOS_RUN3, S_CPOS_RUN4, S_CPOS_RUN5, S_CPOS_RUN6, S_CPOS_RUN7,
    S_CPOS_RUN8, S_CPOS_ATK1, S_CPOS_ATK2, S_CPOS_ATK3, S_CPOS_ATK4, S_CPOS_PAIN,
    S_CPOS_PAIN2, S_CPOS_DIE1, S_CPOS_DIE2, S_CPOS_DIE3, S_CPOS_DIE4, S_CPOS_DIE5,
    S_CPOS_DIE6, S_CPOS_DIE7, S_CPOS_XDIE1, S_CPOS_XDIE2, S_CPOS_XDIE3, S_CPOS_XDIE4,
    S_CPOS_XDIE5, S_CPOS_XDIE6, S_CPOS_RAISE1, S_CPOS_RAISE2, S_CPOS_RAISE3,
    S_CPOS_RAISE4, S_CPOS_RAISE5, S_CPOS_RAISE6, S_CPOS_RAISE7, S_TROO_STND,
    S_TROO_STND2, S_TROO_RUN1, S_TROO_RUN2, S_TROO_RUN3, S_TROO_RUN4, S_TROO_RUN5,
    S_TROO_RUN6, S_TROO_RUN7, S_TROO_RUN8, S_TROO_ATK1, S_TROO_ATK2, S_TROO_ATK3,
    S_TROO_PAIN, S_TROO_PAIN2, S_TROO_DIE1, S_TROO_DIE2, S_TROO_DIE3, S_TROO_DIE4,
    S_TROO_DIE5, S_TROO_XDIE1, S_TROO_XDIE2, S_TROO_XDIE3, S_TROO_XDIE4,
    S_TROO_XDIE5, S_TROO_XDIE6, S_TROO_XDIE7, S_TROO_XDIE8, S_TROO_RAISE1,
    S_TROO_RAISE2, S_TROO_RAISE3, S_TROO_RAISE4, S_TROO_RAISE5, S_SARG_STND,
    S_SARG_STND2, S_SARG_RUN1, S_SARG_RUN2, S_SARG_RUN3, S_SARG_RUN4, S_SARG_RUN5,
    S_SARG_RUN6, S_SARG_RUN7, S_SARG_RUN8, S_SARG_ATK1, S_SARG_ATK2, S_SARG_ATK3,
    S_SARG_PAIN, S_SARG_PAIN2, S_SARG_DIE1, S_SARG_DIE2, S_SARG_DIE3, S_SARG_DIE4,
    S_SARG_DIE5, S_SARG_DIE6, S_SARG_RAISE1, S_SARG_RAISE2, S_SARG_RAISE3,
    S_SARG_RAISE4, S_SARG_RAISE5, S_SARG_RAISE6, S_HEAD_STND, S_HEAD_RUN1,
    S_HEAD_ATK1, S_HEAD_ATK2, S_HEAD_ATK3, S_HEAD_PAIN, S_HEAD_PAIN2, S_HEAD_PAIN3,
    S_HEAD_DIE1, S_HEAD_DIE2, S_HEAD_DIE3, S_HEAD_DIE4, S_HEAD_DIE5, S_HEAD_DIE6,
    S_HEAD_RAISE1, S_HEAD_RAISE2, S_HEAD_RAISE3, S_HEAD_RAISE4, S_HEAD_RAISE5,
    S_HEAD_RAISE6, S_BRBALL1, S_BRBALL2, S_BRBALLX1, S_BRBALLX2, S_BRBALLX3,
    S_BOSS_STND, S_BOSS_STND2, S_BOSS_RUN1, S_BOSS_RUN2, S_BOSS_RUN3, S_BOSS_RUN4,
    S_BOSS_RUN5, S_BOSS_RUN6, S_BOSS_RUN7, S_BOSS_RUN8, S_BOSS_ATK1, S_BOSS_ATK2,
    S_BOSS_ATK3, S_BOSS_PAIN, S_BOSS_PAIN2, S_BOSS_DIE1, S_BOSS_DIE2, S_BOSS_DIE3,
    S_BOSS_DIE4, S_BOSS_DIE5, S_BOSS_DIE6, S_BOSS_DIE7, S_BOSS_RAISE1, S_BOSS_RAISE2,
    S_BOSS_RAISE3, S_BOSS_RAISE4, S_BOSS_RAISE5, S_BOSS_RAISE6, S_BOSS_RAISE7,
    S_BOS2_STND, S_BOS2_STND2, S_BOS2_RUN1, S_BOS2_RUN2, S_BOS2_RUN3, S_BOS2_RUN4,
    S_BOS2_RUN5, S_BOS2_RUN6, S_BOS2_RUN7, S_BOS2_RUN8, S_BOS2_ATK1, S_BOS2_ATK2,
    S_BOS2_ATK3, S_BOS2_PAIN, S_BOS2_PAIN2, S_BOS2_DIE1, S_BOS2_DIE2, S_BOS2_DIE3,
    S_BOS2_DIE4, S_BOS2_DIE5, S_BOS2_DIE6, S_BOS2_DIE7, S_BOS2_RAISE1, S_BOS2_RAISE2,
    S_BOS2_RAISE3, S_BOS2_RAISE4, S_BOS2_RAISE5, S_BOS2_RAISE6, S_BOS2_RAISE7,
    S_SKULL_STND, S_SKULL_STND2, S_SKULL_RUN1, S_SKULL_RUN2, S_SKULL_ATK1,
    S_SKULL_ATK2, S_SKULL_ATK3, S_SKULL_ATK4, S_SKULL_PAIN, S_SKULL_PAIN2,
    S_SKULL_DIE1, S_SKULL_DIE2, S_SKULL_DIE3, S_SKULL_DIE4, S_SKULL_DIE5,
    S_SKULL_DIE6, S_SPID_STND, S_SPID_STND2, S_SPID_RUN1, S_SPID_RUN2, S_SPID_RUN3,
    S_SPID_RUN4, S_SPID_RUN5, S_SPID_RUN6, S_SPID_RUN7, S_SPID_RUN8, S_SPID_RUN9,
    S_SPID_RUN10, S_SPID_RUN11, S_SPID_RUN12, S_SPID_ATK1, S_SPID_ATK2, S_SPID_ATK3,
    S_SPID_ATK4, S_SPID_PAIN, S_SPID_PAIN2, S_SPID_DIE1, S_SPID_DIE2, S_SPID_DIE3,
    S_SPID_DIE4, S_SPID_DIE5, S_SPID_DIE6, S_SPID_DIE7, S_SPID_DIE8, S_SPID_DIE9,
    S_SPID_DIE10, S_SPID_DIE11, S_BSPI_STND, S_BSPI_STND2, S_BSPI_SIGHT, S_BSPI_RUN1,
    S_BSPI_RUN2, S_BSPI_RUN3, S_BSPI_RUN4, S_BSPI_RUN5, S_BSPI_RUN6, S_BSPI_RUN7,
    S_BSPI_RUN8, S_BSPI_RUN9, S_BSPI_RUN10, S_BSPI_RUN11, S_BSPI_RUN12, S_BSPI_ATK1,
    S_BSPI_ATK2, S_BSPI_ATK3, S_BSPI_ATK4, S_BSPI_PAIN, S_BSPI_PAIN2, S_BSPI_DIE1,
    S_BSPI_DIE2, S_BSPI_DIE3, S_BSPI_DIE4, S_BSPI_DIE5, S_BSPI_DIE6, S_BSPI_DIE7,
    S_BSPI_RAISE1, S_BSPI_RAISE2, S_BSPI_RAISE3, S_BSPI_RAISE4, S_BSPI_RAISE5,
    S_BSPI_RAISE6, S_BSPI_RAISE7, S_ARACH_PLAZ, S_ARACH_PLAZ2, S_ARACH_PLEX,
    S_ARACH_PLEX2, S_ARACH_PLEX3, S_ARACH_PLEX4, S_ARACH_PLEX5, S_CYBER_STND,
    S_CYBER_STND2, S_CYBER_RUN1, S_CYBER_RUN2, S_CYBER_RUN3, S_CYBER_RUN4,
    S_CYBER_RUN5, S_CYBER_RUN6, S_CYBER_RUN7, S_CYBER_RUN8, S_CYBER_ATK1,
    S_CYBER_ATK2, S_CYBER_ATK3, S_CYBER_ATK4, S_CYBER_ATK5, S_CYBER_ATK6,
    S_CYBER_PAIN, S_CYBER_DIE1, S_CYBER_DIE2, S_CYBER_DIE3, S_CYBER_DIE4,
    S_CYBER_DIE5, S_CYBER_DIE6, S_CYBER_DIE7, S_CYBER_DIE8, S_CYBER_DIE9,
    S_CYBER_DIE10, S_PAIN_STND, S_PAIN_RUN1, S_PAIN_RUN2, S_PAIN_RUN3, S_PAIN_RUN4,
    S_PAIN_RUN5, S_PAIN_RUN6, S_PAIN_ATK1, S_PAIN_ATK2, S_PAIN_ATK3, S_PAIN_ATK4,
    S_PAIN_PAIN, S_PAIN_PAIN2, S_PAIN_DIE1, S_PAIN_DIE2, S_PAIN_DIE3, S_PAIN_DIE4,
    S_PAIN_DIE5, S_PAIN_DIE6, S_PAIN_RAISE1, S_PAIN_RAISE2, S_PAIN_RAISE3,
    S_PAIN_RAISE4, S_PAIN_RAISE5, S_PAIN_RAISE6, S_SSWV_STND, S_SSWV_STND2,
    S_SSWV_RUN1, S_SSWV_RUN2, S_SSWV_RUN3, S_SSWV_RUN4, S_SSWV_RUN5, S_SSWV_RUN6,
    S_SSWV_RUN7, S_SSWV_RUN8, S_SSWV_ATK1, S_SSWV_ATK2, S_SSWV_ATK3, S_SSWV_ATK4,
    S_SSWV_ATK5, S_SSWV_ATK6, S_SSWV_PAIN, S_SSWV_PAIN2, S_SSWV_DIE1, S_SSWV_DIE2,
    S_SSWV_DIE3, S_SSWV_DIE4, S_SSWV_DIE5, S_SSWV_XDIE1, S_SSWV_XDIE2, S_SSWV_XDIE3,
    S_SSWV_XDIE4, S_SSWV_XDIE5, S_SSWV_XDIE6, S_SSWV_XDIE7, S_SSWV_XDIE8,
    S_SSWV_XDIE9, S_SSWV_RAISE1, S_SSWV_RAISE2, S_SSWV_RAISE3, S_SSWV_RAISE4,
    S_SSWV_RAISE5, S_KEENSTND, S_COMMKEEN, S_COMMKEEN2, S_COMMKEEN3, S_COMMKEEN4,
    S_COMMKEEN5, S_COMMKEEN6, S_COMMKEEN7, S_COMMKEEN8, S_COMMKEEN9, S_COMMKEEN10,
    S_COMMKEEN11, S_COMMKEEN12, S_KEENPAIN, S_KEENPAIN2, S_BRAIN, S_BRAIN_PAIN,
    S_BRAIN_DIE1, S_BRAIN_DIE2, S_BRAIN_DIE3, S_BRAIN_DIE4, S_BRAINEYE,
    S_BRAINEYESEE, S_BRAINEYE1, S_SPAWN1, S_SPAWN2, S_SPAWN3, S_SPAWN4, S_SPAWNFIRE1,
    S_SPAWNFIRE2, S_SPAWNFIRE3, S_SPAWNFIRE4, S_SPAWNFIRE5, S_SPAWNFIRE6,
    S_SPAWNFIRE7, S_SPAWNFIRE8, S_BRAINEXPLODE1, S_BRAINEXPLODE2, S_BRAINEXPLODE3,
    S_ARM1, S_ARM1A, S_ARM2, S_ARM2A, S_BAR1, S_BAR2, S_BEXP, S_BEXP2, S_BEXP3, S_BEXP4,
    S_BEXP5, S_BBAR1, S_BBAR2, S_BBAR3, S_BON1, S_BON1A, S_BON1B, S_BON1C, S_BON1D,
    S_BON1E, S_BON2, S_BON2A, S_BON2B, S_BON2C, S_BON2D, S_BON2E, S_BKEY, S_BKEY2,
    S_RKEY, S_RKEY2, S_YKEY, S_YKEY2, S_BSKULL, S_BSKULL2, S_RSKULL, S_RSKULL2,
    S_YSKULL, S_YSKULL2, S_STIM, S_MEDI, S_SOUL, S_SOUL2, S_SOUL3, S_SOUL4, S_SOUL5,
    S_SOUL6, S_PINV, S_PINV2, S_PINV3, S_PINV4, S_PSTR, S_PINS, S_PINS2, S_PINS3,
    S_PINS4, S_MEGA, S_MEGA2, S_MEGA3, S_MEGA4, S_SUIT, S_PMAP, S_PMAP2, S_PMAP3,
    S_PMAP4, S_PMAP5, S_PMAP6, S_PVIS, S_PVIS2, S_CLIP, S_AMMO, S_ROCK, S_BROK, S_CELL,
    S_CELP, S_SHEL, S_SBOX, S_BPAK, S_BFUG, S_MGUN, S_CSAW, S_LAUN, S_PLAS, S_SHOT,
    S_SHOT2, S_COLU, S_STALAG, S_BLOODYTWITCH, S_BLOODYTWITCH2, S_BLOODYTWITCH3,
    S_BLOODYTWITCH4, S_DEADTORSO, S_DEADBOTTOM, S_HEADSONSTICK, S_GIBS,
    S_HEADONASTICK, S_HEADCANDLES, S_HEADCANDLES2, S_DEADSTICK, S_LIVESTICK,
    S_LIVESTICK2, S_MEAT2, S_MEAT3, S_MEAT4, S_MEAT5, S_STALAGTITE, S_TALLGRNCOL,
    S_SHRTGRNCOL, S_TALLREDCOL, S_SHRTREDCOL, S_CANDLESTIK, S_CANDELABRA, S_SKULLCOL,
    S_TORCHTREE, S_BIGTREE, S_TECHPILLAR, S_EVILEYE, S_EVILEYE2, S_EVILEYE3,
    S_EVILEYE4, S_FLOATSKULL, S_FLOATSKULL2, S_FLOATSKULL3, S_HEARTCOL, S_HEARTCOL2,
    S_BLUETORCH, S_BLUETORCH2, S_BLUETORCH3, S_BLUETORCH4, S_GREENTORCH,
    S_GREENTORCH2, S_GREENTORCH3, S_GREENTORCH4, S_REDTORCH, S_REDTORCH2,
    S_REDTORCH3, S_REDTORCH4, S_BTORCHSHRT, S_BTORCHSHRT2, S_BTORCHSHRT3,
    S_BTORCHSHRT4, S_GTORCHSHRT, S_GTORCHSHRT2, S_GTORCHSHRT3, S_GTORCHSHRT4,
    S_RTORCHSHRT, S_RTORCHSHRT2, S_RTORCHSHRT3, S_RTORCHSHRT4, S_HANGNOGUTS,
    S_HANGBNOBRAIN, S_HANGTLOOKDN, S_HANGTSKULL, S_HANGTLOOKUP, S_HANGTNOBRAIN,
    S_COLONGIBS, S_SMALLPOOL, S_BRAINSTEM, S_TECHLAMP, S_TECHLAMP2, S_TECHLAMP3,
    S_TECHLAMP4, S_TECH2LAMP, S_TECH2LAMP2, S_TECH2LAMP3, S_TECH2LAMP4, NUMSTATES
  state_t* {.bycopy.} = object
    sprite*: spritenum_t
    frame*: clong
    tics*: clong               #  void		(*action) ();
    action*: actionf_t
    nextstate*: statenum_t
    misc1*: clong
    misc2*: clong




var states*: array[NUMSTATES, state_t]

var sprnames*: array[NUMSPRITES, cstring]

type
  mobjtype_t* = enum
    MT_PLAYER, MT_POSSESSED, MT_SHOTGUY, MT_VILE, MT_FIRE, MT_UNDEAD, MT_TRACER,
    MT_SMOKE, MT_FATSO, MT_FATSHOT, MT_CHAINGUY, MT_TROOP, MT_SERGEANT, MT_SHADOWS,
    MT_HEAD, MT_BRUISER, MT_BRUISERSHOT, MT_KNIGHT, MT_SKULL, MT_SPIDER, MT_BABY,
    MT_CYBORG, MT_PAIN, MT_WOLFSS, MT_KEEN, MT_BOSSBRAIN, MT_BOSSSPIT, MT_BOSSTARGET,
    MT_SPAWNSHOT, MT_SPAWNFIRE, MT_BARREL, MT_TROOPSHOT, MT_HEADSHOT, MT_ROCKET,
    MT_PLASMA, MT_BFG, MT_ARACHPLAZ, MT_PUFF, MT_BLOOD, MT_TFOG, MT_IFOG,
    MT_TELEPORTMAN, MT_EXTRABFG, MT_MISC0, MT_MISC1, MT_MISC2, MT_MISC3, MT_MISC4,
    MT_MISC5, MT_MISC6, MT_MISC7, MT_MISC8, MT_MISC9, MT_MISC10, MT_MISC11, MT_MISC12,
    MT_INV, MT_MISC13, MT_INS, MT_MISC14, MT_MISC15, MT_MISC16, MT_MEGA, MT_CLIP,
    MT_MISC17, MT_MISC18, MT_MISC19, MT_MISC20, MT_MISC21, MT_MISC22, MT_MISC23,
    MT_MISC24, MT_MISC25, MT_CHAINGUN, MT_MISC26, MT_MISC27, MT_MISC28, MT_SHOTGUN,
    MT_SUPERSHOTGUN, MT_MISC29, MT_MISC30, MT_MISC31, MT_MISC32, MT_MISC33, MT_MISC34,
    MT_MISC35, MT_MISC36, MT_MISC37, MT_MISC38, MT_MISC39, MT_MISC40, MT_MISC41,
    MT_MISC42, MT_MISC43, MT_MISC44, MT_MISC45, MT_MISC46, MT_MISC47, MT_MISC48,
    MT_MISC49, MT_MISC50, MT_MISC51, MT_MISC52, MT_MISC53, MT_MISC54, MT_MISC55,
    MT_MISC56, MT_MISC57, MT_MISC58, MT_MISC59, MT_MISC60, MT_MISC61, MT_MISC62,
    MT_MISC63, MT_MISC64, MT_MISC65, MT_MISC66, MT_MISC67, MT_MISC68, MT_MISC69,
    MT_MISC70, MT_MISC71, MT_MISC72, MT_MISC73, MT_MISC74, MT_MISC75, MT_MISC76,
    MT_MISC77, MT_MISC78, MT_MISC79, MT_MISC80, MT_MISC81, MT_MISC82, MT_MISC83,
    MT_MISC84, MT_MISC85, MT_MISC86, NUMMOBJTYPES
  mobjinfo_t* {.bycopy.} = object
    doomednum*: cint
    spawnstate*: cint
    spawnhealth*: cint
    seestate*: cint
    seesound*: cint
    reactiontime*: cint
    attacksound*: cint
    painstate*: cint
    painchance*: cint
    painsound*: cint
    meleestate*: cint
    missilestate*: cint
    deathstate*: cint
    xdeathstate*: cint
    deathsound*: cint
    speed*: cint
    radius*: cint
    height*: cint
    mass*: cint
    damage*: cint
    activesound*: cint
    flags*: cint
    raisestate*: cint



var mobjinfo*: array[NUMMOBJTYPES, mobjinfo_t]

# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#
#  DESCRIPTION:
# 	System interface, sound.
#
# -----------------------------------------------------------------------------

#  UNIX hack, to be removed.

#
#  SoundFX struct.
#

type
  sfxinfo_t* = sfxinfo_struct
  sfxinfo_struct* {.bycopy.} = object
    name* {.importc: "name".}: cstring #  up to 6-character name
    #  Sfx singularity (only one at a time)
    singularity* {.importc: "singularity".}: cint #  Sfx priority
    priority* {.importc: "priority".}: cint #  referenced sound if a link
    link* {.importc: "link".}: ptr sfxinfo_t #  pitch if a link
    pitch* {.importc: "pitch".}: cint #  volume if a link
    volume* {.importc: "volume".}: cint #  sound data
    data* {.importc: "data".}: pointer #  this is checked every second to see if sound
                                   #  can be thrown out (if 0, then decrement, if -1,
                                   #  then throw out, if > 0, then it is in use)
    usefulness* {.importc: "usefulness".}: cint #  lump number of sfx
    lumpnum* {.importc: "lumpnum".}: cint

when defined(SNDSERV):
  var sndserver*: ptr FILE
  var sndserver_filename*: cstring
#  Init at program start...

#proc I_InitSound*()
#  ... update sound buffer and audio device at runtime...

#proc I_UpdateSound*()
#proc I_SubmitSound*()
#  ... shut down and relase at program termination.

#proc I_ShutdownSound*()
#
#   SFX I/O
#
#  Initialize channels?

#proc I_SetChannels*()
#  Get raw data lump index for sound descriptor.

#proc I_GetSfxLumpNum*(sfxinfo: ptr sfxinfo_t): cint
#  Starts a sound in a particular sound channel.

#proc I_StartSound*(id: cint; vol: cint; sep: cint; pitch: cint; priority: cint): cint
#  Stops a sound channel.

#proc I_StopSound*(handle: cint)
#  Called by S_*() functions
#   to see if a channel is still playing.
#  Returns 0 if no longer playing, 1 if playing.

#proc I_SoundIsPlaying*(handle: cint): cint
#  Updates the volume, separation,
#   and pitch of a sound channel.

#proc I_UpdateSoundParams*(handle: cint; vol: cint; sep: cint; pitch: cint)
#
#   MUSIC I/O
#

#proc I_InitMusic*()
#proc I_ShutdownMusic*()
#  Volume.

#proc I_SetMusicVolume*(volume: cint)
#  PAUSE game handling.

#proc I_PauseSong*(handle: cint)
#proc I_ResumeSong*(handle: cint)
#  Registers a song handle to song data.

#proc I_RegisterSong*(data: pointer): cint
#  Called by anything that wishes to start music.
#   plays a song, and when the song is done,
#   starts playing it again in an endless loop.
#  Horrible thing to do, considering.

#proc I_PlaySong*(handle: cint; looping: cint)
#  Stops a song over 3 seconds.

#proc I_StopSong*(handle: cint)
#  See above (register), then think backwards

#proc I_UnRegisterSong*(handle: cint)
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	System specific interface stuff.
#
# -----------------------------------------------------------------------------


#  Called by DoomMain.

#proc I_Init*()
#  Called by startup code
#  to get the ammount of memory to malloc
#  for the zone management.

#proc I_ZoneBase*(size: ptr cint): ptr byte
#  Called by D_DoomLoop,
#  returns current time in tics.

#proc I_GetTime*(): cint
#
#  Called by D_DoomLoop,
#  called before #processing any tics in a frame
#  (just after displaying a frame).
#  Time consuming syncronous operations
#  are performed here (joystick reading).
#  Can call D_PostEvent.
#

#proc I_StartFrame*()
#
#  Called by D_DoomLoop,
#  called before #processing each tic in a frame.
#  Quick syncronous operations are performed here.
#  Can call D_PostEvent.

#proc I_StartTic*()
#  Asynchronous interrupt functions should maintain private queues
#  that are read by the synchronous functions
#  to be converted into events.
#  Either returns a null ticcmd,
#  or calls a loadable driver to build it.
#  This ticcmd will then be modified by the gameloop
#  for normal input.

#proc I_BaseTiccmd*(): ptr ticcmd_t
#  Called by M_Responder when quit is selected.
#  Clean exit, displays sell blurb.

#proc I_Quit*()
#  Allocates from low memory under dos,
#  just mallocs under unix

#proc I_AllocLow*(length: cint): ptr byte
#proc I_Tactile*(on: cint; off: cint; total: cint)
#proc I_Error*(error: cstring) {.varargs.}
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	System specific interface stuff.
#
# -----------------------------------------------------------------------------


#  Called by D_DoomMain,
#  determines the hardware configuration
#  and sets up the video mode

#proc I_InitGraphics*()
#proc I_ShutdownGraphics*()
#  Takes full 8 bit values.

#proc I_SetPalette*(palette: ptr byte)
#proc I_UpdateNoBlit*()
#proc I_FinishUpdate*()
#  Wait for vertical retrace or pause a bit.

#proc I_WaitVBL*(count: cint)
#proc I_ReadScreen*(scr: ptr byte)
#proc I_BeginRead*()
#proc I_EndRead*()
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#   Nil.
#
# -----------------------------------------------------------------------------

#
#  MISC
#

var myargc*: cint

var myargv*: cstringArray

#  Returns the position of the given parameter
#  in the arg list (0 if not found).

#proc M_CheckParm*(check: cstring): cint
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#     Nil.
#
# -----------------------------------------------------------------------------

#  Bounding box coordinate storage.

const
  BOXTOP* = 0
  BOXBOTTOM* = 1
  BOXLEFT* = 2
  BOXRIGHT* = 3

#  bbox coordinates
#  Bounding box functions.

#proc M_ClearBox*(box: ptr fixed_t)
#proc M_AddToBox*(box: ptr fixed_t; x: fixed_t; y: fixed_t)
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Cheat code checking.
#
# -----------------------------------------------------------------------------

#
#  CHEAT SEQUENCE PACKAGE
#

template SCRAMBLE*(a: untyped): untyped =
  ((((a) and 1) shl 7) + (((a) and 2) shl 5) + ((a) and 4) + (((a) and 8) shl 1) +
      (((a) and 16) shr 1) + ((a) and 32) + (((a) and 64) shr 5) + (((a) and 128) shr 7))

type
  cheatseq_t* {.bycopy.} = object
    sequence*: ptr cuchar
    p*: ptr cuchar


#proc cht_CheckCheat*(cht: ptr cheatseq_t; key: char): cint
#proc cht_GetParam*(cht: ptr cheatseq_t; buffer: cstring)
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Fixed point arithemtics, implementation.
#
# -----------------------------------------------------------------------------


#
#  Fixed point, 32bit as 16.16.
#

const
  FRACBITS* = 16
  FRACUNIT* = (1 shl FRACBITS)


#proc FixedMul*(a: fixed_t; b: fixed_t): fixed_t
#proc FixedDiv*(a: fixed_t; b: fixed_t): fixed_t
#proc FixedDiv2*(a: fixed_t; b: fixed_t): fixed_t
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#    Menu widget stuff, episode selection and such.
#
# -----------------------------------------------------------------------------

#
#  MENUS
#
#  Called by main loop,
#  saves config file and calls I_Quit when user exits.
#  Even when the menu is not displayed,
#  this can resize the view and change game parameters.
#  Does all the real work of the menu interaction.

#proc M_Responder*(ev: ptr event_t): boolean
#  Called by main loop,
#  only used for menu (skull cursor) animation.

#proc M_Ticker*()
#  Called by main loop,
#  draws the menus directly into the screen buffer.

#proc M_Drawer*()
#  Called by D_DoomMain,
#  loads the config file.

#proc M_Init*()
#  Called by intro code to force menu up upon a keypress,
#  does nothing if menu is already up.

#proc M_StartControlPanel*()
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#
#
# -----------------------------------------------------------------------------

#
#  MISC
#

#proc M_WriteFile*(name: cstring; source: pointer; length: cint): boolean
#proc M_ReadFile*(name: cstring; buffer: ptr ptr byte): cint
#proc M_ScreenShot*()
#proc M_LoadDefaults*()
#proc M_SaveDefaults*()
#proc M_DrawText*(x: cint; y: cint; direct: boolean; string: cstring): cint
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#
#
# -----------------------------------------------------------------------------

#  Returns a number from 0 to 255,
#  from a lookup table.

#proc M_Random*(): cint
#  As M_Random, but used only by the play simulation.

##proc P_Random*(): cint
#  Fix randoms for demos.

#proc M_ClearRandom*()
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Endianess handling, swapping 16bit and 32bit.
#
# -----------------------------------------------------------------------------


#  Endianess handling.
#  WAD files are stored little endian.

when cpuEndian == bigEndian:
  template SHORT*(x: untyped): untyped =
    (cast[cshort](SwapSHORT(cast[cushort]((x)))))

  template LONG*(x: untyped): untyped =
    (cast[clong](SwapLONG(cast[culong]((x)))))

else:
  template SHORT*(x: untyped): untyped =
    (x)

  template LONG*(x: untyped): untyped =
    (x)

# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#
#
# -----------------------------------------------------------------------------



# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Play functions, animation, global header.
#
# -----------------------------------------------------------------------------

const
  FLOATSPEED* = (FRACUNIT * 4)
  MAXHEALTH* = 100
  VIEWHEIGHT* = (41 * FRACUNIT)

#  mapblocks are used to check movement
#  against lines and things

const
  MAPBLOCKUNITS* = 128
  MAPBLOCKSIZE* = (MAPBLOCKUNITS * FRACUNIT)
  MAPBLOCKSHIFT* = (FRACBITS + 7)
  MAPBMASK* = (MAPBLOCKSIZE - 1)
  MAPBTOFRAC* = (MAPBLOCKSHIFT - FRACBITS)

#  player radius for movement checking

const
  PLAYERRADIUS* = 16 * FRACUNIT

#  MAXRADIUS is for precalculated sector block boxes
#  the spider demon is larger,
#  but we do not have any moving sectors nearby

const
  MAXRADIUS* = 32 * FRACUNIT
  GRAVITY* = FRACUNIT
  MAXMOVE* = (30 * FRACUNIT)
  USERANGE* = (64 * FRACUNIT)
  MELEERANGE* = (64 * FRACUNIT)
  MISSILERANGE* = (32 * 64 * FRACUNIT)

#  follow a player exlusively for 3 seconds

const
  BASETHRESHOLD* = 100

#
#  P_TICK
#
#  both the head and tail of the thinker list

#  Map Object definition.

const
  SIL_NONE* = 0
  SIL_BOTTOM* = 1
  SIL_TOP* = 2
  SIL_BOTH* = 3
  MAXDRAWSEGS* = 256

#
#  INTERNAL MAP TYPES
#   used by play and refresh
#
#
#  Your plain vanilla vertex.
#  Note: transformed values not buffered locally,
#   like some DOOM-alikes ("wt", "WebView") did.
#

type
  vertex_t* {.bycopy.} = object
    x* {.importc: "x".}: fixed_t
    y* {.importc: "y".}: fixed_t


#  Forward of LineDefs, for Sectors.

type
  line_s* {.bycopy.} = object


#  Each sector has a degenmobj_t in its center
#   for sound origin purposes.
#  I suppose this does not handle sound from
#   moving objects (doppler), because
#   position is prolly just buffered, not
#   updated.

type
  degenmobj_t* {.bycopy.} = object
    thinker* {.importc: "thinker".}: thinker_t #  not used for anything
    x* {.importc: "x".}: fixed_t
    y* {.importc: "y".}: fixed_t
    z* {.importc: "z".}: fixed_t


#
#  The SECTORS record, at runtime.
#  Stores things/mobjs.
#

type
  psprnum_t* = enum
    ps_weapon, ps_flash, NUMPSPRITES

  pspdef_t* {.bycopy.} = object
    state*: ptr state_t         #  a NULL state means not active
    tics*: cint
    sx*: fixed_t
    sy*: fixed_t

type
  sector_t* {.bycopy.} = object
    floorheight* {.importc: "floorheight".}: fixed_t
    ceilingheight* {.importc: "ceilingheight".}: fixed_t
    floorpic* {.importc: "floorpic".}: cshort
    ceilingpic* {.importc: "ceilingpic".}: cshort
    lightlevel* {.importc: "lightlevel".}: cshort
    special* {.importc: "special".}: cshort
    tag* {.importc: "tag".}: cshort #  0 = untraversed, 1,2 = sndlines -1
    soundtraversed* {.importc: "soundtraversed".}: cint #  thing that made a sound (or null)
    soundtarget* {.importc: "soundtarget".}: ptr mobj_t #  mapblock bounding box for height changes
    blockbox* {.importc: "blockbox".}: array[4, cint] #  origin for any sounds played by the sector
    soundorg* {.importc: "soundorg".}: degenmobj_t #  if == validcount, already checked
    validcount* {.importc: "validcount".}: cint #  list of mobjs in sector
    thinglist* {.importc: "thinglist".}: ptr mobj_t #  thinker_t for reversable actions
    specialdata* {.importc: "specialdata".}: pointer
    linecount* {.importc: "linecount".}: cint
    lines* {.importc: "lines".}: ptr ptr line_s #  [linecount] size


  subsector_s*  = object
    sector* {.importc: "sector".}: ptr sector_t
    numlines* {.importc: "numlines".}: cshort
    firstline* {.importc: "firstline".}: cshort 

  subsector_t* = subsector_s


  mobj_s* {.bycopy.} = object
    thinker*: thinker_t        #  List: thinker links.
    #  Info for drawing: position.
    x*: fixed_t
    y*: fixed_t
    z*: fixed_t                #  More list: links in sector (if needed)
    snext*: ptr mobj_s
    sprev*: ptr mobj_s          # More drawing info: to determine current sprite.
    angle*: angle_t            #  orientation
    sprite*: spritenum_t       #  used to find patch_t and flip value
    frame*: cint               #  might be ORed with FF_FULLBRIGHT
               #  Interaction info, by BLOCKMAP.
               #  Links in blocks (if needed).
    bnext*: ptr mobj_s
    bprev*: ptr mobj_s
    subsector*: ptr subsector_s #  The closest interval over all contacted Sectors.
    floorz*: fixed_t
    ceilingz*: fixed_t         #  For movement checking.
    radius*: fixed_t
    height*: fixed_t           #  Momentums, used to update position.
    momx*: fixed_t
    momy*: fixed_t
    momz*: fixed_t             #  If == validcount, already checked.
    validcount*: cint
    `type`*: mobjtype_t
    info*: ptr mobjinfo_t       #  &mobjinfo[mobj->type]
    tics*: cint                #  state tic counter
    state*: ptr state_t
    flags*: cint
    health*: cint              #  Movement direction, movement generation (zig-zagging).
    movedir*: cint             #  0-7
    movecount*: cint           #  when 0, select a new dir
                   #  Thing being chased/attacked (or NULL),
                   #  also the originator for missiles.
    target*: ptr mobj_s         #  Reaction time: if non 0, don't attack yet.
                     #  Used by player to freeze a bit after teleporting.
    reactiontime*: cint        #  If >0, the target will be chased
                      #  no matter what (even if shot)
    threshold*: cint           #  Additional info record for player avatars only.
                   #  Only valid if type == MT_PLAYER
    player*: ptr player_s       #  Player number last looked for.
    lastlook*: cint            #  For nightmare respawn.
    spawnpoint*: mapthing_t    #  Thing being chased/attacked for tracers.
    tracer*: ptr mobj_s

  mobj_t* = mobj_s
  
  player_s* {.bycopy.} = object
    mo*: ptr mobj_t
    playerstate*: playerstate_t
    cmd*: ticcmd_t             #  Determine POV,
                 #   including viewpoint bobbing during movement.
                 #  Focal origin above r.z
    viewz*: fixed_t            #  Base height above floor for viewz.
    viewheight*: fixed_t       #  Bob/squat speed.
    deltaviewheight*: fixed_t  #  bounded/scaled total momentum.
    bob*: fixed_t              #  This is only used between levels,
                #  mo->health is used during levels.
    health*: cint
    armorpoints*: cint         #  Armor type is 0-2.
    armortype*: cint           #  Power ups. invinc and invis are tic counters.
    powers*: array[NUMPOWERS, cint]
    cards*: array[NUMCARDS, boolean]
    backpack*: boolean         #  Frags, kills of other players.
    frags*: array[MAXPLAYERS, cint]
    readyweapon*: weapontype_t #  Is wp_nochange if not changing.
    pendingweapon*: weapontype_t
    weaponowned*: array[NUMWEAPONS, boolean]
    ammo*: array[NUMAMMO, cint]
    maxammo*: array[NUMAMMO, cint] #  True if button down last tic.
    attackdown*: cint
    usedown*: cint             #  Bit flags, for cheats and debug.
                 #  See cheat_t, above.
    cheats*: cint              #  Refired shots are less accurate.
    refire*: cint              #  For intermission stats.
    killcount*: cint
    itemcount*: cint
    secretcount*: cint         #  Hint messages.
    message*: cstring          #  For screen flashing (red or bright).
    damagecount*: cint
    bonuscount*: cint          #  Who did damage (NULL for floors/ceilings).
    attacker*: ptr mobj_t       #  So gun flashes light up areas.
    extralight*: cint          #  Current PLAYPAL, ???
                    #   can be set to REDCOLORMAP for pain, etc.
    fixedcolormap*: cint       #  Player skin colorshift,
                       #   0-3 for which color to draw player.
    colormap*: cint            #  Overlay view sprites (gun, etc).
    psprites*: array[NUMPSPRITES, pspdef_t] #  True if secret level has been done.
    didsecret*: boolean

  player_t* = player_s

var thinkercap*: thinker_t

#proc P_InitThinkers*()
#proc P_AddThinker*(thinker: ptr thinker_t)
#proc P_RemoveThinker*(thinker: ptr thinker_t)
#
#  P_PSPR
#

#proc P_SetupPsprites*(curplayer: ptr player_t)
#proc P_MovePsprites*(curplayer: ptr player_t)
#proc P_DropWeapon*(player: ptr player_t)
#
#  P_USER
#

#proc P_PlayerThink*(player: ptr player_t)
#
#  P_MOBJ
#

const
  ONFLOORZ* = MININT
  ONCEILINGZ* = MAXINT

#  Time interval for item respawning.

const
  ITEMQUESIZE* = 128

var itemrespawnque*: array[ITEMQUESIZE, mapthing_t]

var itemrespawntime*: array[ITEMQUESIZE, cint]

var iquehead*: cint

var iquetail*: cint

#proc P_RespawnSpecials*()
#proc P_SpawnMobj*(x: fixed_t; y: fixed_t; z: fixed_t; `type`: mobjtype_t): ptr mobj_t
#proc P_RemoveMobj*(th: ptr mobj_t)
#proc P_SetMobjState*(mobj: ptr mobj_t; state: statenum_t): boolean
#proc P_MobjThinker*(mobj: ptr mobj_t)
#proc P_SpawnPuff*(x: fixed_t; y: fixed_t; z: fixed_t)
#proc P_SpawnBlood*(x: fixed_t; y: fixed_t; z: fixed_t; damage: cint)
#proc P_SpawnMissile*(source: ptr mobj_t; dest: ptr mobj_t; `type`: mobjtype_t): ptr mobj_t
# #proc P_SpawnPlayerMissile*(source: ptr mobj_t; `type`: mobjtype_t)
#
#  P_ENEMY
#

#proc P_NoiseAlert*(target: ptr mobj_t; emmiter: ptr mobj_t)
#
#  P_MAPUTL
#

#
#  Move clipping aid for LineDefs.
#

type
  slopetype_t* {.size: sizeof(cint).} = enum
    ST_HORIZONTAL, ST_VERTICAL, ST_POSITIVE, ST_NEGATIVE

  line_t* = object
    v1* {.importc: "v1".}: ptr vertex_t #  Vertices, from v1 to v2.
    v2* {.importc: "v2".}: ptr vertex_t #  Precalculated v2 - v1 for side checking.
    dx* {.importc: "dx".}: fixed_t
    dy* {.importc: "dy".}: fixed_t #  Animation related.
    flags* {.importc: "flags".}: cshort
    special* {.importc: "special".}: cshort
    tag* {.importc: "tag".}: cshort #  Visual appearance: SideDefs.
                                #   sidenum[1] will be -1 if one sided
    sidenum* {.importc: "sidenum".}: array[2, cshort] #  Neat. Another bounding box, for the extent
                                                 #   of the LineDef.
    bbox* {.importc: "bbox".}: array[4, fixed_t] #  To aid move clipping.
    slopetype* {.importc: "slopetype".}: slopetype_t #  Front and back sector.
                                                 #  Note: redundant? Can be retrieved from SideDefs.
    frontsector* {.importc: "frontsector".}: ptr sector_t
    backsector* {.importc: "backsector".}: ptr sector_t #  if == validcount, already checked
    validcount* {.importc: "validcount".}: cint #  thinker_t for reversable actions
    specialdata* {.importc: "specialdata".}: pointer

type
  INNER_C_UNION_p_local_149* {.bycopy.} = object {.union.}
    thing*: ptr mobj_t
    line*: ptr line_t

  divline_t* {.bycopy.} = object
    x*: fixed_t
    y*: fixed_t
    dx*: fixed_t
    dy*: fixed_t

  intercept_t* {.bycopy.} = object
    frac*: fixed_t             #  along trace line
    isaline*: boolean
    d*: INNER_C_UNION_p_local_149


const
  MAXINTERCEPTS* = 128

var intercepts*: array[MAXINTERCEPTS, intercept_t]

var intercept_p*: ptr intercept_t

type
  traverser_t* = proc (`in`: ptr intercept_t): boolean

var opentop*: fixed_t

var openbottom*: fixed_t

var openrange*: fixed_t

var lowfloor*: fixed_t

#proc P_LineOpening*(linedef: ptr line_t)
#proc P_BlockLinesIterator*(x: cint; y: cint; `func`: #proc (a1: ptr line_t): boolean): boolean
#proc P_BlockThingsIterator*(x: cint; y: cint; `func`: #proc (a1: ptr mobj_t): boolean): boolean
const
  PT_ADDLINES* = 1
  PT_ADDTHINGS* = 2
  PT_EARLYOUT* = 4

var trace*: divline_t

#proc P_PathTraverse*(x1: fixed_t; y1: fixed_t; x2: fixed_t; y2: fixed_t; flags: cint;
                    #trav: #proc (a1: ptr intercept_t): boolean): boolean
# #proc P_UnsetThingPosition*(thing: ptr mobj_t)
#proc P_SetThingPosition*(thing: ptr mobj_t)
#
#  P_MAP
#
#  If "floatok" true, move would be ok
#  if within "tmfloorz - tmceilingz".

var floatok*: boolean

var tmfloorz*: fixed_t

var tmceilingz*: fixed_t

var ceilingline*: ptr line_t

#proc P_CheckPosition*(thing: ptr mobj_t; x: fixed_t; y: fixed_t): boolean
#proc P_TryMove*(thing: ptr mobj_t; x: fixed_t; y: fixed_t): boolean
#proc P_TeleportMove*(thing: ptr mobj_t; x: fixed_t; y: fixed_t): boolean
#proc P_SlideMove*(mo: ptr mobj_t)
#proc P_CheckSight*(t1: ptr mobj_t; t2: ptr mobj_t): boolean
#proc P_UseLines*(player: ptr player_t)
#proc P_ChangeSector*(sector: ptr sector_t; crunch: boolean): boolean
var linetarget*: ptr mobj_t

#  who got hit (or NULL)

#proc P_AimLineAttack*(t1: ptr mobj_t; angle: angle_t; distance: fixed_t): fixed_t
#proc P_LineAttack*(t1: ptr mobj_t; angle: angle_t; distance: fixed_t; slope: fixed_t;
                  #damage: cint)
#proc P_RadiusAttack*(spot: ptr mobj_t; source: ptr mobj_t; damage: cint)
#
#  P_SETUP
#

var rejectmatrix*: ptr byte

#  for fast sight rejection

var blockmaplump*: ptr cshort

#  offsets in blockmap are from here

var blockmap*: ptr cshort

var bmapwidth*: cint

var bmapheight*: cint

#  in mapblocks

var bmaporgx*: fixed_t

var bmaporgy*: fixed_t

#  origin of block map

var blocklinks*: ptr ptr mobj_t

#  for thing chains
#
#  P_INTER
#

var clipammo*: array[NUMAMMO, cint]

#proc P_TouchSpecialThing*(special: ptr mobj_t; toucher: ptr mobj_t)
#proc P_DamageMobj*(target: ptr mobj_t; inflictor: ptr mobj_t; source: ptr mobj_t;
                  #damage: cint)
#
#  P_SPEC
#

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Map Objects, MObj, definition and handling.
#
# -----------------------------------------------------------------------------

#  Basics.

#  We need the thinker_t stuff.

#  We need the WAD data structure for Map things,
#  from the THINGS lump.

#  States are tied to finite states are
#   tied to animation frames.
#  Needs precompiled tables/data structures.


#
#  NOTES: mobj_t
#
#  mobj_ts are used to tell the refresh where to draw an image,
#  tell the world simulation when objects are contacted,
#  and tell the sound driver how to position a sound.
#
#  The refresh uses the next and prev links to follow
#  lists of things in sectors as they are being drawn.
#  The sprite, frame, and angle elements determine which patch_t
#  is used to draw the sprite if it is visible.
#  The sprite and frame values are allmost allways set
#  from state_t structures.
#  The statescr.exe utility generates the states.h and states.c
#  files that contain the sprite/frame numbers from the
#  statescr.txt source file.
#  The xyz origin point represents a point at the bottom middle
#  of the sprite (between the feet of a biped).
#  This is the default origin position for patch_ts grabbed
#  with lumpy.exe.
#  A walking creature will have its z equal to the floor
#  it is standing on.
#
#  The sound code uses the x,y, and subsector fields
#  to do stereo positioning of any sound effited by the mobj_t.
#
#  The play simulation uses the blocklinks, x,y,z, radius, height
#  to determine when mobj_ts are touching each other,
#  touching lines in the map, or hit by trace lines (gunshots,
#  lines of sight, etc).
#  The mobj_t->flags element has various bit flags
#  used by the simulation.
#
#  Every mobj_t is linked into a single sector
#  based on its origin coordinates.
#  The subsector_t is found with R_PointInSubsector(x,y),
#  and the sector_t can be found with subsector->sector.
#  The sector links are only used by the rendering code,
#  the play simulation does not care about them at all.
#
#  Any mobj_t that needs to be acted upon by something else
#  in the play world (block movement, be shot, etc) will also
#  need to be linked into the blockmap.
#  If the thing has the MF_NOBLOCK flag set, it will not use
#  the block links. It can still interact with other things,
#  but only as the instigator (missiles will run into other
#  things, but nothing can run into a missile).
#  Each block in the grid is 128*128 units, and knows about
#  every line_t that it contains a piece of, and every
#  interactable mobj_t that has its origin contained.
#
#  A valid mobj_t is a mobj_t that has the proper subsector_t
#  filled in for its xy coordinates and is linked into the
#  sector from which the subsector was made, or has the
#  MF_NOSECTOR flag set (the subsector_t needs to be valid
#  even if MF_NOSECTOR is set), and is linked into a blockmap
#  block or has the MF_NOBLOCKMAP flag set.
#  Links should only be modified by the P_[Un]SetThingPosition()
#  functions.
#  Do not change the MF_NO? flags while a thing is valid.
#
#  Any questions?
#
#
#  Misc. mobj flags
#

type                          #  Call P_SpecialThing when touched.
  mobjflag_t* = enum
    MF_SPECIAL = 1,             #  Blocks.
    MF_SOLID = 2,               #  Can be hit.
    MF_SHOOTABLE = 4,           #  Don't use the sector links (invisible but touchable).
    MF_NOSECTOR = 8,            #  Don't use the blocklinks (inert but displayable)
    MF_NOBLOCKMAP = 16,         #  Not to be activated by sound, deaf monster.
    MF_TRANSSHIFT = 26, MF_AMBUSH = 32, #  Will try to attack right back.
    MF_JUSTHIT = 64,            #  Will take at least one step before attacking.
    MF_JUSTATTACKED = 128,      #  On level spawning (initial position),
                        #   hang from ceiling instead of stand on floor.
    MF_SPAWNCEILING = 256, #  Don't apply gravity (every tic),
                        #   that is, object will float, keeping current height
                        #   or changing it actively.
    MF_NOGRAVITY = 512,         #  Movement flags.
                     #  This allows jumps from high places.
    MF_DROPOFF = 0x00000400,    #  For players, will pick up items.
    MF_PICKUP = 0x00000800,     #  Player cheat. ???
    MF_NOCLIP = 0x00001000,     #  Player: keep info about sliding along walls.
    MF_SLIDE = 0x00002000,      #  Allow moves to any height, no gravity.
                        #  For active floaters, e.g. cacodemons, pain elementals.
    MF_FLOAT = 0x00004000,      #  Don't cross lines
                        #    ??? or look at heights on teleport.
    MF_TELEPORT = 0x00008000,   #  Don't hit same species, explode on block.
                           #  Player missiles as well as fireballs of various kinds.
    MF_MISSILE = 0x00010000,    #  Dropped by a demon, not level spawned.
                          #  E.g. ammo clips dropped by dying former humans.
    MF_DROPPED = 0x00020000,    #  Use fuzzy draw (shadow demons or spectres),
                          #   temporary player invisibility powerup.
    MF_SHADOW = 0x00040000,     #  Flag: don't bleed when shot (use puff),
                         #   barrels and shootable furniture shall not bleed.
    MF_NOBLOOD = 0x00080000,    #  Don't stop moving halfway off a step,
                          #   that is, have dead bodies slide down all the way.
    MF_CORPSE = 0x00100000,     #  Floating to a height for a move, ???
                         #   don't auto float to target's height.
    MF_INFLOAT = 0x00200000,    #  On kill, count this enemy object
                          #   towards intermission kill total.
                          #  Happy gathering.
    MF_COUNTKILL = 0x00400000,  #  On picking up, count this item object
                            #   towards intermission item total.
    MF_COUNTITEM = 0x00800000,  #  Special handling: skull in flight.
                            #  Neither a cacodemon nor a missile.
    MF_SKULLFLY = 0x01000000,   #  Don't spawn this object
                           #   in death match mode (e.g. key cards).
    MF_NOTDMATCH = 0x02000000, #  Player sprites in multiplayer modes are modified
                            #   using an internal color lookup table for re-indexing.
                            #  If 0x4 0x8 or 0xc,
                            #   use a translation table for player colormaps
    MF_TRANSLATION = 0x0C000000 #  Hmm ???.




#  Bookkeeping on players - state.

#proc P_GivePower*(a1: ptr player_t; a2: cint): boolean


# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#   Sprite animation.
#
# -----------------------------------------------------------------------------

#  Basic data types.
#  Needs fixed point, and BAM angles.

#
#  Needs to include the precompiled
#   sprite animation tables.
#  Header generated by multigen utility.
#  This includes all the data for thing animation,
#  i.e. the Thing Atrributes table
#  and the Frame Sequence table.


#
#  Frame flags:
#  handles maximum brightness (torches, muzzle flare, light sources)
#

const
  FF_FULLBRIGHT* = 0x00008000
  FF_FRAMEMASK* = 0x00007FFF

#
#  Overlay psprites are scaled shapes
#  drawn directly on the view screen,
#  coordinates are given for a 320*200 view screen.
#

discard """
type
  psprnum_t* = enum
    ps_weapon, ps_flash, NUMPSPRITES
  pspdef_t* {.bycopy.} = object
    state*: ptr state_t         #  a NULL state means not active
    tics*: cint
    sx*: fixed_t
    sy*: fixed_t
"""


# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Savegame I/O, archiving, persistence.
#
# -----------------------------------------------------------------------------


#  Persistent storage/archiving.
#  These are the load / save game routines.

#proc P_ArchivePlayers*()
#proc P_UnArchivePlayers*()
#proc P_ArchiveWorld*()
#proc P_UnArchiveWorld*()
#proc P_ArchiveThinkers*()
#proc P_UnArchiveThinkers*()
#proc P_ArchiveSpecials*()
#proc P_UnArchiveSpecials*()
var save_p*: ptr byte

# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#    Setup a game, startup stuff.
#
# -----------------------------------------------------------------------------


#  NOT called by W_Ticker. Fixme.

#proc P_SetupLevel*(episode: cint; map: cint; playermask: cint; skill: skill_t)
#  Called by startup code.

#proc P_Init*()
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:  none
# 	Implements special effects:
# 	Texture animation, height or lighting changes
# 	 according to adjacent sectors, respective
# 	 utility functions, etc.
#
# -----------------------------------------------------------------------------

#
#  End-level timer (-TIMER option)
#

#
#  The SideDef.
#

type
  side_t* {.bycopy.} = object
    textureoffset* {.importc: "textureoffset".}: fixed_t #  add this to the calculated texture column
    #  add this to the calculated texture top
    rowoffset* {.importc: "rowoffset".}: fixed_t #  Texture indices.
                                             #  We do not maintain names here.
    toptexture* {.importc: "toptexture".}: cshort
    bottomtexture* {.importc: "bottomtexture".}: cshort
    midtexture* {.importc: "midtexture".}: cshort #  Sector the SideDef is facing.
    sector* {.importc: "sector".}: ptr sector_t

var levelTimer*: boolean

var levelTimeCount*: cint

#       Define values for map objects

const
  MO_TELEPORTMAN* = 14

#  at game start

#proc P_InitPicAnims*()
#  at map load

#proc P_SpawnSpecials*()
#  every tic

#proc P_UpdateSpecials*()
#  when needed

#proc P_UseSpecialLine*(thing: ptr mobj_t; line: ptr line_t; side: cint): boolean
#proc P_ShootSpecialLine*(thing: ptr mobj_t; line: ptr line_t)
#proc P_CrossSpecialLine*(linenum: cint; side: cint; thing: ptr mobj_t)
#proc P_PlayerInSpecialSector*(player: ptr player_t)
#proc twoSided*(sector: cint; line: cint): cint
#proc getSector*(currentSector: cint; line: cint; side: cint): ptr sector_t
#proc getSide*(currentSector: cint; line: cint; side: cint): ptr side_t
#proc P_FindLowestFloorSurrounding*(sec: ptr sector_t): fixed_t
#proc P_FindHighestFloorSurrounding*(sec: ptr sector_t): fixed_t
#proc P_FindNextHighestFloor*(sec: ptr sector_t; currentheight: cint): fixed_t
#proc P_FindLowestCeilingSurrounding*(sec: ptr sector_t): fixed_t
#proc P_FindHighestCeilingSurrounding*(sec: ptr sector_t): fixed_t
#proc P_FindSectorFromLineTag*(line: ptr line_t; start: cint): cint
#proc P_FindMinSurroundingLight*(sector: ptr sector_t; max: cint): cint
#proc getNextSector*(line: ptr line_t; sec: ptr sector_t): ptr sector_t
#
#  SPECIAL
#

# #proc EV_DoDonut*(line: ptr line_t): cint
#
#  P_LIGHTS
#

type
  fireflicker_t* {.bycopy.} = object
    thinker*: thinker_t
    sector*: ptr sector_t
    count*: cint
    maxlight*: cint
    minlight*: cint

  lightflash_t* {.bycopy.} = object
    thinker*: thinker_t
    sector*: ptr sector_t
    count*: cint
    maxlight*: cint
    minlight*: cint
    maxtime*: cint
    mintime*: cint

  strobe_t* {.bycopy.} = object
    thinker*: thinker_t
    sector*: ptr sector_t
    count*: cint
    minlight*: cint
    maxlight*: cint
    darktime*: cint
    brighttime*: cint

  glow_t* {.bycopy.} = object
    thinker*: thinker_t
    sector*: ptr sector_t
    minlight*: cint
    maxlight*: cint
    direction*: cint


const
  GLOWSPEED* = 8
  STROBEBRIGHT* = 5
  FASTDARK* = 15
  SLOWDARK* = 35

#proc P_SpawnFireFlicker*(sector: ptr sector_t)
#proc T_LightFlash*(flash: ptr lightflash_t)
#proc P_SpawnLightFlash*(sector: ptr sector_t)
#proc T_StrobeFlash*(flash: ptr strobe_t)
#proc P_SpawnStrobeFlash*(sector: ptr sector_t; fastOrSlow: cint; inSync: cint)
#proc EV_StartLightStrobing*(line: ptr line_t)
#proc EV_TurnTagLightsOff*(line: ptr line_t)
#proc EV_LightTurnOn*(line: ptr line_t; bright: cint)
#proc T_Glow*(g: ptr glow_t)
#proc P_SpawnGlowingLight*(sector: ptr sector_t)
#
#  P_SWITCH
#

type
  switchlist_t* {.bycopy.} = object
    name1*: array[9, char]
    name2*: array[9, char]
    episode*: cshort

  bwhere_e* = enum
    top, middle, bottom
  button_t* {.bycopy.} = object
    line*: ptr line_t
    where*: bwhere_e
    btexture*: cint
    btimer*: cint
    soundorg*: ptr mobj_t



#  max # of wall switches in a level

const
  MAXSWITCHES* = 50

#  4 players, 4 buttons each at once, max.

const
  MAXBUTTONS* = 16

#  1 second, in ticks.

const
  BUTTONTIME* = 35

var buttonlist*: array[MAXBUTTONS, button_t]

#proc P_ChangeSwitchTexture*(line: ptr line_t; useAgain: cint)
#proc P_InitSwitchList*()
#
#  P_PLATS
#

type
  plat_e* = enum
    up, down, waiting, in_stasis
  plattype_e* = enum
    perpetualRaise, downWaitUpStay, raiseAndChange, raiseToNearestAndChange,
    blazeDWUS
  plat_t* {.bycopy.} = object
    thinker*: thinker_t
    sector*: ptr sector_t
    speed*: fixed_t
    low*: fixed_t
    high*: fixed_t
    wait*: cint
    count*: cint
    status*: plat_e
    oldstatus*: plat_e
    crush*: boolean
    tag*: cint
    `type`*: plattype_e




const
  PLATWAIT* = 3
  PLATSPEED* = FRACUNIT
  MAXPLATS* = 30

var activeplats*: array[MAXPLATS, ptr plat_t]

#proc T_PlatRaise*(plat: ptr plat_t)
#proc EV_DoPlat*(line: ptr line_t; `type`: plattype_e; amount: cint): cint
#proc P_AddActivePlat*(plat: ptr plat_t)
#proc P_RemoveActivePlat*(plat: ptr plat_t)
#proc EV_StopPlat*(line: ptr line_t)
#proc P_ActivateInStasis*(tag: cint)
#
#  P_DOORS
#

type
  vldoor_e* = enum
    normal, close30ThenOpen, close, open, raiseIn5Mins, blazeRaise, blazeOpen,
    blazeClose
  vldoor_t* {.bycopy.} = object
    thinker*: thinker_t
    `type`*: vldoor_e
    sector*: ptr sector_t
    topheight*: fixed_t
    speed*: fixed_t            #  1 = up, 0 = waiting at top, -1 = down
    direction*: cint           #  tics to wait at the top
    topwait*: cint             #  (keep in case a door going down is reset)
                 #  when it reaches 0, start going down
    topcountdown*: cint



const
  VDOORSPEED* = FRACUNIT * 2
  VDOORWAIT* = 150

#proc EV_VerticalDoor*(line: ptr line_t; thing: ptr mobj_t)
#proc EV_DoDoor*(line: ptr line_t; `type`: vldoor_e): cint
#proc EV_DoLockedDoor*(line: ptr line_t; `type`: vldoor_e; thing: ptr mobj_t): cint
#proc T_VerticalDoor*(door: ptr vldoor_t)
#proc P_SpawnDoorCloseIn30*(sec: ptr sector_t)
#proc P_SpawnDoorRaiseIn5Mins*(sec: ptr sector_t; secnum: cint)
#
#  P_CEILNG
#

type
  ceiling_e* = enum
    lowerToFloor, raiseToHighest, lowerAndCrush, crushAndRaise, fastCrushAndRaise,
    silentCrushAndRaise
  ceiling_t* {.bycopy.} = object
    thinker*: thinker_t
    `type`*: ceiling_e
    sector*: ptr sector_t
    bottomheight*: fixed_t
    topheight*: fixed_t
    speed*: fixed_t
    crush*: boolean            #  1 = up, 0 = waiting, -1 = down
    direction*: cint           #  ID
    tag*: cint
    olddirection*: cint



const
  CEILSPEED* = FRACUNIT
  CEILWAIT* = 150
  MAXCEILINGS* = 30

var activeceilings*: array[MAXCEILINGS, ptr ceiling_t]

#proc EV_DoCeiling*(line: ptr line_t; `type`: ceiling_e): cint
#proc T_MoveCeiling*(ceiling: ptr ceiling_t)
#proc P_AddActiveCeiling*(c: ptr ceiling_t)
#proc P_RemoveActiveCeiling*(c: ptr ceiling_t)
#proc EV_CeilingCrushStop*(line: ptr line_t): cint
#proc P_ActivateInStasisCeiling*(line: ptr line_t)
#
#  P_FLOOR
#

type                          #  lower floor to highest surrounding floor
  floor_e* = enum
    lowerFloor,               #  lower floor to lowest surrounding floor
    lowerFloorToLowest,       #  lower floor to highest surrounding floor VERY FAST
    turboLower,               #  raise floor to lowest surrounding CEILING
    raiseFloor,               #  raise floor to next highest surrounding floor
    raiseFloorToNearest,      #  raise floor to shortest height texture around it
    raiseToTexture,           #  lower floor to lowest surrounding floor
                   #   and change floorpic
    lowerAndChange, raiseFloor24, raiseFloor24AndChange, raiseFloorCrush, #  raise to next highest floor, turbo-speed
    raiseFloorTurbo, donutRaise, raiseFloor512
  stair_e* = enum
    build8,                   #  slowly build by 8
    turbo16                   #  quickly build by 16
  floormove_t* {.bycopy.} = object
    thinker*: thinker_t
    `type`*: floor_e
    crush*: boolean
    sector*: ptr sector_t
    direction*: cint
    newspecial*: cint
    texture*: cshort
    floordestheight*: fixed_t
    speed*: fixed_t




const
  FLOORSPEED* = FRACUNIT

type
  result_e* = enum
    ok, crushed, pastdest


#proc T_MovePlane*(sector: ptr sector_t; speed: fixed_t; dest: fixed_t; crush: boolean;
                 #floorOrCeiling: cint; direction: cint): result_e
#proc EV_BuildStairs*(line: ptr line_t; `type`: stair_e): cint
#proc EV_DoFloor*(line: ptr line_t; floortype: floor_e): cint
#proc T_MoveFloor*(floor: ptr floormove_t)
#
#  P_TELEPT
#

#proc EV_Teleport*(line: ptr line_t; side: cint; thing: ptr mobj_t): cint
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	?
#
# -----------------------------------------------------------------------------


#  Called by C_Ticker,
#  can call G_PlayerExited.
#  Carries out all thinking of monsters and players.

#proc P_Ticker*()
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Refresh module, BSP traversal and handling.
#
# -----------------------------------------------------------------------------


#
#  A SubSector.
#  References a Sector.
#  Basically, this is a list of LineSegs,
#   indicating the visible walls that define
#   (all or some) sides of a convex BSP leaf.
#



#
#  The LineSeg.
#

type
  seg_t* = object
    v1* {.importc: "v1".}: ptr vertex_t
    v2* {.importc: "v2".}: ptr vertex_t
    offset* {.importc: "offset".}: fixed_t
    angle* {.importc: "angle".}: angle_t
    sidedef* {.importc: "sidedef".}: ptr side_t
    linedef* {.importc: "linedef".}: ptr line_t #  Sector references.
                                           #  Could be retrieved from linedef, too.
                                           #  backsector is NULL for one sided lines
    frontsector* {.importc: "frontsector".}: ptr sector_t
    backsector* {.importc: "backsector".}: ptr sector_t

  drawseg_t* = object
    curline* {.importc: "curline".}: ptr seg_t
    x1* {.importc: "x1".}: cint
    x2* {.importc: "x2".}: cint
    scale1* {.importc: "scale1".}: fixed_t
    scale2* {.importc: "scale2".}: fixed_t
    scalestep* {.importc: "scalestep".}: fixed_t #  0=none, 1=bottom, 2=top, 3=both
    silhouette* {.importc: "silhouette".}: cint #  do not clip sprites above this
    bsilheight* {.importc: "bsilheight".}: fixed_t #  do not clip sprites below this
    tsilheight* {.importc: "tsilheight".}: fixed_t #  Pointers to lists for sprite clipping,
                                               #   all three adjusted so [x1] is first value.
    sprtopclip* {.importc: "sprtopclip".}: ptr cshort
    sprbottomclip* {.importc: "sprbottomclip".}: ptr cshort
    maskedtexturecol* {.importc: "maskedtexturecol".}: ptr cshort

  
#  PC direct to screen pointers
# B UNUSED - keep till detailshift in r_draw.c resolved
# extern byte*	destview;
# extern byte*	destscreen;
#
#  OTHER TYPES
#
#  This could be wider for >8 bit display.
#  Indeed, true color support is posibble
#   precalculating 24bpp lightmap/colormap LUT.
#   from darkening PLAYPAL to all black.
#  Could even us emore than 32 levels.

type
  lighttable_t* = byte

#
#  ?
#


#var curline* : ptr seg_t

#var sidedef* : ptr side_t

#var linedef* : ptr line_t

#var frontsector* : ptr sector_t

#var backsector* : ptr sector_t

#var rw_x* : cint

#var rw_stopx* : cint

#var segtextured* : boolean

#  false if the back side is the same plane

#var markfloor* : boolean

#var markceiling* : boolean

#var skymap* : boolean

#var drawsegs* : array[MAXDRAWSEGS, drawseg_t]

#var ds_p* : ptr drawseg_t

#var hscalelight* : ptr ptr lighttable_t

#var vscalelight* : ptr ptr lighttable_t

#var dscalelight* : ptr ptr lighttable_t

type
  drawfunc_t* = proc (start: cint; stop: cint)

#  BSP?

#proc R_ClearClipSegs*() 
#proc R_ClearDrawSegs*() 
#proc R_RenderBSPNode*(bspnum: cint) 
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#   Refresh module, data I/O, caching, retrieval of graphics
#   by name.
#
# -----------------------------------------------------------------------------


#  Retrieve column data for span blitting.

#proc R_GetColumn*(tex: cint; col: cint): ptr byte {.importc: "R_GetColumn",
    #header: "r_bsp.h".}
#  I/O, setting up the stuff.

#proc R_InitData*() 
#proc R_PrecacheLevel*() 
#  Retrieval.
#  Floor/ceiling opaque texture tiles,
#  lookup by name. For animation?

#proc R_FlatNumForName*(name: cstring): cint {.importc: "R_FlatNumForName",
    #header: "r_bsp.h".}
#  Called by P_Ticker for switches and animations,
#  returns the texture number for the texture name.

#proc R_TextureNumForName*(name: cstring): cint {.importc: "R_TextureNumForName",
    #header: "r_bsp.h".}
#proc R_CheckTextureNumForName*(name: cstring): cint 
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#       Refresh/rendering module, shared data struct definitions.
#
# -----------------------------------------------------------------------------

#  Screenwidth.

#  Some more or less basic data types
#  we depend on.

#  We rely on the thinker data struct
#  to handle sound origins in sectors.

#  SECTORS do store MObjs anyway.


#  Silhouette, needed for clipping Segs (mainly)
#  and sprites representing things.









#
#  BSP node.
#

type
  node_t* {.bycopy.} = object
    x* {.importc: "x".}: fixed_t #  Partition line.
    y* {.importc: "y".}: fixed_t
    dx* {.importc: "dx".}: fixed_t
    dy* {.importc: "dy".}: fixed_t #  Bounding box for each child.
    bbox* {.importc: "bbox".}: array[2, array[4, fixed_t]] #  If NF_SUBSECTOR its a subsector.
    children* {.importc: "children".}: array[2, cushort]


#  posts are runs of non masked source pixels

type
  post_t* {.bycopy.} = object
    topdelta* {.importc: "topdelta".}: byte #  -1 is the last post in a column
    length* {.importc: "length".}: byte #  length data bytes follows


#  column_t is a list of 0 or more post_t, (byte)-1 terminated

type
  column_t* = post_t




#  A vissprite_t is a thing
#   that will be drawn during a refresh.
#  I.e. a sprite object that is partly visible.

type
  vissprite_s* {.bycopy.} = object
    prev* {.importc: "prev".}: ptr vissprite_s #  Doubly linked list.
    next* {.importc: "next".}: ptr vissprite_s
    x1* {.importc: "x1".}: cint
    x2* {.importc: "x2".}: cint  #  for line side calculation
    gx* {.importc: "gx".}: fixed_t
    gy* {.importc: "gy".}: fixed_t #  global bottom / top for silhouette clipping
    gz* {.importc: "gz".}: fixed_t
    gzt* {.importc: "gzt".}: fixed_t #  horizontal position of x1
    startfrac* {.importc: "startfrac".}: fixed_t
    scale* {.importc: "scale".}: fixed_t #  negative if flipped
    xiscale* {.importc: "xiscale".}: fixed_t
    texturemid* {.importc: "texturemid".}: fixed_t
    patch* {.importc: "patch".}: cint #  for color translation and shadow draw,
                                  #   maxbright frames as well
    colormap* {.importc: "colormap".}: ptr lighttable_t
    mobjflags* {.importc: "mobjflags".}: cint
  
  vissprite_t* = vissprite_s


# 	
#  Sprites are patches with a special naming convention
#   so they can be recognized by R_InitSprites.
#  The base name is NNNNFx or NNNNFxFx, with
#   x indicating the rotation, x = 0, 1-7.
#  The sprite and frame specified by a thing_t
#   is range checked at run time.
#  A sprite is a patch_t that is assumed to represent
#   a three dimensional object and may have multiple
#   rotations pre drawn.
#  Horizontal flipping is used to save space,
#   thus NNNNF2F5 defines a mirrored patch.
#  Some sprites will only have one picture used
#  for all views: NNNNF0
#

type
  spriteframe_t* {.bycopy.} = object
    rotate* {.importc: "rotate".}: boolean #  If false use 0 for any position.
                                       #  Note: as eight entries are available,
                                       #   we might as well insert the same name eight times.
    #  Lump to use for view angles 0-7.
    lump* {.importc: "lump".}: array[8, cshort] #  Flip bit (1 = flip) to use for view angles 0-7.
    flip* {.importc: "flip".}: array[8, byte]


#
#  A sprite definition:
#   a number of animation frames.
#

type
  spritedef_t* {.bycopy.} = object
    numframes* {.importc: "numframes".}: cint
    spriteframes* {.importc: "spriteframes".}: ptr spriteframe_t


#
#  Now what is a visplane, anyway?
#

type
  visplane_t* {.bycopy.} = object
    height* {.importc: "height".}: fixed_t
    picnum* {.importc: "picnum".}: cint
    lightlevel* {.importc: "lightlevel".}: cint
    minx* {.importc: "minx".}: cint
    maxx* {.importc: "maxx".}: cint #  leave pads for [minx-1]/[maxx+1]
    pad1* {.importc: "pad1".}: byte #  Here lies the rub for all
                                #   dynamic resize/change of resolution.
    top* {.importc: "top".}: array[SCREENWIDTH, byte]
    pad2* {.importc: "pad2".}: byte
    pad3* {.importc: "pad3".}: byte #  See above.
    bottom* {.importc: "bottom".}: array[SCREENWIDTH, byte]
    pad4* {.importc: "pad4".}: byte


# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	System specific interface stuff.
#
# -----------------------------------------------------------------------------


#var dc_colormap* : ptr UncheckedArray[lighttable_t]

#var dc_x* : cint

#var dc_yl* : cint

#var dc_yh* : cint

#var dc_iscale* : fixed_t

#var dc_texturemid* : fixed_t

#  first pixel in a column

#var dc_source* : ptr UncheckedArray[byte]

#  The span blitting interface.
#  Hook in assembler or system specific BLT
#   here.

#proc R_DrawColumn*() 
#proc R_DrawColumnLow*() 
#  The Spectre/Invisibility effect.

#proc R_DrawFuzzColumn*() 
#proc R_DrawFuzzColumnLow*() 
#  Draw with color translation tables,
#   for player sprite rendering,
#   Green/Red/Blue/Indigo shirts.

#proc R_DrawTranslatedColumn*() {.importc: "R_DrawTranslatedColumn",
                              #header: "r_bsp.h".}
#proc R_DrawTranslatedColumnLow*() {.importc: "R_DrawTranslatedColumnLow",
                                  #header: "r_bsp.h".}
#proc R_VideoErase*(ofs: cuint; count: cint) {.importc: "R_VideoErase",
    #header: "r_bsp.h".}
#var ds_y* : cint

#var ds_x1* : cint

#var ds_x2* : cint

#var ds_colormap* : ptr lighttable_t

#var ds_xfrac* : fixed_t

#var ds_yfrac* : fixed_t

#var ds_xstep* : fixed_t

#var ds_ystep* : fixed_t

#  start of a 64*64 tile image

#var ds_source* : ptr byte

#var translationtables* : ptr byte

#var dc_translation* : ptr byte

#  Span blitting for rows, floor/ceiling.
#  No Sepctre effect needed.

#proc R_DrawSpan*() 
#  Low resolution mode, 160x200?

#proc R_DrawSpanLow*() 
#proc R_InitBuffer*(width: cint; height: cint) {.importc: "R_InitBuffer",
    #header: "r_bsp.h".}
#  Initialize color translation tables,
#   for player rendering etc.

#proc R_InitTranslationTables*() {.importc: "R_InitTranslationTables",
                              #  header: "r_bsp.h".}
#  Rendering function.

#proc R_FillBackScreen*() 
#  If the view size is not full screen, draws a border around it.

#proc R_DrawViewBorder*() 
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Refresh (R_*) module, global header.
# 	All the rendering/drawing stuff is here.
#
# -----------------------------------------------------------------------------

#  Binary Angles, sine/cosine/atan lookups.

#  Screen size related parameters.

#  Include the refresh/render data structs.

#
#  Separate header file for each module.
#

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	System specific interface stuff.
#
# -----------------------------------------------------------------------------


#
#  POV related.
#

#var viewcos* : fixed_t

#var viewsin* : fixed_t

discard """
#var viewwidth* : cint

#var viewheight* : cint

#var viewwindowx* : cint

#var viewwindowy* : cint
"""

#var centerx* : cint

#var centery* : cint

#var centerxfrac* : fixed_t

#var centeryfrac* : fixed_t

#var projection* : fixed_t

#var validcount* : cint

#var linecount* : cint

#var loopcount* : cint

#
#  Lighting LUT.
#  Used for z-depth cuing per column/row,
#   and other lighting effects (sector ambient, flash).
#
#  Lighting constants.
#  Now why not 32 levels here?

const
  LIGHTLEVELS* = 16
  LIGHTSEGSHIFT* = 4
  MAXLIGHTSCALE* = 48
  LIGHTSCALESHIFT* = 12
  MAXLIGHTZ* = 128
  LIGHTZSHIFT* = 20

#var scalelight* : array[LIGHTLEVELS,
    #array[MAXLIGHTSCALE, ptr lighttable_t]]

#var scalelightfixed* : array[
    #MAXLIGHTSCALE, ptr lighttable_t]

#var zlight* : array[LIGHTLEVELS,
    #array[MAXLIGHTZ, ptr lighttable_t]]

#var extralight* : cint

#var fixedcolormap* : ptr lighttable_t

#  Number of diminishing brightness levels.
#  There a 0-31, i.e. 32 LUT in the COLORMAP lump.

const
  NUMCOLORMAPS* = 32

#  Blocky/low detail mode.
# B remove this?
#   0 = high, 1 = low

#var detailshift* : cint

#
#  Function pointers to switch refresh/drawing functions.
#  Used to select shadow mode etc.
#

var colfunc*: proc ()

var basecolfunc*: proc ()

var fuzzcolfunc*: proc ()

#  No shadow effects on floors.

var spanfunc*: proc ()

#
#  Utility functions.

#proc R_PointOnSide*(x: fixed_t; y: fixed_t; node: ptr node_t): cint {.
    #importc: "R_PointOnSide", header: "r_bsp.h".}
#proc R_PointOnSegSide*(x: fixed_t; y: fixed_t; line: ptr seg_t): cint {.
    #importc: "R_PointOnSegSide", header: "r_bsp.h".}
#proc R_PointToAngle*(x: fixed_t; y: fixed_t): angle_t {.importc: "R_PointToAngle",
    #header: "r_bsp.h".}
#proc R_PointToAngle2*(x1: fixed_t; y1: fixed_t; x2: fixed_t; y2: fixed_t): angle_t {.
    #importc: "R_PointToAngle2", header: "r_bsp.h".}
#proc R_PointToDist*(x: fixed_t; y: fixed_t): fixed_t {.importc: "R_PointToDist",
    #header: "r_bsp.h".}
#proc R_ScaleFromGlobalAngle*(visangle: angle_t): fixed_t {.
    #importc: "R_ScaleFromGlobalAngle", header: "r_bsp.h".}
#proc R_PointInSubsector*(x: fixed_t; y: fixed_t): ptr subsector_t {.
    #importc: "R_PointInSubsector", header: "r_bsp.h".}
#proc R_AddPointToBox*(x: cint; y: cint; box: ptr fixed_t) {.importc: "R_AddPointToBox",
    #header: "r_bsp.h".}
#
#  REFRESH - the actual rendering functions.
#
#  Called by G_Drawer.

#proc R_RenderPlayerView*(player: ptr player_t) {.importc: "R_RenderPlayerView",
    #header: "r_bsp.h".}
#  Called by startup code.

#proc R_Init*() 
#  Called by M_Responder.

#proc R_SetViewSize*(blocks: cint; detail: cint) {.importc: "R_SetViewSize",
    #header: "r_bsp.h".}
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Refresh, visplane stuff (floor, ceilings).
#
# -----------------------------------------------------------------------------


#  Visplane related.

#var lastopening* : ptr cshort

type
  planefunction_t* = proc (top: cint; bottom: cint)

#var floorfunc* : planefunction_t

#var ceilingfunc_t* : planefunction_t

#var floorclip* : array[SCREENWIDTH, cshort]

#var ceilingclip* : array[SCREENWIDTH,
    #cshort]

#var yslope* : array[SCREENHEIGHT, fixed_t]

#var distscale* : array[SCREENWIDTH, fixed_t]

#proc R_InitPlanes*() 
#proc R_ClearPlanes*() 
#proc R_MapPlane*(y: cint; x1: cint; x2: cint) 
#proc R_MakeSpans*(x: cint; t1: cint; b1: cint; t2: cint; b2: cint) {.
    #importc: "R_MakeSpans", header: "r_bsp.h".}
#proc R_DrawPlanes*() 
#proc R_FindPlane*(height: fixed_t; picnum: cint; lightlevel: cint): ptr visplane_t {.
    #importc: "R_FindPlane", header: "r_bsp.h".}
#proc R_CheckPlane*(pl: ptr visplane_t; start: cint; stop: cint): ptr visplane_t {.
    #importc: "R_CheckPlane", header: "r_bsp.h".}
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Refresh module, drawing LineSegs from BSP.
#
# -----------------------------------------------------------------------------


#proc R_RenderMaskedSegRange*(ds: ptr drawseg_t; x1: cint; x2: cint) {.
   # importc: "R_RenderMaskedSegRange", header: "r_bsp.h".}
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Sky rendering.
#
# -----------------------------------------------------------------------------


#  SKY, store the number for name.

const
  SKYFLATNAME* = "F_SKY1"

#  The sky map is 256*128*4 maps.

const
  ANGLETOSKYSHIFT* = 22

#var skytexture* : cint

#var skytexturemid* : cint

#  Called whenever the view size changes.

#proc R_InitSkyMap*() 
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Refresh/render internal state variables (global).
#
# -----------------------------------------------------------------------------

#  Need data structure definitions.


#
#  Refresh internal data structures,
#   for rendering.
#
#  needed for texture pegging

#var textureheight* : ptr fixed_t

#  needed for pre rendering (fracs)

#var spritewidth* : ptr fixed_t

#var spriteoffset* : ptr fixed_t

#var spritetopoffset* : ptr fixed_t

#var colormaps* : ptr lighttable_t

discard """
#var viewwidth* : cint

#var scaledviewwidth* : cint

#var viewheight* : cint
"""

#var firstflat* : cint

#  for global animation

#var flattranslation* : ptr cint

#var texturetranslation* : ptr cint

#  Sprite....

#var firstspritelump* : cint

#var lastspritelump* : cint

#var numspritelumps* : cint

#
#  Lookup tables for map data.
#

#var numsprites* : cint

#var sprites* : ptr spritedef_t

#var numvertexes* : cint

#var vertexes* : ptr vertex_t

#var numsegs* : cint

#var segs* : ptr seg_t

#var numsectors* : cint

#var sectors* : ptr sector_t

#var numsubsectors* : cint

##var subsectors* : ptr subsector_t

#var numnodes* : cint

#var nodes* : ptr node_t

#var numlines* : cint

##var lines* : ptr line_t

#var numsides* : cint

#var sides* : ptr side_t

#
#  POV data.
#

#var viewx* : fixed_t

#var viewy* : fixed_t

#var viewz* : fixed_t

#var viewangle* : angle_t

#var viewplayer* : ptr player_t

#  ?

#var clipangle* : angle_t

#var viewangletox* : array[
    #FINEANGLES div 2, cint]

#var xtoviewangle* : array[
    #SCREENWIDTH + 1, angle_t]

# extern fixed_t		finetangent[FINEANGLES/2];

#var rw_distance* : fixed_t

#var rw_normalangle* : angle_t

#  angle to line origin

#var rw_angle1* : cint

#  Segs count?

#var sscount* : cint

#var floorplane* : ptr visplane_t

#var ceilingplane* : ptr visplane_t

# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Rendering of moving objects, sprites.
#
# -----------------------------------------------------------------------------


const
  MAXVISSPRITES* = 128

##var vissprites* : array[MAXVISSPRITES,
 #   vissprite_t]

#var vissprite_p* : ptr vissprite_t

#var vsprsortedhead* : vissprite_t

#  Constant arrays used for psprite clipping
#   and initializing clipping.

#var negonearray* : array[SCREENWIDTH,
   # cshort]

#var screenheightarray* : array[
    #SCREENWIDTH, cshort]

#  vars for R_DrawMaskedColumn

#var mfloorclip* : ptr cshort

#var mceilingclip* : ptr cshort

#var spryscale* : fixed_t

#var sprtopscreen* : fixed_t

#var pspritescale* : fixed_t

#var pspriteiscale* : fixed_t

#proc R_DrawMaskedColumn*(column: ptr column_t) {.importc: "R_DrawMaskedColumn",
   # header: "r_bsp.h".}
#proc R_SortVisSprites*() 
#proc R_AddSprites*(sec: ptr sector_t) 
#proc R_AddPSprites*() 
#proc R_DrawSprites*() 
#proc R_InitSprites*(namelist: cstringArray) {.importc: "R_InitSprites",
    #header: "r_bsp.h".}
#proc R_ClearSprites*() 
#proc R_DrawMasked*() 
#proc R_ClipVisSprite*(vis: ptr vissprite_t; xl: cint; xh: cint) {.
    #importc: "R_ClipVisSprite", header: "r_bsp.h".}
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Created by the sound utility written by Dave Taylor.
# 	Kept as a sample, DOOM2  sounds. Frozen.
#
# -----------------------------------------------------------------------------




#
#  MusicInfo struct.
#

type
  musicinfo_t* {.bycopy.} = object
    name* {.importc: "name".}: cstring #  up to 6-character name
    #  lump number of music
    lumpnum* {.importc: "lumpnum".}: cint #  music data
    data* {.importc: "data".}: pointer #  music handle once registered
    handle* {.importc: "handle".}: cint


#  the complete set of sound effects

#var S_sfx* : ptr sfxinfo_t

#  the complete set of music

#var S_music* : ptr musicinfo_t

#
#  Identifiers for all music in game.
#

type
  musicenum_t* {.size: sizeof(cint).} = enum
    mus_None, mus_e1m1, mus_e1m2, mus_e1m3, mus_e1m4, mus_e1m5, mus_e1m6, mus_e1m7,
    mus_e1m8, mus_e1m9, mus_e2m1, mus_e2m2, mus_e2m3, mus_e2m4, mus_e2m5, mus_e2m6,
    mus_e2m7, mus_e2m8, mus_e2m9, mus_e3m1, mus_e3m2, mus_e3m3, mus_e3m4, mus_e3m5,
    mus_e3m6, mus_e3m7, mus_e3m8, mus_e3m9, mus_inter, mus_intro, mus_bunny,
    mus_victor, mus_introa, mus_runnin, mus_stalks, mus_countd, mus_betwee, mus_doom,
    mus_the_da, mus_shawn, mus_ddtblu, mus_in_cit, mus_dead, mus_stlks2, mus_theda2,
    mus_doom2, mus_ddtbl2, mus_runni2, mus_dead2, mus_stlks3, mus_romero, mus_shawn2,
    mus_messag, mus_count2, mus_ddtbl3, mus_ampie, mus_theda3, mus_adrian, mus_messg2,
    mus_romer2, mus_tense, mus_shawn3, mus_openin, mus_evil, mus_ultima, mus_read_m,
    mus_dm2ttl, mus_dm2int, NUMMUSIC


#
#  Identifiers for all sfx in game.
#

type
  sfxenum_t* {.size: sizeof(cint).} = enum
    sfx_None, sfx_pistol, sfx_shotgn, sfx_sgcock, sfx_dshtgn, sfx_dbopn, sfx_dbcls,
    sfx_dbload, sfx_plasma, sfx_bfg, sfx_sawup, sfx_sawidl, sfx_sawful, sfx_sawhit,
    sfx_rlaunc, sfx_rxplod, sfx_firsht, sfx_firxpl, sfx_pstart, sfx_pstop, sfx_doropn,
    sfx_dorcls, sfx_stnmov, sfx_swtchn, sfx_swtchx, sfx_plpain, sfx_dmpain,
    sfx_popain, sfx_vipain, sfx_mnpain, sfx_pepain, sfx_slop, sfx_itemup, sfx_wpnup,
    sfx_oof, sfx_telept, sfx_posit1, sfx_posit2, sfx_posit3, sfx_bgsit1, sfx_bgsit2,
    sfx_sgtsit, sfx_cacsit, sfx_brssit, sfx_cybsit, sfx_spisit, sfx_bspsit,
    sfx_kntsit, sfx_vilsit, sfx_mansit, sfx_pesit, sfx_sklatk, sfx_sgtatk, sfx_skepch,
    sfx_vilatk, sfx_claw, sfx_skeswg, sfx_pldeth, sfx_pdiehi, sfx_podth1, sfx_podth2,
    sfx_podth3, sfx_bgdth1, sfx_bgdth2, sfx_sgtdth, sfx_cacdth, sfx_skldth,
    sfx_brsdth, sfx_cybdth, sfx_spidth, sfx_bspdth, sfx_vildth, sfx_kntdth, sfx_pedth,
    sfx_skedth, sfx_posact, sfx_bgact, sfx_dmact, sfx_bspact, sfx_bspwlk, sfx_vilact,
    sfx_noway, sfx_barexp, sfx_punch, sfx_hoof, sfx_metal, sfx_chgun, sfx_tink,
    sfx_bdopn, sfx_bdcls, sfx_itmbk, sfx_flame, sfx_flamst, sfx_getpow, sfx_bospit,
    sfx_boscub, sfx_bossit, sfx_bospn, sfx_bosdth, sfx_manatk, sfx_mandth, sfx_sssit,
    sfx_ssdth, sfx_keenpn, sfx_keendt, sfx_skeact, sfx_skesit, sfx_skeatk, sfx_radio,
    NUMSFX


# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	The not so system specific sound interface.
#
# -----------------------------------------------------------------------------


#
#  Initializes sound stuff, including volume
#  Sets channels, SFX and music volume,
#   allocates channel buffer, sets S_sfx lookup.
#

#proc S_Init*(sfxVolume: cint; musicVolume: cint) 
#
#  Per level startup code.
#  Kills playing sounds at start of level,
#   determines music if any, changes music.
#

#proc S_Start*() 
#
#  Start sound for thing at <origin>
#   using <sound_id> from sounds.h
#

#proc S_StartSound*(origin: pointer; sound_id: cint) {.importc: "S_StartSound",
    #header: "r_bsp.h".}
#  Will start a sound at a given volume.

#proc S_StartSoundAtVolume*(origin: pointer; sound_id: cint; volume: cint) {.
   #importc: "S_StartSoundAtVolume", header: "r_bsp.h".}
#  Stop sound for thing at <origin>

#proc S_StopSound*(origin: pointer) 
#  Start music using <music_id> from sounds.h

#proc S_StartMusic*(music_id: cint) 
#  Start music using <music_id> from sounds.h,
#   and set whether looping

#proc S_ChangeMusic*(music_id: cint; looping: cint) {.importc: "S_ChangeMusic",
    #header: "r_bsp.h".}
#  Stops the music fer sure.

#proc S_StopMusic*() 
#  Stop and resume music, during game PAUSE.

#proc S_PauseSound*() 
#proc S_ResumeSound*() 
#
#  Updates music & sounds
#

#proc S_UpdateSounds*(listener: pointer) {.importc: "S_UpdateSounds",
                                    #   header: "r_bsp.h".}
#proc S_SetMusicVolume*(volume: cint) 
#proc S_SetSfxVolume*(volume: cint) 
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#  	The status bar widget code.
#
# -----------------------------------------------------------------------------

#  We are referring to patches.

#
#  Background and foreground screen numbers
#

#const
 # BG* = 4
 # FG* = 0

#
#  Typedefs of widgets
#
#  Number widget

type
  st_number_t* {.bycopy.} = object
    x* {.importc: "x".}: cint    #  upper right-hand corner
                          #   of the number (right-justified)
    y* {.importc: "y".}: cint    #  max # of digits in number
    width* {.importc: "width".}: cint #  last number value
    oldnum* {.importc: "oldnum".}: cint #  pointer to current value
    num* {.importc: "num".}: ptr cint #  pointer to boolean stating
                                 #   whether to update number
    on* {.importc: "on".}: ptr boolean #  list of patches for 0-9
    p* {.importc: "p".}: ptr ptr patch_t #  user data
    data* {.importc: "data".}: cint


#  Percent widget ("child" of number widget,
#   or, more precisely, contains a number widget.)

type
  st_percent_t* {.bycopy.} = object
    n* {.importc: "n".}: st_number_t #  number information
    #  percent sign graphic
    p* {.importc: "p".}: ptr patch_t


#  Multiple Icon widget

type
  st_multicon_t* {.bycopy.} = object
    x* {.importc: "x".}: cint    #  center-justified location of icons
    y* {.importc: "y".}: cint    #  last icon number
    oldinum* {.importc: "oldinum".}: cint #  pointer to current icon
    inum* {.importc: "inum".}: ptr cint #  pointer to boolean stating
                                   #   whether to update icon
    on* {.importc: "on".}: ptr boolean #  list of icons
    p* {.importc: "p".}: ptr ptr patch_t #  user data
    data* {.importc: "data".}: cint


#  Binary Icon widget

type
  st_binicon_t* {.bycopy.} = object
    x* {.importc: "x".}: cint    #  center-justified location of icon
    y* {.importc: "y".}: cint    #  last icon value
    oldval* {.importc: "oldval".}: cint #  pointer to current icon status
    val* {.importc: "val".}: ptr boolean #  pointer to boolean
                                    #   stating whether to update icon
    on* {.importc: "on".}: ptr boolean
    p* {.importc: "p".}: ptr patch_t #  icon
    data* {.importc: "data".}: cint #  user data


#
#  Widget creation, access, and update routines
#
#  Initializes widget library.
#  More precisely, initialize STMINUS,
#   everything else is done somewhere else.
#

#proc STlib_init*() 
#  Number widget routines

#proc STlib_initNum*(n: ptr st_number_t; x: cint; y: cint; pl: ptr ptr patch_t;
                  # num: ptr cint; on: ptr boolean; width: cint) {.
   # importc: "STlib_initNum", header: "r_bsp.h".}
#proc STlib_updateNum*(n: ptr st_number_t; refresh: boolean) {.
    #importc: "STlib_updateNum", header: "r_bsp.h".}
#  Percent widget routines

#proc STlib_initPercent*(p: ptr st_percent_t; x: cint; y: cint; pl: ptr ptr patch_t;
                      # num: ptr cint; on: ptr boolean; percent: ptr patch_t) {.
  #  importc: "STlib_initPercent", header: "r_bsp.h".}
#proc STlib_updatePercent*(per: ptr st_percent_t; refresh: cint) {.
   # importc: "STlib_updatePercent", header: "r_bsp.h".}
#  Multiple Icon widget routines

#proc STlib_initMultIcon*(mi: ptr st_multicon_t; x: cint; y: cint; il: ptr ptr patch_t;
                    #    inum: ptr cint; on: ptr boolean) {.
   # importc: "STlib_initMultIcon", header: "r_bsp.h".}
#proc STlib_updateMultIcon*(mi: ptr st_multicon_t; refresh: boolean) {.
    #importc: "STlib_updateMultIcon", header: "r_bsp.h".}
#  Binary Icon widget routines

#proc STlib_initBinIcon*(b: ptr st_binicon_t; x: cint; y: cint; i: ptr patch_t;
        #               val: ptr boolean; on: ptr boolean) {.
   # importc: "STlib_initBinIcon", header: "r_bsp.h".}
#proc STlib_updateBinIcon*(bi: ptr st_binicon_t; refresh: boolean) {.
    #importc: "STlib_updateBinIcon", header: "r_bsp.h".}
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Status bar code.
# 	Does the face/direction indicator animatin.
# 	Does palette indicators as well (red pain/berserk, bright pickup)
#
# -----------------------------------------------------------------------------

#  Size of statusbar.
#  Now sensitive for scaling.

const
  ST_HEIGHT* = 32 * SCREEN_MUL
  ST_WIDTH* = SCREENWIDTH
  ST_Y* = (SCREENHEIGHT - ST_HEIGHT)

#
#  STATUS BAR
#
#  Called by main loop.

#proc ST_Responder*(ev: ptr event_t): boolean {.importc: "ST_Responder",
   # header: "r_bsp.h".}
#  Called by main loop.

#proc ST_Ticker*() 
#  Called by main loop.

#proc ST_Drawer*(fullscreen: boolean; refresh: boolean) {.importc: "ST_Drawer",
    #header: "r_bsp.h".}
#  Called when the console player is spawned on each level.

#proc ST_Start*() 
#  Called by startup code.

#proc ST_Init*() 
#  States for status bar code.

type
  st_stateenum_t* {.size: sizeof(cint).} = enum
    AutomapState, FirstPersonState


#  States for the chat code.

type
  st_chatstateenum_t* {.size: sizeof(cint).} = enum
    StartChatState, WaitDestState, GetChatState


##proc ST_Responder*(ev: ptr event_t): boolean {.importc: "ST_Responder",
 #   header: "r_bsp.h".}
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Lookup tables.
# 	Do not try to look them up :-).
# 	In the order of appearance:
#
# 	int finetangent[4096]	- Tangens LUT.
# 	 Should work with BAM fairly well (12 of 16bit,
#       effectively, by shifting).
#
# 	int finesine[10240]		- Sine lookup.
# 	 Guess what, serves as cosine, too.
# 	 Remarkable thing is, how to use BAMs with this?
#
# 	int tantoangle[2049]	- ArcTan LUT,
# 	  maps tan(angle) to angle fast. Gotta search.	
#
# -----------------------------------------------------------------------------

when defined(LINUX):
  discard
else:
  const
    PI* = 3.141592657


#  0x100000000 to 0x2000

const
  ANGLETOFINESHIFT* = 19

#  Effective size is 10240.

#var finesine* : array[5 * FINEANGLES div 4,
    #fixed_t]

#  Re-use data, is just PI/2 pahse shift.

#var finecosine* : ptr fixed_t

#  Effective size is 4096.

#var finetangent* : array[
    #FINEANGLES div 2, fixed_t]

#  Binary Angle Measument, BAM.

const
  ANG45* = 0x20000000
  ANG90* = 0x40000000
  ANG180* = 0x80000000
  ANG270* = 0xC0000000
  SLOPERANGE* = 2048
  SLOPEBITS* = 11
  DBITS* = (FRACBITS - SLOPEBITS)


#  Effective size is 2049;
#  The +1 size is to handle the case when x==y
#   without additional checking.

#var tantoangle* : array[SLOPERANGE + 1,
    #angle_t]

#  Utility function,
#   called by R_PointToAngle.

#proc SlopeDiv*(num: cuint; den: cuint): cint 
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#var arr* : array[10, char]

#var cache* : ptr pointer

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	Gamma correction LUT.
# 	Functions to draw patches (by post) directly to screen.
# 	Functions to blit a block to the screen.
#
# -----------------------------------------------------------------------------

#  Needed because we are refering to patches.

#
#  VIDEO
#

const
  CENTERY* = (SCREENHEIGHT div 2)

#  Screen 0 is the screen updated by I_Update screen.
#  Screen 1 is an extra buffer.

#var screens* : array[5, ptr byte]

#var dirtybox* : array[4, cint]

#var gammatable* : array[5, array[256, byte]]

#var usegamma* : cint

#  Allocates buffer screens, call before R_Init.

#proc V_Init*() 
#proc V_CopyRect*(srcx: cint; srcy: cint; srcscrn: cint; width: cint; height: cint;
                #destx: cint; desty: cint; destscrn: cint) {.importc: "V_CopyRect",
    #header: "r_bsp.h".}
#proc V_DrawPatch*(x: cint; y: cint; scrn: cint; patch: ptr patch_t) {.
    #importc: "V_DrawPatch", header: "r_bsp.h".}
#proc V_DrawPatchDirect*(x: cint; y: cint; scrn: cint; patch: ptr patch_t) {.
    #importc: "V_DrawPatchDirect", header: "r_bsp.h".}
#  Draw a linear block of pixels into the view buffer.

#proc V_DrawBlock*(x: cint; y: cint; scrn: cint; width: cint; height: cint; src: ptr byte) {.
    #importc: "V_DrawBlock", header: "r_bsp.h".}
#  Reads a linear block of pixels into the view buffer.

#proc V_GetBlock*(x: cint; y: cint; scrn: cint; width: cint; height: cint; dest: ptr byte) {.
    #importc: "V_GetBlock", header: "r_bsp.h".}
#proc V_MarkRect*(x: cint; y: cint; width: cint; height: cint) {.importc: "V_MarkRect",
   #header: "r_bsp.h".}
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#   Intermission.
#
# -----------------------------------------------------------------------------

# #include "v_video.h"

#  States for the intermission

type
  stateenum_t* {.size: sizeof(cint).} = enum
    NoState = -1, StatCount, ShowNextLoc


#  Called by main loop, animate the intermission.

#proc WI_Ticker*() 
#  Called by main loop,
#  draws the intermission directly into the screen buffer.

#proc WI_Drawer*() 
#  Setup for an intermission screen.

#proc WI_Start*(wbstartstruct: ptr wbstartstruct_t) {.importc: "WI_Start",
    #header: "r_bsp.h".}
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
# 	WAD I/O functions.
#
# -----------------------------------------------------------------------------


#
#  TYPES
#

type
  wadinfo_t* {.bycopy.} = object
    identification* {.importc: "identification".}: array[4, char] #  Should be "IWAD" or "PWAD".
    numlumps* {.importc: "numlumps".}: cint
    infotableofs* {.importc: "infotableofs".}: cint

  filelump_t* {.bycopy.} = object
    filepos* {.importc: "filepos".}: cint
    size* {.importc: "size".}: cint
    name* {.importc: "name".}: array[8, char]


#
#  WADFILE I/O related stuff.
#

type
  lumpinfo_t* {.bycopy.} = object
    name* {.importc: "name".}: array[8, char]
    handle* {.importc: "handle".}: cint
    position* {.importc: "position".}: cint
    size* {.importc: "size".}: cint


#var lumpcache* : ptr pointer

#var lumpinfo* : ptr lumpinfo_t

#var numlumps* : cint

#proc W_InitMultipleFiles*(filenames: cstringArray) {.
    #importc: "W_InitMultipleFiles", header: "r_bsp.h".}
#proc W_Reload*() 
#proc W_CheckNumForName*(name: cstring): cint {.importc: "W_CheckNumForName",
   # header: "r_bsp.h".}
#proc W_GetNumForName*(name: cstring): cint {.importc: "W_GetNumForName",
    #header: "r_bsp.h".}
#proc W_LumpLength*(lump: cint): cint 
#proc W_ReadLump*(lump: cint; dest: pointer) 
#proc W_CacheLumpNum*(lump: cint; tag: cint): pointer {.importc: "W_CacheLumpNum",
    #header: "r_bsp.h".}
#proc W_CacheLumpName*(name: cstring; tag: cint): pointer {.importc: "W_CacheLumpName",
    #header: "r_bsp.h".}
# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------

#  Emacs style mode select   -*- C++ -*-
# -----------------------------------------------------------------------------
#
#  $Id:$
#
#  Copyright (C) 1993-1996 by id Software, Inc.
#
#  This source is available for distribution and/or modification
#  only under the terms of the DOOM Source Code License as
#  published by id Software. All rights reserved.
#
#  The source is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  FITNESS FOR A PARTICULAR PURPOSE. See the DOOM Source Code License
#  for more details.
#
#  DESCRIPTION:
#       Zone Memory Allocation, perhaps NeXT ObjectiveC inspired.
# 	Remark: this was the only stuff that, according
# 	 to John Carmack, might have been useful for
# 	 Quake.
#
# ---------------------------------------------------------------------

#
#  ZONE MEMORY
#  PU - purge tags.
#  Tags < 100 are not overwritten until freed.

const
  PU_STATIC* = 1
  PU_SOUND* = 2
  PU_MUSIC* = 3
  PU_DAVE* = 4
  PU_LEVEL* = 50
  PU_LEVSPEC* = 51
  PU_PURGELEVEL* = 100
  PU_CACHE* = 101

#proc Z_Init*() 
#proc Z_Malloc*(size: cint; tag: cint; `ptr`: pointer): pointer {.importc: "Z_Malloc",
    #header: "r_bsp.h".}
#proc Z_Free*(`ptr`: pointer) 
#proc Z_FreeTags*(lowtag: cint; hightag: cint) {.importc: "Z_FreeTags",
  #  header: "r_bsp.h".}
#proc Z_DumpHeap*(lowtag: cint; hightag: cint) {.importc: "Z_DumpHeap",
   # header: "r_bsp.h".}
#proc Z_FileDumpHeap*(f: ptr FILE) 
#proc Z_CheckHeap*() 
#proc Z_ChangeTag2*(`ptr`: pointer; tag: cint; file: cstring; line: cint) {.
    #importc: "Z_ChangeTag2", header: "r_bsp.h".}
#proc Z_FreeMemory*(): cint 
type
  memblock_s* {.bycopy.} = object
    size* {.importc: "size".}: cint #  including the header and possibly tiny fragments
    user* {.importc: "user".}: ptr pointer #  NULL if a free block
    tag* {.importc: "tag".}: cint #  purgelevel
    id* {.importc: "id".}: cint  #  should be ZONEID
    next* {.importc: "next".}: ptr memblock_s
    prev* {.importc: "prev".}: ptr memblock_s
  
  memblock_t* = memblock_s

  memzone_t* {.bycopy.} = object
    size* {.importc: "size".}: cint #  total bytes malloced, including header
    #  start / end cap for linked list
    blocklist* {.importc: "blocklist".}: memblock_t
    rover* {.importc: "rover".}: ptr memblock_t


#var mainzone* : ptr memzone_t

#
#  This is used to get the local FILE:LINE info from CPP
#  prior to really call the function in question.
#

# -----------------------------------------------------------------------------
#
#  $Log:$
#
# -----------------------------------------------------------------------------
