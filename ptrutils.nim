template `@`*(x: untyped): untyped = 
    cast[uint](x)

template `@+`*(a: untyped, b: int): untyped =
    cast[type(x)](@a + b)

template `@+=`*(a: untyped, b: int): untyped =
    a = a @+ b

template `ith`*(a: untyped, b: uint): untyped =
    a @+ (b * sizeof(type(a[])))

template `set2`*[T](a: ptr T, i: int, b: T): untyped =
    cast[ptr T](a.ith(i))[] = b

template `get2`*[T](a: ptr T, i: int): T =
    cast[ptr T](cast[ptr T](p.ith(i))[])[]

template `get`*[T](a: ptr T, i: int): T =
    cast[ptr UncheckedArray[T]](a)[i]

template `set`*[T](a: ptr T, i: int, b: T): untyped =
    cast[ptr UncheckedArray[T]](a)[i] = b
