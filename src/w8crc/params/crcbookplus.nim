import ../crcspec
import crckindsplus

#---------------------------------- Private -----------------------------------#

const CrcPlusList = [
  crc3Gsm:
    initCrcSpec(
      name = $crc3Gsm,
      size = 3,
      poly = 0x3'u32,
      init = 0x0'u32,
      refin = false,
      refout = false,
      xorout = 0x7'u32,
      check = 0x4'u32
    ),
  crc3Rohc:
    initCrcSpec(
      name = $crc3Rohc,
      size = 3,
      poly = 0x3'u32,
      init = 0x7'u32,
      refin = true,
      refout = true,
      xorout = 0x0'u32,
      check = 0x6'u32
    ),
  crc4G704:
    initCrcSpec(
      name = $crc4G704,
      size = 4,
      poly = 0x3'u32,
      init = 0x0'u32,
      refin = true,
      refout = true,
      xorout = 0x0'u32,
      check = 0x7'u32
    ),
  crc4Interlaken:
    initCrcSpec(
      name = $crc4Interlaken,
      size = 4,
      poly = 0x3'u32,
      init = 0xf'u32,
      refin = false,
      refout = false,
      xorout = 0xf'u32,
      check = 0xb'u32
    ),
  crc5EpcC1G1:
    initCrcSpec(
      name = $crc5EpcC1G1,
      size = 5,
      poly = 0x09'u32,
      init = 0x09'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0x00'u32
    ),
  crc5G704:
    initCrcSpec(
      name = $crc5G704,
      size = 5,
      poly = 0x15'u32,
      init = 0x00'u32,
      refin = true,
      refout = true,
      xorout = 0x00'u32,
      check = 0x07'u32
    ),
  crc5Usb:
    initCrcSpec(
      name = $crc5Usb,
      size = 5,
      poly = 0x05'u32,
      init = 0x1f'u32,
      refin = true,
      refout = true,
      xorout = 0x1f'u32,
      check = 0x19'u32
    ),
  crc6Cdma2000A:
    initCrcSpec(
      name = $crc5Usb,
      size = 6,
      poly = 0x27'u32,
      init = 0x3f'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0x0d'u32
    ),
  crc6Cdma2000B:
    initCrcSpec(
      name = $crc6Cdma2000B,
      size = 6,
      poly = 0x07'u32,
      init = 0x3f'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0x3b'u32
    ),
  crc6Darc:
    initCrcSpec(
      name = $crc6Darc,
      size = 6,
      poly = 0x19'u32,
      init = 0x00'u32,
      refin = true,
      refout = true,
      xorout = 0x00'u32,
      check = 0x26'u32
    ),
  crc6G704:
    initCrcSpec(
      name = $crc6G704,
      size = 6,
      poly = 0x03'u32,
      init = 0x00'u32,
      refin = true,
      refout = true,
      xorout = 0x00'u32,
      check = 0x06'u32
    ),
  crc6Gsm:
    initCrcSpec(
      name = $crc6Gsm,
      size = 6,
      poly = 0x2f'u32,
      init = 0x00'u32,
      refin = false,
      refout = false,
      xorout = 0x3f'u32,
      check = 0x13'u32
    ),
  crc7Mmc:
    initCrcSpec(
      name = $crc7Mmc,
      size = 7,
      poly = 0x09'u32,
      init = 0x00'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0x75'u32
    ),
  crc7Rohc:
    initCrcSpec(
      name = $crc7Rohc,
      size = 7,
      poly = 0x4f'u32,
      init = 0x7f'u32,
      refin = true,
      refout = true,
      xorout = 0x00'u32,
      check = 0x53'u32
    ),
  crc7Umts:
    initCrcSpec(
      name = $crc7Umts,
      size = 7,
      poly = 0x45'u32,
      init = 0x00'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0x61'u32
    ),
  crc10Atm:
    initCrcSpec(
      name = $crc10Atm,
      size = 10,
      poly = 0x233'u32,
      init = 0x000'u32,
      refin = false,
      refout = false,
      xorout = 0x000'u32,
      check = 0x199'u32
    ),
  crc10Cdma2000:
    initCrcSpec(
      name = $crc10Cdma2000,
      size = 10,
      poly = 0x3d9'u32,
      init = 0x3ff'u32,
      refin = false,
      refout = false,
      xorout = 0x000'u32,
      check = 0x233'u32
    ),
  crc10Gsm:
    initCrcSpec(
      name = $crc10Gsm,
      size = 10,
      poly = 0x175'u32,
      init = 0x000'u32,
      refin = false,
      refout = false,
      xorout = 0x3ff'u32,
      check = 0x12a'u32
    ),
  crc11Flexray:
    initCrcSpec(
      name = $crc11Flexray,
      size = 11,
      poly = 0x385'u32,
      init = 0x01a'u32,
      refin = false,
      refout = false,
      xorout = 0x000'u32,
      check = 0x5a3'u32
    ),
  crc11Umts:
    initCrcSpec(
      name = $crc11Umts,
      size = 11,
      poly = 0x307'u32,
      init = 0x000'u32,
      refin = false,
      refout = false,
      xorout = 0x000'u32,
      check = 0x061'u32
    ),
  crc12Cdma2000:
    initCrcSpec(
      name = $crc12Cdma2000,
      size = 12,
      poly = 0xf13'u32,
      init = 0xfff'u32,
      refin = false,
      refout = false,
      xorout = 0x000'u32,
      check = 0xd4d'u32
    ),
  crc12Dect:
    initCrcSpec(
      name = $crc12Dect,
      size = 12,
      poly = 0x80f'u32,
      init = 0x000'u32,
      refin = false,
      refout = false,
      xorout = 0x000'u32,
      check = 0xf5b'u32
    ),
  crc12Gsm:
    initCrcSpec(
      name = $crc12Gsm,
      size = 12,
      poly = 0xd31'u32,
      init = 0x000'u32,
      refin = false,
      refout = false,
      xorout = 0xfff'u32,
      check = 0xb34'u32
    ),
  crc12Umts:
    initCrcSpec(
      name = $crc12Umts,
      size = 12,
      poly = 0x80f'u32,
      init = 0x000'u32,
      refin = false,
      refout = true,
      xorout = 0x000'u32,
      check = 0xdaf'u32
    ),
  crc13Bbc:
    initCrcSpec(
      name = $crc13Bbc,
      size = 13,
      poly = 0x1cf5'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x000'u32,
      check = 0x04fa'u32
    ),
  crc14Darc:
    initCrcSpec(
      name = $crc14Darc,
      size = 14,
      poly = 0x0805'u32,
      init = 0x0000'u32,
      refin = true,
      refout = true,
      xorout = 0x000'u32,
      check = 0x082d'u32
    ),
  crc14Gsm:
    initCrcSpec(
      name = $crc14Gsm,
      size = 14,
      poly = 0x202d'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x3fff'u32,
      check = 0x30ae'u32
    ),
  crc15Can:
    initCrcSpec(
      name = $crc15Can,
      size = 15,
      poly = 0x4599'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x059e'u32
    ),
  crc15Mpt1327:
    initCrcSpec(
      name = $crc15Mpt1327,
      size = 15,
      poly = 0x6815'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0001'u32,
      check = 0x2566'u32
    ),
  crc17CanFd:
    initCrcSpec(
      name = $crc17CanFd,
      size = 17,
      poly = 0x1685b'u32,
      init = 0x00000'u32,
      refin = false,
      refout = false,
      xorout = 0x00000'u32,
      check = 0x04f03'u32
    ),
  crc21CanFd:
    initCrcSpec(
      name = $crc21CanFd,
      size = 21,
      poly = 0x102899'u32,
      init = 0x000000'u32,
      refin = false,
      refout = false,
      xorout = 0x000000'u32,
      check = 0x0ed841'u32
    ),
  crc24Ble:
    initCrcSpec(
      name = $crc24Ble,
      size = 24,
      poly = 0x00065b'u32,
      init = 0x555555'u32,
      refin = true,
      refout = true,
      xorout = 0x000000'u32,
      check = 0xc25a56'u32
    ),
  crc24FlexrayA:
    initCrcSpec(
      name = $crc24FlexrayA,
      size = 24,
      poly = 0x5d6dcb'u32,
      init = 0xfedcba'u32,
      refin = false,
      refout = false,
      xorout = 0x000000'u32,
      check = 0x7979bd'u32
    ),
  crc24FlexrayB:
    initCrcSpec(
      name = $crc24FlexrayB,
      size = 24,
      poly = 0x5d6dcb'u32,
      init = 0xabcdef'u32,
      refin = false,
      refout = false,
      xorout = 0x000000'u32,
      check = 0x1f23b8'u32
    ),
  crc24Interlaken:
    initCrcSpec(
      name = $crc24Interlaken,
      size = 24,
      poly = 0x328b63'u32,
      init = 0xffffff'u32,
      refin = false,
      refout = false,
      xorout = 0xffffff'u32,
      check = 0xb4f3e6'u32
    ),
  crc24LteA:
    initCrcSpec(
      name = $crc24LteA,
      size = 24,
      poly = 0x864cfb'u32,
      init = 0x000000'u32,
      refin = false,
      refout = false,
      xorout = 0x000000'u32,
      check = 0xcde703'u32
    ),
  crc24LteB:
    initCrcSpec(
      name = $crc24LteB,
      size = 24,
      poly = 0x800063'u32,
      init = 0x000000'u32,
      refin = false,
      refout = false,
      xorout = 0x000000'u32,
      check = 0x23ef52'u32
    ),
  crc24OpenPgp:
    initCrcSpec(
      name = $crc24OpenPgp,
      size = 24,
      poly = 0x864cfb'u32,
      init = 0xb704ce'u32,
      refin = false,
      refout = false,
      xorout = 0x000000'u32,
      check = 0x21cf02'u32
    ),
  crc24Os9:
    initCrcSpec(
      name = $crc24Os9,
      size = 24,
      poly = 0x800063'u32,
      init = 0xffffff'u32,
      refin = false,
      refout = false,
      xorout = 0xffffff'u32,
      check = 0x200fa5'u32
    ),
  crc30Cdma:
    initCrcSpec(
      name = $crc30Cdma,
      size = 30,
      poly = 0x2030b9c7'u32,
      init = 0x3fffffff'u32,
      refin = false,
      refout = false,
      xorout = 0x3fffffff'u32,
      check = 0x04c34abf'u32
    ),
  crc31Philips:
    initCrcSpec(
      name = $crc31Philips,
      size = 31,
      poly = 0x04c11db7'u32,
      init = 0x7fffffff'u32,
      refin = false,
      refout = false,
      xorout = 0x7fffffff'u32,
      check = 0x0ce9e46c'u32
    )
]

#----------------------------------- Public -----------------------------------#

func takeCrcSpec*(kind: CrcPlusKind): CrcSpec =
 CrcPlusList[kind]
