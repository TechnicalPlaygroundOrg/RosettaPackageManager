#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.68  -  Libpipeline-1.5.8
# Auto-generated from chapter08/libpipeline.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="libpipeline-1.5.8.tar.gz"

cd "$SRC"
echo ">>> Building Libpipeline-1.5.8 from $TARBALL"
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

make install
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: Libpipeline-1.5.8"
