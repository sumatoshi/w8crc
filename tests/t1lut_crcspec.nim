{.used.}

import params/[crckinds, crcbook, crckindsplus, crcbookplus]
import algolut, crcspec, initlookups

import unittest

## Check lut algo

suite "crclut_crcspec(string)=check":
  setup:
    let dstr = "123456789"

  test "crc8":
    for kind in Crc8Kind:
      let spec = kind.takeCrcSpec()
      let (res, check) = (dstr.crcLut(spec, spec.initLookup), spec.check)
      check $kind & ":=" & $res == $kind & ":=" & $check
 
  test "crc16":
    for kind in Crc16Kind:
      let spec = kind.takeCrcSpec()
      let (res, check) = (dstr.crcLut(spec, spec.initLookup), spec.check)
      check $kind & ":=" & $res == $kind & ":=" & $check
  
  test "crc32":
    for kind in Crc32Kind:
      let spec = kind.takeCrcSpec()
      let (res, check) = (dstr.crcLut(spec, spec.initLookup), spec.check)
      check $kind & ":=" & $res == $kind & ":=" & $check

  test "crc++":
    for kind in CrcPlusKind:
      let spec = kind.takeCrcSpec()
      let (res, check) = (dstr.crcLut(spec, spec.initLookup), spec.check)
      check $kind & ":=" & $res == $kind & ":=" & $check

suite "crclut_crcspec(byte)=check":
  setup:
    let d8 = @[0x31'u8, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39]

  test "crc8":
    for kind in Crc8Kind:
      let spec = kind.takeCrcSpec()
      let (res, check) = (d8.crcLut(spec, spec.initLookup), spec.check)
      check $kind & ":=" & $res == $kind & ":=" & $check
 
  test "crc16":
    for kind in Crc16Kind:
      let spec = kind.takeCrcSpec()
      let (res, check) = (d8.crcLut(spec, spec.initLookup), spec.check)
      check $kind & ":=" & $res == $kind & ":=" & $check
  
  test "crc32":
    for kind in Crc32Kind:
      let spec = kind.takeCrcSpec()
      let (res, check) = (d8.crcLut(spec, spec.initLookup), spec.check)
      check $kind & ":=" & $res == $kind & ":=" & $check

  test "crc++":
    for kind in CrcPlusKind:
      let spec = kind.takeCrcSpec()
      let (res, check) = (d8.crcLut(spec, spec.initLookup), spec.check)
      check $kind & ":=" & $res == $kind & ":=" & $check
