import ./w8crc/params/[crcbook, crckinds]
import ./w8crc/[
  algobitwise, algolut, checkautoval,
  crcfromfiles, crcspec, halfcrcs, initlookups,
  luttabs, revxbits
]

export
  # params
  crckinds, crcbook,
  # types
  crcspec, luttabs,
  # algos
  algobitwise, algolut,
  # utils
  checkautoval, crcfromfiles, initlookups,
  halfcrcs, revxbits
