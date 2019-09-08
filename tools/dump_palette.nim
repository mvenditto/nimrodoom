import imageman
import strutils
import streams
import strformat
import os
import osproc
import parseopt
import sequtils

# ./dump_palette [-i:/path/to/PLAYPAL] [-o:my_palette.png] [--pal:16]
# defaults: 
# ./dump_palette [-i:PLAYPAL] [-o:palette_{pal}.png] [--pal:0]

const helpStr = """
usage: 

./dump_palette [-i:/path/to/PLAYPAL] [-o:my_palette.png] [--pal:16]

defaults (no args): 
./dump_palette [-i:PLAYPAL] [-o:palette_{pal}.png] [--pal:0]
"""

const PAL_SIZE = 256
const IMG_SIZE = 16
const COL_BYTES = 3

var input = "PLAYPAL"
var pal = 0
var output = &"palette_{pal}.png"

proc parseArgs() =
    var p = initOptParser(commandLineParams())
    while true:
        p.next()
        case p.kind
            of cmdEnd: break
            of cmdShortOption, cmdLongOption:
                if p.key == "help":
                    echo helpStr
                    quit(0)
                if p.val == "": 
                    continue
                else:
                    echo p.key
                    case p.key
                    of "out", "o": output = p.val
                    of "input", "i": input = p.val
                    of "pal", "p": pal = parseInt(p.val)
            of cmdArgument:
                continue

parseArgs()

assert (pal >= 0 and pal <= 13)

var buff = new array[COL_BYTES, uint8]
var surf = initImage[ColorRGBU](IMG_SIZE, IMG_SIZE)
var fs = newFileStream(input)
fs.setPosition(PAL_SIZE * COL_BYTES * pal)
var row = 0
var col = 0

for i in 0..PAL_SIZE - 1:

    discard fs.readData(buff[0].addr, COL_BYTES)

    # echo &"({col},{row}) => {(buff[0], buff[1], buff[2])}"

    surf[row, col] = ColorRGBU(buff[])

    col = col + 1
    if col >= IMG_SIZE:
        col = 0
        row = row + 1
    if row >= IMG_SIZE or fs.atEnd():
        break

echo &"saving palette{pal} to {output}"
savePNG(surf, output)



