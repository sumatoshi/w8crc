{.used.}

import params/[crckinds, crcbook]
import algobitwise, crcspec

import unittest

import checkhelper

## Check bitwise branched algo with const CrcKinds!

let dstr = "123456789"

proc testlines(kind: static Crc8Kind) =
  let (res, check) = (dstr.crcBitwise(kind), kind.takeCrcSpec.check)
  printResult(kind, res, check)
  check (res xor check) == 0

proc testlines(kind: static Crc16Kind) =
  let (res, check) = (dstr.crcBitwise(kind), kind.takeCrcSpec.check)
  printResult(kind, res, check)
  check (res xor check) == 0

proc testlines(kind: static Crc32Kind) =
  let (res, check) = (dstr.crcBitwise(kind), kind.takeCrcSpec.check)
  printResult(kind, res, check)
  check (res xor check) == 0

let d8 = @[0x31'u8, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39]

proc testbytes(kind: static Crc8Kind) =
  let (res, check) = (d8.crcBitwise(kind), kind.takeCrcSpec.check)
  printResult(kind, res, check)
  check (res xor check) == 0
proc testbytes(kind: static Crc16Kind) =
  let (res, check) = (d8.crcBitwise(kind), kind.takeCrcSpec.check)
  printResult(kind, res, check)
  check (res xor check) == 0
proc testbytes(kind: static Crc32Kind) =
  let (res, check) = (d8.crcBitwise(kind), kind.takeCrcSpec.check)
  printResult(kind, res, check)
  check (res xor check) == 0

suite "crcbitwise_crckind(string)=check":

  test "crc8":
    crc8.testlines
    crc8Aes.testlines
    crc8Autosar.testlines
    crc8Bluetooth.testlines
    crc8Cdma2000.testlines
    crc8Darc.testlines
    crc8DvbS2.testlines
    crc8Ebu.testlines
    crc8GsmA.testlines
    crc8GsmB.testlines
    crc8I4321.testlines
    crc8ICode.testlines
    crc8Itu.testlines
    crc8Lte.testlines
    crc8MaximDow.testlines
    crc8MifareMad.testlines
    crc8Nrsc5.testlines
    crc8OpenSafety.testlines
    crc8Rohc.testlines
    crc8Saej1850.testlines
    crc8Smbus.testlines
    crc8Tech3250.testlines
    crc8Wcdma.testlines

  test "crc16":
    crc16.testlines
    crc16A.testlines
    crc16Acorn.testlines
    crc16Arc.testlines
    crc16AugCcitt.testlines
    crc16Autosar.testlines
    crc16B.testlines
    crc16Buypass.testlines
    crc16Ccitt.testlines
    crc16CcitFalse.testlines
    crc16CcitTrue.testlines
    crc16Cdma2000.testlines
    crc16Cms.testlines
    crc16Darc.testlines
    crc16Dds110.testlines
    crc16DectR.testlines
    crc16DectX.testlines
    crc16Dnp.testlines
    crc16En13757.testlines
    crc16Epc.testlines
    crc16GeniBus.testlines
    crc16Gsm.testlines
    crc16Ibm.testlines
    crc16Ibm3740.testlines
    crc16IbmSdlc.testlines
    crc16Icode.testlines
    crc16Iec611582.testlines
    crc16IsoHdlc.testlines
    crc16IsoIek144433A.testlines
    crc16IsoIek144433B.testlines
    crc16Kermit.testlines
    crc16Lha.testlines
    crc16Lj1200.testlines
    crc16Lte.testlines
    crc16MaximDow.testlines
    crc16Mcrf4xx.testlines
    crc16Modbus.testlines
    crc16Nrsc5.testlines
    crc16OpenSafetyA.testlines
    crc16OpenSafetyB.testlines
    crc16Profibus.testlines
    crc16R.testlines
    crc16Riello.testlines
    crc16SpiFujitsu.testlines
    crc16T10Dif.testlines
    crc16Teledisk.testlines
    crc16Tms37157.testlines
    crc16Umts.testlines
    crc16Usb.testlines
    crc16V41Lsb.testlines
    crc16V41Msb.testlines
    crc16Verifone.testlines
    crc16X.testlines
    crc16X25.testlines
    crc16Xmodem.testlines
    crc16Zmodem.testlines

  test "crc32":
    crc32.testlines
    crc32Aal5.testlines
    crc32Adccp.testlines
    crc32Aixm.testlines
    crc32Autosar.testlines
    crc32B.testlines
    crc32Base91C.testlines
    crc32Base91D.testlines
    crc32Bzip2.testlines
    crc32C.testlines
    crc32Castagnoli.testlines
    crc32CdRomEdc.testlines
    crc32Cksum.testlines
    crc32D.testlines
    crc32DectB.testlines
    crc32Interlaken.testlines
    crc32Iscsi.testlines
    crc32IsoHdlc.testlines
    crc32Jamcrc.testlines
    crc32Mpeg2.testlines
    crc32Pkzip.testlines
    crc32Posix.testlines
    crc32Q.testlines
    crc32V42.testlines
    crc32Xfer.testlines
    crc32Xz.testlines

suite "crcbitwise_crckind(byte)=check":

  test "crc8":
    crc8.testbytes
    crc8Aes.testbytes
    crc8Autosar.testbytes
    crc8Bluetooth.testbytes
    crc8Cdma2000.testbytes
    crc8Darc.testbytes
    crc8DvbS2.testbytes
    crc8Ebu.testbytes
    crc8GsmA.testbytes
    crc8GsmB.testbytes
    crc8I4321.testbytes
    crc8ICode.testbytes
    crc8Itu.testbytes
    crc8Lte.testbytes
    crc8MaximDow.testbytes
    crc8MifareMad.testbytes
    crc8Nrsc5.testbytes
    crc8OpenSafety.testbytes
    crc8Rohc.testbytes
    crc8Saej1850.testbytes
    crc8Smbus.testbytes
    crc8Tech3250.testbytes
    crc8Wcdma.testbytes

  test "crc16":
    crc16.testbytes
    crc16A.testbytes
    crc16Acorn.testbytes
    crc16Arc.testbytes
    crc16AugCcitt.testbytes
    crc16Autosar.testbytes
    crc16B.testbytes
    crc16Buypass.testbytes
    crc16Ccitt.testbytes
    crc16CcitFalse.testbytes
    crc16CcitTrue.testbytes
    crc16Cdma2000.testbytes
    crc16Cms.testbytes
    crc16Darc.testbytes
    crc16Dds110.testbytes
    crc16DectR.testbytes
    crc16DectX.testbytes
    crc16Dnp.testbytes
    crc16En13757.testbytes
    crc16Epc.testbytes
    crc16GeniBus.testbytes
    crc16Gsm.testbytes
    crc16Ibm.testbytes
    crc16Ibm3740.testbytes
    crc16IbmSdlc.testbytes
    crc16Icode.testbytes
    crc16Iec611582.testbytes
    crc16IsoHdlc.testbytes
    crc16IsoIek144433A.testbytes
    crc16IsoIek144433B.testbytes
    crc16Kermit.testbytes
    crc16Lha.testbytes
    crc16Lj1200.testbytes
    crc16Lte.testbytes
    crc16MaximDow.testbytes
    crc16Mcrf4xx.testbytes
    crc16Modbus.testbytes
    crc16Nrsc5.testbytes
    crc16OpenSafetyA.testbytes
    crc16OpenSafetyB.testbytes
    crc16Profibus.testbytes
    crc16R.testbytes
    crc16Riello.testbytes
    crc16SpiFujitsu.testbytes
    crc16T10Dif.testbytes
    crc16Teledisk.testbytes
    crc16Tms37157.testbytes
    crc16Umts.testbytes
    crc16Usb.testbytes
    crc16V41Lsb.testbytes
    crc16V41Msb.testbytes
    crc16Verifone.testbytes
    crc16X.testbytes
    crc16X25.testbytes
    crc16Xmodem.testbytes
    crc16Zmodem.testbytes

  test "crc32":
    crc32.testbytes
    crc32Aal5.testbytes
    crc32Adccp.testbytes
    crc32Aixm.testbytes
    crc32Autosar.testbytes
    crc32B.testbytes
    crc32Base91C.testbytes
    crc32Base91D.testbytes
    crc32Bzip2.testbytes
    crc32C.testbytes
    crc32Castagnoli.testbytes
    crc32CdRomEdc.testbytes
    crc32Cksum.testbytes
    crc32D.testbytes
    crc32DectB.testbytes
    crc32Interlaken.testbytes
    crc32Iscsi.testbytes
    crc32IsoHdlc.testbytes
    crc32Jamcrc.testbytes
    crc32Mpeg2.testbytes
    crc32Pkzip.testbytes
    crc32Posix.testbytes
    crc32Q.testbytes
    crc32V42.testbytes
    crc32Xfer.testbytes
    crc32Xz.testbytes
