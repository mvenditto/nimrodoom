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