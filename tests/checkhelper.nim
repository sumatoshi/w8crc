import std/strutils

import params/[crckinds, crckindsplus]
import crcspec

template printResult*(k: Crc8Kind, res, check: uint32) =
  when defined(debugResult):
    echo "[" & k.takeCrcSpec.name & "]"
    echo(
      "  RES:   ",                      # fix for 1.0.0
      cast[int16](res).tohex(2),        # js backend
      " (" & $(cast[int16](res)) & ")"  # version
    )
    echo(
      "  CHECK: ",
      cast[int16](check).tohex(2),
      " (" & $(cast[int16](check)) & ")"
    )

template printResult*(k: Crc16Kind, res, check: uint32) =
  when defined(debugResult):
    echo "[" & k.takeCrcSpec.name & "]"
    echo(
      "  RES:   ",
      cast[int32](res).tohex(4),
      " (" & $(cast[int32](res)) & ")"
    )
    echo(
      "  CHECK: ",
      cast[int32](check).tohex(4),
      " (" & $(cast[int32](check)) & ")"
    )

template printResult*(k: Crc32Kind, res, check: uint32) =
  when defined(debugResult):
    echo "[" & k.takeCrcSpec.name & "]"
    echo(
      "  RES:   ",
      cast[int64](res).tohex(8),
      " (" & $(cast[int64](res)) & ")"
    )
    echo(
      "  CHECK: ",
      cast[int64](check).tohex(8),
      " (" & $(cast[int64](check)) & ")"
    )

template printResult*(k: CrcPlusKind; res, check: uint32) =
  when defined(debugResult):
    echo "[" & k.takeCrcSpec.name & "]"
    echo(
      "  RES:   ",
      cast[int64](res).tohex(8),
      " (" & $(cast[int64](res)) & ")"
    )
    echo(
      "  CHECK: ",
      cast[int64](check).tohex(8),
      " (" & $(cast[int64](check)) & ")"
    )
