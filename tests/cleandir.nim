import std/os

try:
  if fileExists("tests/tester"): removeFile "tests/tester"
  if fileExists("tests/testerjs.js"): removeFile "tests/testerjs.js"
  echo "Test dir cleanup ✅"

except Exception:
  echo "Test dir cleanup ❌"
