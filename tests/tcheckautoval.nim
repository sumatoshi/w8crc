{.used.}

import params/[crckinds, crcbook, crckindsplus, crcbookplus]
import crcspec, checkautoval

import unittest

import checkhelper

suite "initcrcspec_nocheck=check":

  test "crc16Gsm":
    let res  = crc16Gsm.takeCrcSpec.check
    let check = initCrcSpec(
      name = $crc16Gsm,
      size = 16,
      poly = 0x1021'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0xffff'u32
      #check = 0xce3c'u32
    ).check
    printResult(crc16Gsm, res, check)
    check (res xor check) == 0

  test "crc32Cksum":
    let res  = crc32Cksum.takeCrcSpec.check
    let check = initCrcSpec(
      name = $crc32Cksum,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0x00000000'u32,
      refin = false,
      refout = false,
      xorout = 0xffffffff'u32
      #check = 0x765e7680'u32
    ).check
    printResult(crc32Cksum, res, check)
    check (res xor check) == 0

  test "crc12Umts":
    let res  = crc12Umts.takeCrcSpec.check
    let check = initCrcSpec(
      name = $crc12Umts,
      size = 12,
      poly = 0x80f'u32,
      init = 0x000'u32,
      refin = false,
      refout = true,
      xorout = 0x000'u32
      #check = 0xdaf'u32
    ).check
    printResult(crc12Umts, res, check)
    check (res xor check) == 0
