{.used.}

import params/[crckinds, crcbook, crckindsplus, crcbookplus]
import algobitwise, crcspec

import unittest

import checkhelper

suite "crcbitwise_crcspec(string)=check":
  setup:
    let dstr = "123456789"

  test "crc8":
    for kind in Crc8Kind:
      let (res, check) = (dstr.crcBitwise(kind.takeCrcSpec), kind.takeCrcSpec.check)
      printResult(kind, res, check)
      check (res xor check) == 0
  
  test "crc16":
    for kind in Crc16Kind:
      let (res, check) = (dstr.crcBitwise(kind.takeCrcSpec), kind.takeCrcSpec.check)
      printResult(kind, res, check)
      check (res xor check) == 0
  
  test "crc32":
    for kind in Crc32Kind:
      let (res, check) = (dstr.crcBitwise(kind.takeCrcSpec), kind.takeCrcSpec.check)
      printResult(kind, res, check)
      check (res xor check) == 0

  test "crc++":
    for kind in CrcPlusKind:
      let (res, check) = (dstr.crcBitwise(kind.takeCrcSpec), kind.takeCrcSpec.check)
      printResult(kind, res, check)
      check (res xor check) == 0

suite "crcbitwise_crcspec(byte)=check":
  setup:
    let d8 = @[0x31'u8, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39]

  test "crc8":
    for kind in Crc8Kind:
      let (res, check) = (d8.crcBitwise(kind.takeCrcSpec), kind.takeCrcSpec.check)
      printResult(kind, res, check)
      check (res xor check) == 0

  test "crc16":
    for kind in Crc16Kind:
      let (res, check) = (d8.crcBitwise(kind.takeCrcSpec), kind.takeCrcSpec.check)
      printResult(kind, res, check)
      check (res xor check) == 0

  test "crc32":
    for kind in Crc32Kind:
      let (res, check) = (d8.crcBitwise(kind.takeCrcSpec), kind.takeCrcSpec.check)
      printResult(kind, res, check)
      check (res xor check) == 0

  test "crc++":
    for kind in CrcPlusKind:
      let (res, check) = (d8.crcBitwise(kind.takeCrcSpec), kind.takeCrcSpec.check)
      printResult(kind, res, check)
      check (res xor check) == 0
