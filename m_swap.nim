{.emit: """
#include "m_swap.h"
""".}
#nim c --cpu:i386 --os:linux --noLinking --noMain
proc SwapSHORT(x: cushort): cushort {.exportc.} =
     return (x shr 8) or (x shl 8)

proc SwapLONG(x: culong): culong {.exportc.} =
    result = (x shr 24) or 
             ((x shr 8) and 0xff00) or 
             ((x shl 8) and 0xff0000) or 
             (x shl 24)

