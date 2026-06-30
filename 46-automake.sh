#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.46  -  Automake-1.18.1
# Auto-generated from chapter08/automake.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="automake-1.18.1.tar.xz"

cd "$SRC"
echo ">>> Building Automake-1.18.1 from $TARBALL"
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
./configure --prefix=/usr --docdir=/usr/share/doc/automake-1.18.1

make

# ----- test suite (optional, slow) -- uncomment to run -----
# make -j$(($(nproc)>4?$(nproc):4)) check

make install
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: Automake-1.18.1"
