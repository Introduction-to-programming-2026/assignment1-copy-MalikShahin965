#!/usr/bin/env bash
set -euo pipefail

CC="${CC:-clang}"
CFLAGS="-std=c11 -Wall -Wextra -Werror"

echo "Compiling..."
for f in buggy0.c buggy1.c buggy2.c buggy3.c buggy4.c buggy5.c; do
  echo "  -> $f"
  $CC $CFLAGS "$f" -o "${f%.c}" || {
    echo ""
    echo "❌ Compile failed for $f"
    exit 1
  }
done

echo ""
echo "✅ All files compile."
echo "Now run each executable to verify output:"
run:./test.sh
