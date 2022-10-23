# Package

version       = "1.2.0"
author        = "Maxim Cege (Цеге Максим)"
description   = "Full-featured CRC library for Nim."
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.0.0"

proc cleandir() =
  when (NimMajor, NimMinor, NimPatch) >= (1, 4, 0):
    exec "nim r --hints:off tests/cleandir"

task test, "❌":
  echo "Use test_branched or test_branchfree instead."

task test_branched, "Run all tests":
  exec "nim c   -f --hints:off --run tests/tester"
  exec "nim cpp -f --hints:off --run tests/tester"
  exec "nim js  -f --hints:off --run tests/testerjs"
  cleandir()

task test_branchfree, "Run all tests -d:useBranchFree64 (x64 required)":
  exec "nim c   -f --hints:off --run -d:useBranchFree64 tests/tester"
  exec "nim cpp -f --hints:off --run -d:useBranchFree64 tests/tester"
  exec "nim js  -f --hints:off --run -d:useBranchFree64 tests/testerjs"
  cleandir()

task test_c_values, "Run C tests and print result to stdout (x64 required)":
  exec "nim c -f --hints:off --run -d:debugResult tests/tester"
  cleandir()

task test_cpp_values, "Run C++ tests and print result to stdout (x64 required)":
  exec "nim cpp -f --hints:off --run -d:debugResult tests/tester"
  cleandir()

task test_js_values, "Run Js tests and print result to stdout (x64 required)":
  exec "nim js -f --hints:off --run -d:debugResult tests/testerjs"
  cleandir()
