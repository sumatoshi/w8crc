import private/updbitwise
import params/[crcbook, crckinds]
import crcspec, luttabs, revxbits

#---------------------------------- Private -----------------------------------#

func lutCtRight(revinit, revpoly: uint32): LookupLut =
  var crc = revinit
  for i in 0'u32..255'u32:
    crc = i
    crc.updRight(revpoly)
    result[i] = crc

func lutCtLeft8(init, poly: uint32): LookupLut =
  var crc = init
  for i in 0'u32..255'u32:
    crc = i
    crc.updLeft(0x80'u32, poly, 7)
    result[i] = crc and 0xFF'u32

func lutCtLeft16(init, poly: uint32): LookupLut =
  var crc = init
  for i in 0'u32..255'u32:
    crc = i shl 8
    crc.updLeft(0x8000'u32, poly, 15)
    result[i] = crc and 0xFFFF'u32

func lutCtLeft32(init, poly: uint32): LookupLut =
  var crc = init
  for i in 0'u32..255'u32:
    crc = i shl 24
    crc.updLeft32(0x80000000'u32, poly, 31)
    result[i] = crc

func lutAllRight(spec: CrcSpec): LookupLut =
  var crc = spec.init.revXb(spec.size)
  var pol = spec.poly.revXb(spec.size)
  for i in 0'u32..255'u32:
    crc = i
    crc.updRight(pol)
    result[i] = crc

func lutAllLeft(spec: CrcSpec): LookupLut =
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
  if spec.size == 32:
    for i in 0'u32..255'u32:
      crc = i shl datSlip
      crc.updLeft32(msb, pol, tothemoon)
      crc = crc shr polSlip # shr back to mask
      result[i] = crc and mask
  else:
    for i in 0'u32..255'u32:
      crc = i shl datSlip
      crc.updLeft(msb, pol, tothemoon)
      crc = crc shr polSlip # shr back to mask
      result[i] = crc and mask


#----------------------------------- Public -----------------------------------#

template initLookup*(kind: Crc8Kind): LookupLut =
  const sp = crcbook.takeCrcSpec(kind)
  when crcspec.refin(sp):
    const
      ri = revxbits.rev8b(crcspec.init(sp))
      rp = revxbits.rev8b(crcspec.poly(sp))
    lutCtRight(ri, rp)
  else:
    lutCtLeft8(
      crcspec.init(sp),
      crcspec.poly(sp)
    )

template initLookup*(kind: Crc16Kind): LookupLut =
  const sp = crcbook.takeCrcSpec(kind)
  when crcspec.refin(sp):
    const
      ri = revxbits.rev16b(crcspec.init(sp))
      rp = revxbits.rev16b(crcspec.poly(sp))
    lutCtRight(ri, rp)
  else:
    lutCtLeft16(
      crcspec.init(sp),
      crcspec.poly(sp)
    )

template initLookup*(kind: Crc32Kind): LookupLut =
  const sp = crcbook.takeCrcSpec(kind)
  when crcspec.refin(sp):
    const
      ri = revxbits.rev32b(crcspec.init(sp))
      rp = revxbits.rev32b(crcspec.poly(sp))
    lutCtRight(ri, rp)
  else:
    lutCtLeft32(
      crcspec.init(sp),
      crcspec.poly(sp)
    )

func initLookup*(spec: CrcSpec): LookupLut =
  if spec.refin:
    lutAllRight(spec)
  else:
    lutAllLeft(spec)
