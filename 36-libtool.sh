#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.36  -  Libtool-2.5.4
# Auto-generated from chapter08/libtool.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="libtool-2.5.4.tar.xz"

cd "$SRC"
echo ">>> Building Libtool-2.5.4 from $TARBALL"
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

# ----- test suite (optional, slow) -- uncomment to run -----
# rm -fv /usr/lib/libltdl.a
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: Libtool-2.5.4"
