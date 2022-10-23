import t0bitwise_crckind
import t0bitwise_crcspec

import t1lut_crckind
import t1lut_crcspec

import tcheckautoval
import tfromfile_vs_lut
import tlut_balance

when defined(c):
  echo "C backend tests passed successfully ✅"
when defined(cpp):
  echo "C++ backend tests passed successfully ✅"
