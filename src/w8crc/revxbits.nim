func rev8b*(b: uint8): uint8 =
  result = (b      and 0xF0'u8) shr 4 or (b      and 0xF'u8) shl 4
  result = (result and 0xCC'u8) shr 2 or (result and 0x33'u8) shl 2
  result = (result and 0xAA'u8) shr 1 or (result and 0x55'u8) shl 1

func rev8b*(b: uint32): uint32 =
  result = (b      and 0xF0'u32) shr 4 or (b      and 0xF'u32) shl 4
  result = (result and 0xCC'u32) shr 2 or (result and 0x33'u32) shl 2
  result = (result and 0xAA'u32) shr 1 or (result and 0x55'u32) shl 1

func rev16b*(b: uint16): uint16 =
  result = (b      and 0xFF00'u16) shr 8 or (b      and 0xFF'u16) shl 8
  result = (result and 0xF0F0'u16) shr 4 or (result and 0xF0F'u16) shl 4
  result = (result and 0xCCCC'u16) shr 2 or (result and 0x3333'u16) shl 2
  result = (result and 0xAAAA'u16) shr 1 or (result and 0x5555'u16) shl 1

func rev16b*(b: uint32): uint32 =
  result = (b      and 0xFF00'u32) shr 8 or (b      and 0xFF'u32) shl 8
  result = (result and 0xF0F0'u32) shr 4 or (result and 0xF0F'u32) shl 4
  result = (result and 0xCCCC'u32) shr 2 or (result and 0x3333'u32) shl 2
  result = (result and 0xAAAA'u32) shr 1 or (result and 0x5555'u32) shl 1

func rev32b*(b: uint32): uint32 =
  result = (b      and 0xFFFF0000'u32) shr 16 or (b      and 0xFFFF'u32) shl 16
  result = (result and 0xFF00FF00'u32) shr 8  or (result and 0xFF00FF'u32) shl 8
  result = (result and 0xF0F0F0F0'u32) shr 4  or (result and 0xF0F0F0F'u32) shl 4
  result = (result and 0xCCCCCCCC'u32) shr 2  or (result and 0x33333333'u32) shl 2
  result = (result and 0xAAAAAAAA'u32) shr 1  or (result and 0x55555555'u32) shl 1

func revXb*(b: uint32, len: int): uint32 =
  var btmp = b
  for i in countdown(len - 1, 0):
    result = result or (btmp and 1) shl i
    btmp = btmp shr 1
