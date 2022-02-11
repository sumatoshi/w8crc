import params/[crcbook, crckinds]
import crcspec, luttabs, revxbits

#---------------------------------- Private -----------------------------------#

proc crcFFLutRight(path: string, spec: CrcSpec, lookup: LookupLut,
                   bufferSize: static[Positive] = 8192): uint32 =
  var
    bin = open(path, fmRead)
    buf: array[bufferSize, uint8] 
    crc = spec.init.revXb(spec.size)
  defer: close(bin)
  while true:
    var rb = bin.readBytes(buf, 0, bufferSize)
    for i in 0..<rb:
      crc = (crc shr 8) xor lookup[(crc and 0xFF'u32) xor buf[i]]
    if bin.endOfFile: break
  if unlikely(spec.refoutNeeded):
    result = (crc xor spec.xorout).revXb(spec.size)
  else: result = (crc xor spec.xorout)

proc crcFFLutLeft(path: string, spec: CrcSpec, lookup: LookupLut,
                  bufferSize: static[Positive] = 8192): uint32 =
  var
    bin = open(path, fmRead)
    buf: array[bufferSize, uint8] 
    crc = spec.init
    lr = (spec.size - 8)
  let mask = 0xFFFFFFFF'u32 shr (32 - spec.size)
  defer: close(bin)
  if lr >= 0:
    while true:
      var rb = bin.readBytes(buf, 0, bufferSize)
      for i in 0..<rb:
        crc = (crc shl 8) xor lookup[((crc shr lr) and 0xFF'u32) xor buf[i]]
      if bin.endOfFile: break
  else:
    lr = lr.abs
    while true:
      var rb = bin.readBytes(buf, 0, bufferSize)
      for i in 0..<rb:
        crc = (crc shl 8) xor lookup[((crc shl lr) and 0xFF'u32) xor buf[i]]
      if bin.endOfFile: break
  if unlikely(spec.refoutNeeded):
    result = (crc xor spec.xorout).revXb(spec.size) and mask
  else: result = (crc xor spec.xorout) and mask

#----------------------------------- Public -----------------------------------#

template crcFromFile*(path: string, kind: Crc8Kind | Crc16Kind | Crc32Kind,
                      lookup: LookupLut, bufferSize: static[Positive] = 8192): uint32 =
  const spec = static: kind.takeCrcSpec()
  when spec.refin:
    crcFFLutRight(path, spec, lookup, bufferSize)
  else:
    crcFFLutLeft(path, spec, lookup, bufferSize)

proc crcFromFile*(path: string, spec:CrcSpec, lookup: LookupLut,
                 bufferSize: static[Positive] = 8192): uint32 =
  if spec.refin:
    crcFFLutRight(path, spec, lookup, bufferSize)
  else:
    crcFFLutLeft(path, spec, lookup, bufferSize)
