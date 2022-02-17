## W8crc - A full-featured CRC library for Nim

Features:
* Bitwise and lookup table crc algorithms
* Support for all parameterized crc algos from [CRC RevEng](https://reveng.sourceforge.io/crc-catalogue/all.htm) (except >32 for now)
* Precomputations at compile time to speed up the calculation of parameterized crc algos
* Calculating any user-defined crc
* Calculating crc in parts (corresponding `balance` feature)
* Calculating crc from file
* Support for x32/x64 architectures
* Pure nim

Todo:
* BE test (not tested yet) 
* Docs
* Shift4 and Shift8 intel algos implementation
* Crc64 support
* Better `crcFromFile`

### Bitwise
Common use (the calculated CrcKind is known at compiletime):
```nim
import std/strutils
let
  str = "123456789"
  bytes = @[0x31'u8, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39]
assert str.crcBitwise(crc32Posix) == crc32Posix.takeCrcSpec.check
assert bytes.crcBitwise(crc16MaximDow).toHex(4) == "44C2"
```
Completely runtime:
```nim
for k in Crc32Kind:
  # slower, larger executable file size -> not recommended use case
  # instead use constant CrcKinds wherever is possible
  discard "rt".crcBitwise(k.takeCrcSpec)
```
### Lookup table
```nim
# first we initialize lookup
const ct = static: crc8.initLookup()
let rt = crc8.initLookup()

# then
assert "😎".crcLut(crc8, rt) == @[0xf0'u8, 0x9f, 0x98, 0x8e].crcLut(crc8, ct)
```

### Using advanced crc params
```nim
# additional import required
import w8crc/params/[crcbookplus, crckindsplus]

assert "123456789".crcBitwise(crc12Umts.takeCrcSpec) == crc12Umts.takeCrcSpec.check
```

### Custom crc params
To calculate custom crc we need to initialize CrcSpec. CrcSpec also needs `check` value, specify it as the last argument of `initCrcSpec` if you know, otherwise it will be calculated automatically.
```nim
var ❓ = initCrcSpec(
  name = "CRC-8/???",
  size = 8,
  poly = 0x9b'u32,
  init = 0x00'u32,
  refin = false,
  refout = false,
  xorout = 0x00'u32
)
assert "123456789".crcBitwise(❓) == crc8Lte.takeCrcSpec.check
assert " ".crcBitwise(❓) == " ".crcBitwise(crc8Lte.takeCrcSpec)
```

### Calculation by parts (lut only)
The calculation of crc can easily be broken into parts. But not all parameterized crc can be used for this out of the box (init xor xorout > 0). Use a `balance` to fix this.
```nim
let
 bigdat = @[0x31'u8, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39]
 (p0, p1) = (@[0x31'u8, 0x32, 0x33, 0x34, 0x35], @[0x36'u8, 0x37, 0x38, 0x39])

assert crc32Pkzip.balanceNeeded == false # no need to use balance()
assert crc32Posix.balanceNeeded == true

let
  lookup = crc32Posix.initLookup()
  check = bigdat.crcLut(crc32Posix, lookup)

var r0 = p0.crcLut(crc32Posix, lookup, prev = 0)
var r1 = p1.crcLut(crc32Posix, lookup, prev = r0)

assert r1 != check

crc32Posix.balance(r0)
r1 = p1.crcLut(crc32Posix, lookup, prev = r0)

assert r1 == check
```
### From file
```nim
let lookup = crc16CcitFalse.initLookup()
discard "example.bin".crcFromFile(crc16CcitFalse, lookup)
```

### Switches
1. `-d:useBranchFree64` (uses int64 to calculate crc32❗). The branch free version of the remainder calculation doubles the bitwise calculation speed on modern cpu's (which is also used in the calculation of lookup tables). For x32 compatibility, the `useBranchFree64` switch is **disabled** by default. 

### Gratitude
* [Fast CRC32 by Stephan Brumme](https://create.stephan-brumme.com/crc32/)
* [Crcsharp from crccalc.com](https://github.com/meetanthony/crccsharp)
* [CRC RevEng](https://reveng.sourceforge.io/crc-catalogue/all.htm)
* [Intel](https://www.intel.com/content/dam/www/public/us/en/documents/white-papers/fast-crc-computation-generic-polynomials-pclmulqdq-paper.pdf)
