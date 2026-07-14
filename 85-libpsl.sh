#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.81  -  E2fsprogs-1.47.3
# Auto-generated from chapter08/e2fsprogs.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="libpsl-0.23.0.tar.gz"

cd "$SRC"
echo ">>> Building libpsl-0.23.0 from $TARBALL"
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

mkdir build &&
cd    build &&

meson setup --prefix=/usr --buildtype=release &&

ninja

ninja install

echo ">>> Done: $TARBALL" 

rm -rf libpsl-0.23.0
