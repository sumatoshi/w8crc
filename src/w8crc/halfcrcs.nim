import params/[crcbook, crckinds]
import crcspec, revxbits

func balanceNeeded*(spec: CrcSpec): bool =
  if (spec.init xor spec.xorout) > 0'u32:
    result = true
  else: result = false

func balanceNeeded*[K: Crc8Kind | Crc16Kind | Crc32Kind](kind: K): bool =
  result = kind.takeCrcSpec.balanceNeeded()

func balance*(spec: CrcSpec, reval: var uint32) =
  if spec.refin:
    reval = reval xor (spec.init.revXb(spec.size) xor spec.xorout)
  else: 
    reval = reval xor (spec.init xor spec.xorout)

func balance*[K: Crc8Kind | Crc16Kind | Crc32Kind](kind: K, reval: var uint32) =
  kind.takeCrcSpec.balance(reval)
