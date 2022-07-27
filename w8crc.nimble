# Package

version       = "1.0.2"
author        = "Maxim Cege (Цеге Максим)"
description   = "Full-featured CRC library for Nim."
license       = "MIT"
srcDir        = "src"


# Dependencies

requires "nim >= 1.0.0"

task test, "❌":
  echo "Use test_branched or test_branchfree instead"

task test_branched, "Run all tests (branched)":
  exec "nim c --run tests/tester"

task test_branchfree, "Run all tests (branch free)":
  exec "nim c --run -d:useBranchFree64 tests/tester"

task test_cpp, "Run all tests (cpp)":
  exec "nim cpp --run tests/tester"

task test_js, "Run js tests":
  exec "nim c --run tests/testerjs"
