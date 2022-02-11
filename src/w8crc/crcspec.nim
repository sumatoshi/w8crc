type CrcSpec* = object
  name: string
  size: int
  poly: uint32
  init: uint32
  refin: bool
  refout: bool
  xorout: uint32
  check: uint32

func initCrcSpec*(name: string, size: int, poly, init: uint32,
                 refin, refout: bool, xorout, check: uint32): CrcSpec =
  assert size > 0, "the CrcSpec hash size must be greater than 0"
  assert size < 33, "the CrcSpec hash size must be less or equal than 32"
  result = CrcSpec(name: name, size: size, poly: poly, init: init,
                   refin: refin, refout: refout, xorout: xorout, check: check)

func name*(self: CrcSpec): string =
  self.name

func size*(self: CrcSpec): int =
  self.size

func poly*(self: CrcSpec): uint32 =
  self.poly

func init*(self: CrcSpec): uint32 =
  self.init

func refin*(self: CrcSpec): bool =
  self.refin

func refout*(self: CrcSpec): bool =
  self.refout

func xorout*(self: CrcSpec): uint32 =
  self.xorout

func check*(self: CrcSpec): uint32 =
  self.check

func refoutNeeded*(self: CrcSpec): bool =
  self.refin xor self.refout
