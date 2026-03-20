#!/usr/bin/env bash
set -euo pipefail

CC="${CC:-clang}"
CFLAGS="-std=c11 -Wall -Wextra -Werror"

echo "Compiling..."
for f in buggy0.c buggy1.c buggy2.c buggy3.c buggy4.c buggy5.c; do
  echo "  -> $f"
  $CC $CFLAGS "$f" -o "${f%.c}"
done

echo ""
echo "Running tests..."
for exe in buggy0 buggy1 buggy2 buggy3 buggy4 buggy5; do
  echo "  -> ./$exe"
  ./"$exe"
done

echo ""
echo "✅ All files compiled and ran."

