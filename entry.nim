import i_video
import m_swap
import w_wad
import z_zone

import logging
import os


let LogFile = "./logs/nimrodoom.log"
discard existsOrCreateDir("logs")

writeFile(LogFile, "")

var logger = newFileLogger(LogFile, fmtStr="[$time] - $levelid: ")

addHandler(logger)

var consoleLogger = newConsoleLogger()

addHandler(consoleLogger)