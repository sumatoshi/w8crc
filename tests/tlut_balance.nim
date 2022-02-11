{.used.}

import params/[crckinds, crcbook, crckindsplus, crcbookplus]
import algolut, halfcrcs, initlookups

import std/[unittest, random]

suite "crclut_crcspec(prev > 0)->balance???":
  ## 1. Check the calculation of the crc by parts 
  ## 2. Check balance() function. Which allows to calculate crc by parts
  ## in "unbalanced" Crc's like CRC-16/RIELLO, CRC-32/CKSUM...
  setup:
    let mb1 = 1048576
    var bigdat = newSeqOfCap[uint8](mb1)

    randomize()

    for i in 0..<mb1:
      bigdat.add uint8(rand(255))
    let
      part1 = bigdat[0..<262144]
      part2 = bigdat[262144..<524288]
      part3 = bigdat[524288..<786432]
      part4 = bigdat[786432..<1048576]

  test "crc8":
    for kind in Crc8Kind:
      let spec = kind.takeCrcSpec()
      if spec.balanceNeeded:
        let lookup = spec.initLookup()
        var r1 = part1.crcLut(spec, lookup, prev = 0)
        spec.balance(r1)
        var r2 = part2.crcLut(spec, lookup, prev = r1)
        spec.balance(r2)
        var r3 = part3.crcLut(spec, lookup, prev = r2)
        spec.balance(r3)
        var r4 = part4.crcLut(spec, lookup, prev = r3)
        let (res, check) = (r4, bigdat.crcLut(spec, lookup))
        check $kind & ":=" & $res == $kind & ":=" & $check
      else:
        let
          lookup = spec.initLookup()
          r1 = part1.crcLut(spec, lookup, prev = 0)
          r2 = part2.crcLut(spec, lookup, prev = r1)
          r3 = part3.crcLut(spec, lookup, prev = r2)
          r4 = part4.crcLut(spec, lookup, prev = r3)
          (res, check) = (r4, bigdat.crcLut(spec, lookup))
        check $kind & ":=" & $res == $kind & ":=" & $check

  test "crc16":
    for kind in Crc16Kind:
      let spec = kind.takeCrcSpec()
      if spec.balanceNeeded():
        let lookup = spec.initLookup()
        var r1 = part1.crcLut(spec, lookup, prev = 0)
        spec.balance(r1)
        var r2 = part2.crcLut(spec, lookup, prev = r1)
        spec.balance(r2)
        var r3 = part3.crcLut(spec, lookup, prev = r2)
        spec.balance(r3)
        var r4 = part4.crcLut(spec, lookup, prev = r3)
        let (res, check) = (r4, bigdat.crcLut(spec, lookup))
        check $kind & ":=" & $res == $kind & ":=" & $check
      else:
        let
          lookup = spec.initLookup()
          r1 = part1.crcLut(spec, lookup, prev = 0)
          r2 = part2.crcLut(spec, lookup, prev = r1)
          r3 = part3.crcLut(spec, lookup, prev = r2)
          r4 = part4.crcLut(spec, lookup, prev = r3)
          (res, check) = (r4, bigdat.crcLut(spec, lookup))
        check $kind & ":=" & $res == $kind & ":=" & $check

  test "crc32":
    for kind in Crc32Kind:
      let spec = kind.takeCrcSpec()
      if spec.balanceNeeded:
        let lookup = spec.initLookup()
        var r1 = part1.crcLut(spec, lookup, prev = 0)
        spec.balance(r1)
        var r2 = part2.crcLut(spec, lookup, prev = r1)
        spec.balance(r2)
        var r3 = part3.crcLut(spec, lookup, prev = r2)
        spec.balance(r3)
        var r4 = part4.crcLut(spec, lookup, prev = r3)
        let (res, check) = (r4, bigdat.crcLut(spec, lookup))
        check $kind & ":=" & $res == $kind & ":=" & $check
      else:
        let
          lookup = spec.initLookup()
          r1 = part1.crcLut(spec, lookup, prev = 0)
          r2 = part2.crcLut(spec, lookup, prev = r1)
          r3 = part3.crcLut(spec, lookup, prev = r2)
          r4 = part4.crcLut(spec, lookup, prev = r3)
          (res, check) = (r4, bigdat.crcLut(spec, lookup))
        check $kind & ":=" & $res == $kind & ":=" & $check

  test "crc++":
    for kind in CrcPlusKind:
      if kind == crc12Umts:
        echo "  crc12Umts not in boat! (need additional bit reversing)"
        # additional refouts also break partitioning
        continue
      let spec = kind.takeCrcSpec()
      if spec.balanceNeeded:
        let lookup = spec.initLookup()
        var r1 = part1.crcLut(spec, lookup, prev = 0)
        spec.balance(r1)
        var r2 = part2.crcLut(spec, lookup, prev = r1)
        spec.balance(r2)
        var r3 = part3.crcLut(spec, lookup, prev = r2)
        spec.balance(r3)
        var r4 = part4.crcLut(spec, lookup, prev = r3)
        let (res, check) = (r4, bigdat.crcLut(spec, lookup))
        check $kind & ":=" & $res == $kind & ":=" & $check
      else:
        let
          lookup = spec.initLookup()
          r1 = part1.crcLut(spec, lookup, prev = 0)
          r2 = part2.crcLut(spec, lookup, prev = r1)
          r3 = part3.crcLut(spec, lookup, prev = r2)
          r4 = part4.crcLut(spec, lookup, prev = r3)
          (res, check) = (r4, bigdat.crcLut(spec, lookup))
        check $kind & ":=" & $res == $kind & ":=" & $check
