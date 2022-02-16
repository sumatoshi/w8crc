## -d:release for loop unrolling by compiler

const useBranchFree64* {.booldefine.} = false

template updRight*(crc: var uint32, pol: uint32) =
  when useBranchFree64:
    for j in 0..7:
      crc = (crc shr 1) xor cast[uint32](-(int)(crc and 1'u32)) and pol
  else:
    for j in 0..7:
      if (crc and 1'u32) > 0'u32:
        crc = (crc shr 1) xor pol
      else:
        crc = crc shr 1

template updLeft*(crc: var uint32, msb, pol: uint32, tothemoon: int) =
  when useBranchFree64:
    for j in 0..7:
      crc = (crc shl 1) xor cast[uint32](-(int)(crc and msb) shr tothemoon) and pol
  else:
    for j in 0..7:
      if (crc and msb) > 0'u32:
        crc = (crc shl 1) xor pol
      else:
        crc = crc shl 1
