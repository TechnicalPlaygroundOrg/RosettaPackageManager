#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.60  -  Diffutils-3.12
# Auto-generated from chapter08/diffutils.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="diffutils-3.12.tar.xz"

cd "$SRC"
echo ">>> Building Diffutils-3.12 from $TARBALL"
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
./configure --prefix=/usr

make

# ----- test suite (optional, slow) -- uncomment to run -----
# make check

make install
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: Diffutils-3.12"
