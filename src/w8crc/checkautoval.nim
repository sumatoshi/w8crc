import crcspec, algobitwise

func initCrcSpec*(name: string, size: int, poly, init: uint32,
                  refin, refout: bool, xorout: uint32): CrcSpec =
  ## Initialize CrcSpec without check and calculate it
  result = initCrcSpec(
    name = name,
    size = size,
    poly = poly,
    init = init,
    refin = refin,
    refout = refout,
    xorout = xorout,
    check = "123456789".crcBitwise(
      initCrcSpec(name, size, poly, init, refin, refout, xorout, check = 0)
    )
  )
