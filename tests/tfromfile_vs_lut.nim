{.used.}

import params/[crckinds, crcbook, crckindsplus, crcbookplus]
import algolut, crcspec, crcfromfiles, initlookups

import std/[unittest, random, os]

let
  mbh = 524288
  fname = "w8crc_fromfile_test.bin"

proc writeFile(filename: string, content: openArray[byte]) =
  ## Opens a file named `filename` for writing. Then writes the
  ## `content` completely to the file and closes the file afterwards.
  ## Raises an IO exception in case of an error.
  var f: File = nil
  if open(f, filename, fmWrite):
    try:
      f.writeBuffer(unsafeAddr content[0], content.len)
    finally:
      close(f)
  else:
    raise newException(IOError, "cannot open: " & filename)

suite "crcfromfile(lookup)=crclut(lookup)":
  ## Check crcFromFile(LookupLut)
  setup:
    var bigdat = newSeqOfCap[uint8](mbh)

    randomize()

    for i in 0..<mbh:
      bigdat.add uint8(rand(255))

    if fname.fileExists:
      fname.removeFile

    writeFile fname, bigdat

  test "crc8":
    for kind in Crc8Kind:
      let
        spec = kind.takeCrcSpec()
        lookup = spec.initLookup()
      let
        res = fname.crcFromFile(spec, lookup)
        check = bigdat.crcLut(spec, spec.initLookup)
      check $kind & ":=" & $res == $kind & ":=" & $check

  test "crc16":
    for kind in Crc16Kind:
      let
        spec = kind.takeCrcSpec()
        lookup = spec.initLookup()
      let
        res = fname.crcFromFile(spec, lookup)
        check = bigdat.crcLut(spec, lookup)
      check $kind & ":=" & $res == $kind & ":=" & $check


  test "crc32":
    for kind in Crc32Kind:
      let
        spec = kind.takeCrcSpec()
        lookup = spec.initLookup()
      let
        res = fname.crcFromFile(spec, lookup)
        check = bigdat.crcLut(spec, lookup)
      check $kind & ":=" & $res == $kind & ":=" & $check

  test "crc++":
    for kind in CrcPlusKind:
      let
        spec = kind.takeCrcSpec()
        lookup = spec.initLookup()
      let
        res = fname.crcFromFile(spec, lookup)
        check = bigdat.crcLut(spec, lookup)
      check $kind & ":=" & $res == $kind & ":=" & $check

  if fname.fileExists:
      fname.removeFile
