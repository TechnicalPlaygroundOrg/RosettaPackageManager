#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.7  -  Lz4-1.10.0
# Auto-generated from chapter08/lz4.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="lz4-1.10.0.tar.gz"

cd "$SRC"
echo ">>> Building Lz4-1.10.0 from $TARBALL"
if [ ! -f "$TARBALL" ]; then
    echo "ERROR: $SRC/$TARBALL not found -- aborting (nothing removed)." >&2
    exit 1
fi
__srcdir=$(tar tf "$TARBALL" | sed 's|^\./||' | awk -F/ 'NF{print $1; exit}')
if [ -z "$__srcdir" ]; then
    echo "ERROR: could not determine source dir from $TARBALL -- aborting." >&2
    exit 1
fi
rm -rf "${SRC:?}/${__srcdir:?}"
tar xf "$TARBALL"
cd "${SRC:?}/${__srcdir:?}"

# ----- begin LFS book commands -----
make BUILD_STATIC=no PREFIX=/usr

# ----- test suite (optional, slow) -- uncomment to run -----
# make -j1 check

make BUILD_STATIC=no PREFIX=/usr install
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: Lz4-1.10.0"
