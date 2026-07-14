#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.81  -  E2fsprogs-1.47.3
# Auto-generated from chapter08/e2fsprogs.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="wget2-2.2.1.tar.gz"

cd "$SRC"
echo ">>> Building wget2-2.2.1.tar.gz from $TARBALL"
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

../configure --prefix=/usr       \

make

make install

echo ">>> Linking to wget"

ln -sv /usr/bin/wget2 /usr/bin/wget

echo ">>> Done: wget2-2.2.1.tar.gz" 

rm -rf wget2-2.2.1
