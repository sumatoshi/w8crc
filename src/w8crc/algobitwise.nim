import private/updbitwise
import params/[crcbook, crckinds]
import crcspec, revxbits

#---------------------------------- Private -----------------------------------#

func bitwiseArrCtRigt(data: openArray[byte],
                      revinit, revpoly, xorout: uint32): uint32 =
  var crc = revinit
  for dat in data:
    crc = crc xor dat
    crc.updRight(revpoly)
  result = crc xor xorout

func bitwiseStrCtRigt(data: string,
                      revinit, revpoly, xorout: uint32): uint32 =
  var crc = revinit
  for dat in data:
    crc = crc xor cast[uint32](dat.ord)
    crc.updRight(revpoly)
  result = crc xor xorout

func bitwiseArrCtLeft8(data: openArray[byte],
                       init, poly, xorout: uint32): uint32 =
  var crc = init
  for dat in data:
    crc = crc xor dat
    crc.updLeft(0x80'u32, poly, 7)
  result = (crc xor xorout) and 0xFF'u32

func bitwiseStrCtLeft8(data: string,
                       init, poly, xorout: uint32): uint32 =
  var crc = init
  for dat in data:
    crc = crc xor cast[uint32](dat.ord)
    crc.updLeft(0x80'u32, poly, 7)
  result = (crc xor xorout) and 0xFF'u32

func bitwiseArrCtLeft16(data: openArray[byte],
                        init, poly, xorout: uint32): uint32 =
  var crc = init
  for dat in data:
    let ext:uint32 = dat
    crc = crc xor (ext shl 8)
    crc.updLeft(0x8000'u32, poly, 15)
  result = (crc xor xorout) and 0xFFFF'u32

func bitwiseStrCtLeft16(data: string,
                        init, poly, xorout: uint32): uint32 =
  var crc = init
  for dat in data:
    crc = crc xor (cast[uint32](dat.ord) shl 8)
    crc.updLeft(0x8000'u32, poly, 15)
  result = (crc xor xorout) and 0xFFFF'u32

func bitwiseArrCtLeft32(data: openArray[byte],
                        init, poly, xorout: uint32): uint32 =
  var crc = init
  for dat in data:
    let ext:uint32 = dat
    crc = crc xor (ext shl 24)
    crc.updLeft(0x80000000'u32, poly, 31)
  result = crc xor xorout

func bitwiseStrCtLeft32(data: string,
                        init, poly, xorout: uint32): uint32 =
  var crc = init
  for dat in data:
    crc = crc xor (cast[uint32](dat.ord) shl 24)
    crc.updLeft(0x80000000'u32, poly, 31)
  result = crc xor xorout

func bitwiseArrAllRight(data: openArray[byte], spec: CrcSpec): uint32 =
  var crc = spec.init.revXb(spec.size)
  let pol = spec.poly.revXb(spec.size)
  for dat in data:
    crc = crc xor dat
    crc.updRight(pol)
  if unlikely(spec.refoutNeeded):
    result = (crc xor spec.xorout).revXb(spec.size)
  else: result = (crc xor spec.xorout)

func bitwiseStrAllRight(data: string, spec: CrcSpec): uint32 =
  var crc = spec.init.revXb(spec.size)
  let pol = spec.poly.revXb(spec.size)
  for dat in data:
    crc = crc xor cast[uint32](dat.ord)
    crc.updRight(pol)
  if unlikely(spec.refoutNeeded):
    result = (crc xor spec.xorout).revXb(spec.size)
  else: result = (crc xor spec.xorout)

func bitwiseArrAllLeft(data: openArray[byte], spec: CrcSpec): uint32 =
  # datSlip for data shifting in 8+ poly width
  # polSlip to work with < 8 poly width
  var
    datSlip = spec.size - 8
    polSlip =  0
    msb = 1'u32 shl (spec.size - 1)
    pol = spec.poly
    tothemoon = spec.size - 1
  if datSlip < 0:
    # width < 8 (crc3, etc...)
    polSlip = datSlip.abs()
    datSlip =  0
    msb = 0x80'u32
    pol = spec.poly shl polSlip # shl to 0x80
    tothemoon = 7
  var crc = spec.init shl polSlip
  let mask = 0xFFFFFFFF'u32 shr (32 - spec.size)
  for dat in data:
    let ext:uint32 = dat
    crc = crc xor (ext shl datSlip)
    crc.updLeft(msb, pol, tothemoon)
  crc = crc shr polSlip # shr back to mask
  if unlikely(spec.refoutNeeded):
    result = (crc xor spec.xorout).revXb(spec.size) and mask
  else: result = (crc xor spec.xorout) and mask

func bitwiseStrAllLeft(data: string, spec: CrcSpec): uint32 =
  # datSlip for data shifting in 8+ poly width
  # polSlip to work with < 8 poly width
  var
    datSlip = spec.size - 8
    polSlip =  0
    msb = 1'u32 shl (spec.size - 1)
    pol = spec.poly
    tothemoon = spec.size - 1
  if datSlip < 0:
    # width < 8 (crc3, etc...)
    polSlip = datSlip.abs()
    datSlip =  0
    msb = 0x80'u32
    pol = spec.poly shl polSlip # shl to 0x80
    tothemoon = 7
  var crc = spec.init shl polSlip
  let mask = 0xFFFFFFFF'u32 shr (32 - spec.size)
  for dat in data:
    crc = crc xor (cast[uint32](dat.ord) shl datSlip)
    crc.updLeft(msb, pol, tothemoon)
  crc = crc shr polSlip # shr back to mask
  if unlikely(spec.refoutNeeded):
    result = (crc xor spec.xorout).revXb(spec.size) and mask
  else: result = (crc xor spec.xorout) and mask

#----------------------------------- Public -----------------------------------#

template crcBitwise*(data: openArray[byte], kind: Crc8Kind): uint32 =
  const sp = takeCrcSpec(kind)
  when sp.refin:
    const (ri, rp, x) = (rev8b(sp.init), rev8b(sp.poly), sp.xorout)
    bitwiseArrCtRigt(data, ri, rp, x)
  else:
    const (i, p, x) = (sp.init, sp.poly, sp.xorout)
    bitwiseArrCtLeft8(data, i, p, x)

template crcBitwise*(data: string, kind: Crc8Kind): uint32 =
  const sp = takeCrcSpec(kind)
  when sp.refin:
    const (ri, rp, x) = (rev8b(sp.init), rev8b(sp.poly), sp.xorout)
    bitwiseStrCtRigt(data, ri, rp, x)
  else:
    const (i, p, x) = (sp.init, sp.poly, sp.xorout)
    bitwiseStrCtLeft8(data, i, p, x)

template crcBitwise*(data: openArray[byte], kind: Crc16Kind): uint32 =
  const sp = takeCrcSpec(kind)
  when sp.refin:
    const (ri, rp, x) = (rev16b(sp.init), rev16b(sp.poly), sp.xorout)
    bitwiseArrCtRigt(data, ri, rp, x)
  else:
    const (i, p, x) = (sp.init, sp.poly, sp.xorout)
    bitwiseArrCtLeft16(data, i, p, x)

template crcBitwise*(data: string, kind: Crc16Kind): uint32 =
  const sp = takeCrcSpec(kind)
  when sp.refin:
    const (ri, rp, x) = (rev16b(sp.init), rev16b(sp.poly), sp.xorout)
    bitwiseStrCtRigt(data, ri, rp, x)
  else:
    const (i, p, x) = (sp.init, sp.poly, sp.xorout)
    bitwiseStrCtLeft16(data, i, p, x)

template crcBitwise*(data: openArray[byte], kind: Crc32Kind): uint32 =
  const sp = takeCrcSpec(kind)
  when sp.refin:
    const (ri, rp, x) = (rev32b(sp.init), rev32b(sp.poly), sp.xorout)
    bitwiseArrCtRigt(data, ri, rp, x)
  else:
    const (i, p, x) = (sp.init, sp.poly, sp.xorout)
    bitwiseArrCtLeft32(data, i, p, x)

template crcBitwise*(data: string, kind: Crc32Kind): uint32 =
  const sp = takeCrcSpec(kind)
  when sp.refin:
    const (ri, rp, x) = (rev32b(sp.init), rev32b(sp.poly), sp.xorout)
    bitwiseStrCtRigt(data, ri, rp, x)
  else:
    const (i, p, x) = (sp.init, sp.poly, sp.xorout)
    bitwiseStrCtLeft32(data, i, p, x)

# rt:
func crcBitwise*(data: openArray[byte], spec: CrcSpec): uint32 =
  if spec.refin:
    bitwiseArrAllRight(data, spec)
  else:
    bitwiseArrAllLeft(data, spec)

func crcBitwise*(data: string, spec: CrcSpec): uint32 =
  if spec.refin:
    bitwiseStrAllRight(data, spec)
  else:
    bitwiseStrAllLeft(data, spec)
