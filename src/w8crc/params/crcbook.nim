import ../crcspec
import crckinds

#---------------------------------- Private -----------------------------------#

const Crc8List = [
  crc8:
    initCrcSpec(
      name = $crc8,
      size = 8,
      poly = 0x07'u32,
      init = 0x00'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0xf4'u32
    ),
  crc8Aes:
    initCrcSpec(
      name = $crc8Aes,
      size = 8,
      poly = 0x1d'u32,
      init = 0xff'u32,
      refin = true,
      refout = true,
      xorout = 0x00'u32,
      check = 0x97'u32
    ),
  crc8Autosar:
    initCrcSpec(
      name = $crc8Autosar,
      size = 8,
      poly = 0x2f'u32,
      init = 0xff'u32,
      refin = false,
      refout = false,
      xorout = 0xff'u32,
      check = 0xdf'u32
    ),
  crc8Bluetooth:
    initCrcSpec(
      name = $crc8Bluetooth,
      size = 8,
      poly = 0xa7'u32,
      init = 0x00'u32,
      refin = true,
      refout = true,
      xorout = 0x00'u32,
      check = 0x26'u32
    ),
  crc8Cdma2000:
    initCrcSpec(
      name = $crc8Cdma2000,
      size = 8,
      poly = 0x9b'u32,
      init = 0xff'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0xda'u32
    ),
  crc8Darc:
    initCrcSpec(
      name = $crc8Darc,
      size = 8,
      poly = 0x39'u32,
      init = 0x00'u32,
      refin = true,
      refout = true,
      xorout = 0x00'u32,
      check = 0x15'u32
    ),
  crc8DvbS2:
    initCrcSpec(
      name = $crc8DvbS2,
      size = 8,
      poly = 0xd5'u32,
      init = 0x00'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0xbc'u32
    ),
  crc8Ebu:
    initCrcSpec(
      name = $crc8Ebu,
      size = 8,
      poly = 0x1d'u32,
      init = 0xff'u32,
      refin = true,
      refout = true,
      xorout = 0x00'u32,
      check = 0x97'u32
    ),
  crc8GsmA:
    initCrcSpec(
      name = $crc8GsmA,
      size = 8,
      poly = 0x1d'u32,
      init = 0x00'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0x37'u32
    ),
  crc8GsmB:
    initCrcSpec(
      name = $crc8GsmB,
      size = 8,
      poly = 0x49'u32,
      init = 0x00'u32,
      refin = false,
      refout = false,
      xorout = 0xff'u32,
      check = 0x94'u32
    ),
  crc8I4321:
    initCrcSpec(
      name = $crc8I4321,
      size = 8,
      poly = 0x07'u32,
      init = 0x00'u32,
      refin = false,
      refout = false,
      xorout = 0x55'u32,
      check = 0xa1'u32
    ),
  crc8ICode:
    initCrcSpec(
      name = $crc8ICode,
      size = 8,
      poly = 0x1d'u32,
      init = 0xfd'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0x7e'u32
    ),
  crc8Itu:
    initCrcSpec(
      name = $crc8Itu,
      size = 8,
      poly = 0x07'u32,
      init = 0x00'u32,
      refin = false,
      refout = false,
      xorout = 0x55'u32,
      check = 0xa1'u32
    ),
  crc8Lte:
    initCrcSpec(
      name = $crc8Lte,
      size = 8,
      poly = 0x9b'u32,
      init = 0x00'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0xea'u32
    ),
  crc8MaximDow:
    initCrcSpec(
      name = $crc8MaximDow,
      size = 8,
      poly = 0x31'u32,
      init = 0x00'u32,
      refin = true,
      refout = true,
      xorout = 0x00'u32,
      check = 0xa1'u32
    ),
  crc8MifareMad:
    initCrcSpec(
      name = $crc8MifareMad,
      size = 8,
      poly = 0x1d'u32,
      init = 0xc7'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0x99'u32
    ),
  crc8Nrsc5:
    initCrcSpec(
      name = $crc8nrsc5,
      size = 8,
      poly = 0x31'u32,
      init = 0xff'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0xf7'u32
    ),
  crc8OpenSafety:
    initCrcSpec(
      name = $crc8OpenSafety,
      size = 8,
      poly = 0x2f'u32,
      init = 0x00'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0x3e'u32
    ),
  crc8Rohc:
    initCrcSpec(
      name = $crc8Rohc,
      size = 8,
      poly = 0x07'u32,
      init = 0xff'u32,
      refin = true,
      refout = true,
      xorout = 0x00'u32,
      check = 0xd0'u32
    ),
  crc8SaeJ1850:
    initCrcSpec(
      name = $crc8SaeJ1850,
      size = 8,
      poly = 0x1d'u32,
      init = 0xff'u32,
      refin = false,
      refout = false,
      xorout = 0xff'u32,
      check = 0x4b'u32
    ),
  crc8Smbus:
    initCrcSpec(
      name = $crc8,
      size = 8,
      poly = 0x07'u32,
      init = 0x00'u32,
      refin = false,
      refout = false,
      xorout = 0x00'u32,
      check = 0xf4'u32
    ),
  crc8Tech3250:
    initCrcSpec(
      name = $crc8Tech3250,
      size = 8,
      poly = 0x1d'u32,
      init = 0xff'u32,
      refin = true,
      refout = true,
      xorout = 0x00'u32,
      check = 0x97'u32
    ),
  crc8Wcdma:
    initCrcSpec(
      name = $crc8Wcdma,
      size = 8,
      poly = 0x9b'u32,
      init = 0x00'u32,
      refin = true,
      refout = true,
      xorout = 0x00'u32,
      check = 0x25'u32
    )
]
const Crc16List = [
  crc16:
    initCrcSpec(
      name = $crc16,
      size = 16,
      poly = 0x8005'u32,
      init = 0x0000'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0xbb3d'u32
    ),
  crc16A:
    initCrcSpec(
      name = $crc16A,
      size = 16,
      poly = 0x1021'u32,
      init = 0xc6c6'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0xbf05'u32
    ),
  crc16Acorn:
    initCrcSpec(
      name = $crc16Acorn,
      size = 16,
      poly = 0x1021'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x31c3'u32
    ),
  crc16Arc:
    initCrcSpec(
      name = $crc16Arc,
      size = 16,
      poly = 0x8005'u32,
      init = 0x0000'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0xbb3d'u32
    ),
  crc16AugCcitt:
    initCrcSpec(
      name = $crc16AugCcitt,
      size = 16,
      poly = 0x1021'u32,
      init = 0x1d0f'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0xe5cc'u32
    ),
  crc16Autosar:
    initCrcSpec(
      name = $crc16Autosar,
      size = 16,
      poly = 0x1021'u32,
      init = 0xffff'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x29b1'u32
    ),
  crc16B:
    initCrcSpec(
      name = $crc16B,
      size = 16,
      poly = 0x1021'u32,
      init = 0xffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffff'u32,
      check = 0x906e'u32
    ),
  crc16Buypass:
    initCrcSpec(
      name = $crc16Buypass,
      size = 16,
      poly = 0x8005'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0xfee8'u32
    ),
  crc16Ccitt:
    initCrcSpec(
      name = $crc16Ccitt,
      size = 16,
      poly = 0x1021'u32,
      init = 0x0000'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0x2189'u32
    ),
  crc16CcitFalse:
    initCrcSpec(
      name = $crc16CcitFalse,
      size = 16,
      poly = 0x1021'u32,
      init = 0xffff'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x29b1'u32
    ),
  crc16CcitTrue:
    initCrcSpec(
      name = $crc16CcitTrue,
      size = 16,
      poly = 0x1021'u32,
      init = 0x0000'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0x2189'u32
    ),
  crc16Cdma2000:
    initCrcSpec(
      name = $crc16Cdma2000,
      size = 16,
      poly = 0xc867'u32,
      init = 0xffff'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x4c06'u32
    ),
  crc16Cms:
    initCrcSpec(
      name = $crc16Cms,
      size = 16,
      poly = 0x8005'u32,
      init = 0xffff'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0xaee7'u32
    ),
  crc16Darc:
    initCrcSpec(
      name = $crc16Darc,
      size = 16,
      poly = 0x1021'u32,
      init = 0xffff'u32,
      refin = false,
      refout = false,
      xorout = 0xffff'u32,
      check = 0xd64e'u32
    ),
  crc16Dds110:
    initCrcSpec(
      name = $crc16Dds110,
      size = 16,
      poly = 0x8005'u32,
      init = 0x800d'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x9ecf'u32
    ),
  crc16DectR:
    initCrcSpec(
      name = $crc16DectR,
      size = 16,
      poly = 0x0589'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0001'u32,
      check = 0x007e'u32
    ),
  crc16DectX:
    initCrcSpec(
      name = $crc16DectX,
      size = 16,
      poly = 0x0589'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x007f'u32
    ),
  crc16Dnp:
    initCrcSpec(
      name = $crc16Dnp,
      size = 16,
      poly = 0x3d65'u32,
      init = 0x0000'u32,
      refin = true,
      refout = true,
      xorout = 0xffff'u32,
      check = 0xea82'u32
    ),
  crc16En13757:
    initCrcSpec(
      name = $crc16En13757,
      size = 16,
      poly = 0x3d65'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0xffff'u32,
      check = 0xc2b7'u32
    ),
  crc16Epc:
    initCrcSpec(
      name = $crc16Epc,
      size = 16,
      poly = 0x1021'u32,
      init = 0xffff'u32,
      refin = false,
      refout = false,
      xorout = 0xffff'u32,
      check = 0xd64e'u32
    ),
  crc16GeniBus:
    initCrcSpec(
      name = $crc16GeniBus,
      size = 16,
      poly = 0x1021'u32,
      init = 0xffff'u32,
      refin = false,
      refout = false,
      xorout = 0xffff'u32,
      check = 0xd64e'u32
    ),
  crc16Gsm:
    initCrcSpec(
      name = $crc16Gsm,
      size = 16,
      poly = 0x1021'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0xffff'u32,
      check = 0xce3c'u32
    ),
  crc16Ibm:
    initCrcSpec(
      name = $crc16Ibm,
      size = 16,
      poly = 0x8005'u32,
      init = 0x0000'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0xbb3d'u32
    ),
  crc16Ibm3740:
    initCrcSpec(
      name = $crc16Ibm3740,
      size = 16,
      poly = 0x1021'u32,
      init = 0xffff'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x29b1'u32
    ),
  crc16IbmSdlc:
    initCrcSpec(
      name = $crc16IbmSdlc,
      size = 16,
      poly = 0x1021'u32,
      init = 0xffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffff'u32,
      check = 0x906e'u32
    ),
  crc16Icode:
    initCrcSpec(
      name = $crc16Icode,
      size = 16,
      poly = 0x1021'u32,
      init = 0xffff'u32,
      refin = false,
      refout = false,
      xorout = 0xffff'u32,
      check = 0xd64e'u32
    ),
  crc16Iec611582:
    initCrcSpec(
      name = $crc16Iec611582,
      size = 16,
      poly = 0x1dcf'u32,
      init = 0xffff'u32,
      refin = false,
      refout = false,
      xorout = 0xffff'u32,
      check = 0xa819'u32
    ),
  crc16IsoHdlc:
    initCrcSpec(
      name = $crc16IsoHdlc,
      size = 16,
      poly = 0x1021'u32,
      init = 0xffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffff'u32,
      check = 0x906e'u32
    ),
  crc16IsoIek144433A:
    initCrcSpec(
      name = $crc16IsoIek144433A,
      size = 16,
      poly = 0x1021'u32,
      init = 0xc6c6'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0xbf05'u32
    ),
  crc16IsoIek144433B:
    initCrcSpec(
      name = $crc16IsoIek144433B,
      size = 16,
      poly = 0x1021'u32,
      init = 0xffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffff'u32,
      check = 0x906e'u32
    ),
  crc16Kermit:
    initCrcSpec(
      name = $crc16kermit,
      size = 16,
      poly = 0x1021'u32,
      init = 0x0000'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0x2189'u32
    ),
  crc16Lha:
    initCrcSpec(
      name = $crc16Lha,
      size = 16,
      poly = 0x8005'u32,
      init = 0x0000'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0xbb3d'u32
    ),
  crc16Lj1200:
    initCrcSpec(
      name = $crc16Lj1200,
      size = 16,
      poly = 0x6f63'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0xbdf4'u32
    ),
  crc16Lte:
    initCrcSpec(
      name = $crc16Lte,
      size = 16,
      poly = 0x1021'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x31c3'u32
    ),
  crc16MaximDow:
    initCrcSpec(
      name = $crc16MaximDow,
      size = 16,
      poly = 0x8005'u32,
      init = 0x0000'u32,
      refin = true,
      refout = true,
      xorout = 0xffff'u32,
      check = 0x44c2'u32
    ),
  crc16Mcrf4xx:
    initCrcSpec(
      name = $crc16Mcrf4xx,
      size = 16,
      poly = 0x1021'u32,
      init = 0xffff'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0x6f91'u32
    ),
  crc16Modbus:
    initCrcSpec(
      name = $crc16Modbus,
      size = 16,
      poly = 0x8005'u32,
      init = 0xffff'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0x4b37'u32
    ),
  crc16Nrsc5:
    initCrcSpec(
      name = $crc16Nrsc5,
      size = 16,
      poly = 0x080b'u32,
      init = 0xffff'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0xa066'u32
    ),
  crc16OpenSafetyA:
    initCrcSpec(
      name = $crc16OpenSafetyA,
      size = 16,
      poly = 0x5935'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x5d38'u32
    ),
  crc16OpenSafetyB:
    initCrcSpec(
      name = $crc16OpenSafetyB,
      size = 16,
      poly = 0x755b'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x20fe'u32
    ),
  crc16Profibus:
    initCrcSpec(
      name = $crc16Profibus,
      size = 16,
      poly = 0x1dcf'u32,
      init = 0xffff'u32,
      refin = false,
      refout = false,
      xorout = 0xffff'u32,
      check = 0xa819'u32
    ),
  crc16R:
    initCrcSpec(
      name = $crc16R,
      size = 16,
      poly = 0x0589'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0001'u32,
      check = 0x007e'u32
    ),
  crc16Riello:
    initCrcSpec(
      name = $crc16Riello,
      size = 16,
      poly = 0x1021'u32,
      init = 0xb2aa'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0x63d0'u32
    ),
  crc16SpiFujitsu:
    initCrcSpec(
      name = $crc16SpiFujitsu,
      size = 16,
      poly = 0x1021'u32,
      init = 0x1d0f'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0xe5cc'u32
    ),
  crc16T10Dif:
    initCrcSpec(
      name = $crc16T10Dif,
      size = 16,
      poly = 0x8bb7'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0xd0db'u32
    ),
  crc16Teledisk:
    initCrcSpec(
      name = $crc16Teledisk,
      size = 16,
      poly = 0xa097'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000,
      check = 0x0fb3'u32
    ),
  crc16Tms37157:
    initCrcSpec(
      name = $crc16Tms37157,
      size = 16,
      poly = 0x1021'u32,
      init = 0x89ec'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0x26b1'u32
    ),
  crc16Umts:
    initCrcSpec(
      name = $crc16Umts,
      size = 16,
      poly = 0x8005'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0xfee8'u32
    ),
  crc16Usb:
    initCrcSpec(
      name = $crc16Usb,
      size = 16,
      poly = 0x8005'u32,
      init = 0xffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffff'u32,
      check = 0xb4c8'u32
    ),
  crc16V41Lsb:
    initCrcSpec(
      name = $crc16V41Lsb,
      size = 16,
      poly = 0x1021'u32,
      init = 0x0000'u32,
      refin = true,
      refout = true,
      xorout = 0x0000'u32,
      check = 0x2189'u32
    ),
  crc16V41Msb:
    initCrcSpec(
      name = $crc16V41Msb,
      size = 16,
      poly = 0x1021'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x31c3'u32
    ),
  crc16Verifone:
    initCrcSpec(
      name = $crc16Verifone,
      size = 16,
      poly = 0x8005'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0xfee8'u32
    ),
  crc16X:
    initCrcSpec(
      name = $crc16X,
      size = 16,
      poly = 0x0589'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x007f'u32
    ),
  crc16X25:
    initCrcSpec(
      name = $crc16X25,
      size = 16,
      poly = 0x1021'u32,
      init = 0xffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffff'u32,
      check = 0x906e'u32
    ),
  crc16Xmodem:
    initCrcSpec(
      name = $crc16Xmodem,
      size = 16,
      poly = 0x1021'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x31c3'u32
    ),
  crc16Zmodem:
    initCrcSpec(
      name = $crc16Zmodem,
      size = 16,
      poly = 0x1021'u32,
      init = 0x0000'u32,
      refin = false,
      refout = false,
      xorout = 0x0000'u32,
      check = 0x31c3'u32
    )
]
const Crc32List = [
  crc32:
    initCrcSpec(
      name = $crc32,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffffffff'u32,
      check = 0xcbf43926'u32
    ),
  crc32Aal5:
    initCrcSpec(
      name = $crc32Aal5,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0xffffffff'u32,
      refin = false,
      refout = false,
      xorout = 0xffffffff'u32,
      check = 0xfc891918'u32
    ),
  crc32Adccp:
    initCrcSpec(
      name = $crc32Adccp,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffffffff'u32,
      check = 0xcbf43926'u32
    ),
  crc32Aixm:
    initCrcSpec(
      name = $crc32Aixm,
      size = 32,
      poly = 0x814141ab'u32,
      init = 0x00000000'u32,
      refin = false,
      refout = false,
      xorout = 0x00000000'u32,
      check = 0x3010bf7f'u32
    ),
  crc32Autosar:
    initCrcSpec(
      name = $crc32Autosar,
      size = 32,
      poly = 0xf4acfb13'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffffffff'u32,
      check = 0x1697d06a'u32
    ),
  crc32B:
    initCrcSpec(
      name = $crc32B,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0xffffffff'u32,
      refin = false,
      refout = false,
      xorout = 0xffffffff'u32,
      check = 0xfc891918'u32
    ),
  crc32Base91C:
    initCrcSpec(
      name = $crc32Base91C,
      size = 32,
      poly = 0x1edc6f41'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffffffff'u32,
      check = 0xe3069283'u32
    ),
  crc32Base91D:
    initCrcSpec(
      name = $crc32Base91D,
      size = 32,
      poly = 0xa833982b'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffffffff'u32,
      check = 0x87315576'u32
    ),
  crc32Bzip2:
    initCrcSpec(
      name = $crc32Bzip2,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0xffffffff'u32,
      refin = false,
      refout = false,
      xorout = 0xffffffff'u32,
      check = 0xfc891918'u32
    ),
  crc32C:
    initCrcSpec(
      name = $crc32C,
      size = 32,
      poly = 0x1edc6f41'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffffffff'u32,
      check = 0xe3069283'u32
    ),
  crc32Castagnoli:
    initCrcSpec(
      name = $crc32Castagnoli,
      size = 32,
      poly = 0x1edc6f41'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffffffff'u32,
      check = 0xe3069283'u32
    ),
  crc32CdRomEdc:
    initCrcSpec(
      name = $crc32CdRomEdc,
      size = 32,
      poly = 0x8001801b'u32,
      init = 0x00000000'u32,
      refin = true,
      refout = true,
      xorout = 0x00000000'u32,
      check = 0x6ec2edc4'u32
    ),
  crc32Cksum:
    initCrcSpec(
      name = $crc32Cksum,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0x00000000'u32,
      refin = false,
      refout = false,
      xorout = 0xffffffff'u32,
      check = 0x765e7680'u32
    ),
  crc32D:
    initCrcSpec(
      name = $crc32D,
      size = 32,
      poly = 0xa833982b'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffffffff'u32,
      check = 0x87315576'u32
    ),
  crc32DectB:
    initCrcSpec(
      name = $crc32DectB,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0xffffffff'u32,
      refin = false,
      refout = false,
      xorout = 0xffffffff'u32,
      check = 0xfc891918'u32
    ),
  crc32Interlaken:
    initCrcSpec(
      name = $crc32Interlaken,
      size = 32,
      poly = 0x1edc6f41'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffffffff'u32,
      check = 0xe3069283'u32
    ),
  crc32Iscsi:
    initCrcSpec(
      name = $crc32Iscsi,
      size = 32,
      poly = 0x1edc6f41'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffffffff'u32,
      check = 0xe3069283'u32
    ),
  crc32IsoHdlc:
    initCrcSpec(
      name = $crc32IsoHdlc,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffffffff'u32,
      check = 0xcbf43926'u32
    ),
  crc32Jamcrc:
    initCrcSpec(
      name = $crc32Jamcrc,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0x00000000'u32,
      check = 0x340bc6d9'u32
    ),
  crc32Mpeg2:
    initCrcSpec(
      name = $crc32Mpeg2,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0xffffffff'u32,
      refin = false,
      refout = false,
      xorout = 0x00000000'u32,
      check = 0x0376e6e7'u32
    ),
  crc32Pkzip:
    initCrcSpec(
      name = $crc32Pkzip,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffffffff'u32,
      check = 0xcbf43926'u32
    ),
  crc32Posix:
    initCrcSpec(
      name = $crc32Posix,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0x00000000'u32,
      refin = false,
      refout = false,
      xorout = 0xffffffff'u32,
      check = 0x765e7680'u32
    ),
  crc32Q:
    initCrcSpec(
      name = $crc32Q,
      size = 32,
      poly = 0x814141ab'u32,
      init = 0x00000000'u32,
      refin = false,
      refout = false,
      xorout = 0x00000000'u32,
      check = 0x3010bf7f'u32
    ),
  crc32V42:
    initCrcSpec(
      name = $crc32V42,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffffffff'u32,
      check = 0xcbf43926'u32
    ),
  crc32Xfer:
    initCrcSpec(
      name = $crc32Xfer,
      size = 32,
      poly = 0x000000af'u32,
      init = 0x00000000'u32,
      refin = false,
      refout = false,
      xorout = 0x00000000'u32,
      check = 0xbd0be338'u32
    ),
  crc32Xz:
    initCrcSpec(
      name = $crc32Xz,
      size = 32,
      poly = 0x04c11db7'u32,
      init = 0xffffffff'u32,
      refin = true,
      refout = true,
      xorout = 0xffffffff'u32,
      check = 0xcbf43926'u32
  )
]

#----------------------------------- Public -----------------------------------#

func takeCrcSpec*(kind: Crc8Kind): CrcSpec  {.inline.} =
  Crc8List[kind]

func takeCrcSpec*(kind: Crc16Kind): CrcSpec {.inline.}  =
  Crc16List[kind]

func takeCrcSpec*(kind: Crc32Kind): CrcSpec {.inline.}  =
  Crc32List[kind]
