import params/[crckinds, crcbook, crckindsplus, crcbookplus]
import algolut, crcspec, initlookups, algobitwise, halfcrcs, checkautoval
import std/strutils

block:
  let
    str = "123456789"
    bytes = @[0x31'u8, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39]
  assert str.crcBitwise(crc32Posix) == crc32Posix.takeCrcSpec.check
  assert bytes.crcBitwise(crc16MaximDow).toHex(4) == "44C2"

block:
  for k in Crc32Kind:
    # slower, larger executable file size -> not recommended use case
    # instead use constant CrcKinds wherever is possible
    discard "rt".crcBitwise(k.takeCrcSpec)

block:
  # first we initialize lookup
  const ct = static: crc8.initLookup()
  let rt = crc8.initLookup()

  # then
  assert "😎".crcLut(crc8, rt) == @[0xf0'u8, 0x9f, 0x98, 0x8e].crcLut(crc8, ct)

block:
  assert "123456789".crcBitwise(crc12Umts.takeCrcSpec) == crc12Umts.takeCrcSpec.check

block:
  var ❓ = initCrcSpec(
    name = "CRC-8/???",
    size = 8,
    poly = 0x9b'u32,
    init = 0x00'u32,
    refin = false,
    refout = false,
    xorout = 0x00'u32
  )
  assert "123456789".crcBitwise(❓) == crc8Lte.takeCrcSpec.check
  assert " ".crcBitwise(❓) == " ".crcBitwise(crc8Lte.takeCrcSpec)

block:
  let
   bigdat = @[0x31'u8, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39]
   (p0, p1) = (@[0x31'u8, 0x32, 0x33, 0x34, 0x35], @[0x36'u8, 0x37, 0x38, 0x39])

  assert crc32Pkzip.balanceNeeded == false #no need to use balance()
  assert crc32Posix.balanceNeeded == true

  let
    lookup = crc32Posix.initLookup()
    check = bigdat.crcLut(crc32Posix, lookup)

  var r0 = p0.crcLut(crc32Posix, lookup, prev = 0)
  var r1 = p1.crcLut(crc32Posix, lookup, prev = r0)

  assert r1 != check

  crc32Posix.balance(r0)
  r1 = p1.crcLut(crc32Posix, lookup, prev = r0)

  assert r1 == check

block:
  let lookup = crc16CcitFalse.initLookup()
  discard "test.bin".crcFromFile(crc16CcitFalse, lookup)
