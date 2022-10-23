import params/[crcbook, crckinds]
import crcspec, luttabs, revxbits

#---------------------------------- Private -----------------------------------#

func crcLutArrCtRight(data: openArray[byte], revinit, xorout: uint32,
                      lookup: LookupLut, prev: uint32 = 0): uint32 =
  var crc = revinit xor prev
  for dat in data:
    crc = (crc shr 8) xor lookup[(crc and 0xFF'u32) xor dat]
  result = crc xor xorout

func crcLutStrCtRight(data: string, revinit, xorout: uint32,
                      lookup: LookupLut, prev: uint32 = 0): uint32 =
  var crc = revinit xor prev
  for dat in data:
    crc = (crc shr 8) xor lookup[(crc and 0xFF'u32) xor cast[uint32](dat.ord)]
  result = crc xor xorout

func crcLutArrCtLeft(data: openArray[byte], init, xorout, mask: uint32,
                     to0: int32, lookup: LookupLut, prev: uint32 = 0): uint32 =
  var crc = init xor prev
  for dat in data:
    crc = (crc shl 8) xor lookup[((crc shr to0) and 0xFF'u32) xor dat]
  result = (crc xor xorout) and mask

func crcLutStrCtLeft(data: string, init, xorout, mask: uint32,
                     to0: int32, lookup: LookupLut): uint32 =
  var crc = init
  for dat in data:
    crc = (crc shl 8) xor lookup[((crc shr to0) and 0xFF'u32) xor cast[uint32](dat.ord)]
  result = (crc xor xorout) and mask

func crcLutArrAllRight(data: openArray[byte], spec: CrcSpec,
                       lookup: LookupLut, prev: uint32 = 0): uint32 =
  var crc = spec.init.revXb(spec.size) xor prev
  for dat in data:
    crc = (crc shr 8) xor lookup[(crc and 0xFF'u32) xor dat]
  if unlikely(spec.refoutNeeded):
    result = (crc xor spec.xorout).revXb(spec.size)
  else: result = (crc xor spec.xorout)

func crcLutStrAllRight(data: string, spec: CrcSpec, lookup: LookupLut): uint32 =
  var crc = spec.init.revXb(spec.size)
  for dat in data:
    crc = (crc shr 8) xor lookup[(crc and 0xFF'u32) xor cast[uint32](dat.ord)]
  if unlikely(spec.refoutNeeded):
    result = (crc xor spec.xorout).revXb(spec.size)
  else: result = (crc xor spec.xorout)

func crcLutArrAllLeft(data: openArray[byte], spec: CrcSpec,
                      lookup: LookupLut, prev: uint32 = 0): uint32 =
  var
    crc = spec.init xor prev
    lr = (spec.size - 8)
  let mask = 0xFFFFFFFF'u32 shr (32 - spec.size)
  if lr >= 0:
    # default (crc >> spec.size - 8) 
    for dat in data:
      crc = (crc shl 8) xor lookup[((crc shr lr) and 0xFF'u32) xor dat]
  else:
    # for poly.size < 8 (crc << abs(spec.size -8))
    lr = lr.abs
    for dat in data:
      crc = (crc shl 8) xor lookup[((crc shl lr) and 0xFF'u32) xor dat]
  if unlikely(spec.refoutNeeded):
    result = (crc xor spec.xorout).revXb(spec.size) and mask
  else: result = (crc xor spec.xorout) and mask

func crcLutStrAllLeft(data: string, spec: CrcSpec, lookup: LookupLut): uint32 =
  var
    crc = spec.init
    lr = (spec.size - 8)
  let mask = 0xFFFFFFFF'u32 shr (32 - spec.size)
  if lr >= 0:
    # default (crc >> spec.size - 8) 
    for dat in data:
      crc = (crc shl 8) xor lookup[((crc shr lr) and 0xFF'u32) xor cast[uint32](dat.ord)]
  else:
    # for poly.size < 8 (crc << abs(spec.size -8))
    lr = lr.abs
    for dat in data:
      crc = (crc shl 8) xor lookup[((crc shl lr) and 0xFF'u32) xor cast[uint32](dat.ord)]
  if unlikely(spec.refoutNeeded):
    result = (crc xor spec.xorout).revXb(spec.size) and mask
  else: result = (crc xor spec.xorout) and mask

#----------------------------------- Public -----------------------------------#

template crcLut*(data: openArray[byte], kind: Crc8Kind, lookup: LookupLut,
                 prev: uint32 = 0): uint32 =
  const sp = crcbook.takeCrcSpec(kind)
  when crcspec.refin(sp):
    const ri = revxbits.rev8b(crcspec.init(sp))
    crcLutArrCtRight(
      data,
      ri,
      crcspec.xorout(sp),
      lookup,
      prev
    )
  else:
    crcLutArrCtRight( # algo remains the same
      data,
      crcspec.init(sp),
      crcspec.xorout(sp),
      lookup,
      prev
    )

template crcLut*(data: string, kind: Crc8Kind, lookup: LookupLut): uint32 =
  const sp = crcbook.takeCrcSpec(kind)
  when crcspec.refin(sp):
    const ri = revxbits.rev8b(crcspec.init(sp))
    crcLutStrCtRight(
      data,
      ri,
      crcspec.xorout(sp),
      lookup
    )
  else:
    crcLutStrCtRight(
      data,
      crcspec.init(sp),
      crcspec.xorout(sp),
      lookup
    )

template crcLut*(data: openArray[byte], kind: Crc16Kind, lookup: LookupLut,
                 prev: uint32 = 0): uint32 =
  const sp = crcbook.takeCrcSpec(kind)
  when crcspec.refin(sp):
    const ri = revxbits.rev16b(crcspec.init(sp))
    crcLutArrCtRight(
      data,
      ri,
      crcspec.xorout(sp),
      lookup,
      prev
    )
  else:
    crcLutArrCtLeft(
      data,
      crcspec.init(sp),
      crcspec.xorout(sp),
      0xFFFF'u32,
      8,
      lookup,
      prev
    )

template crcLut*(data: string, kind: Crc16Kind, lookup: LookupLut): uint32 =
  const sp = crcbook.takeCrcSpec(kind)
  when crcspec.refin(sp):
    const ri = revxbits.rev16b(crcspec.init(sp))
    crcLutStrCtRight(
      data,
      ri,
      crcspec.xorout(sp),
      lookup
    )
  else:
    crcLutStrCtLeft(
      data,
      crcspec.init(sp),
      crcspec.xorout(sp),
      0xFFFF'u32,
      8,
      lookup
    )

template crcLut*(data: openArray[byte], kind: Crc32Kind, lookup: LookupLut,
                 prev: uint32 = 0): uint32 =
  const sp = crcbook.takeCrcSpec(kind)
  when crcspec.refin(sp):
    const ri = revxbits.rev32b(crcspec.init(sp))
    crcLutArrCtRight(
      data,
      ri,
      crcspec.xorout(sp),
      lookup,
      prev
    )
  else:
    crcLutArrCtLeft(
      data,
      crcspec.init(sp),
      crcspec.xorout(sp),
      0xFFFF_FFFF'u32,
      24,
      lookup,
      prev
    )

template crcLut*(data: string, kind: Crc32Kind, lookup: LookupLut,
                 prev: uint32 = 0): uint32 =
  const sp = crcbook.takeCrcSpec(kind)
  when crcspec.refin(sp):
    const ri = revxbits.rev32b(crcspec.init(sp))
    crcLutStrCtRight(
      data,
      ri,
      crcspec.xorout(sp),
      lookup
    )
  else:
    crcLutStrCtLeft(
      data,
      crcspec.init(sp),
      crcspec.xorout(sp),
      0xFFFF_FFFF'u32,
      24,
      lookup
    )

# rt:
func crcLut*(data: openArray[byte], spec: CrcSpec, lookup: LookupLut,
             prev: uint32 = 0): uint32 =
  if spec.refin:
    result = crcLutArrAllRight(data, spec, lookup, prev)
  else:
    result = crcLutArrAllLeft(data, spec, lookup, prev)

func crcLut*(data: string, spec: CrcSpec, lookup: LookupLut): uint32 =
  if spec.refin:
    result = crcLutStrAllRight(data, spec, lookup)
  else:
    result = crcLutStrAllLeft(data, spec, lookup)
