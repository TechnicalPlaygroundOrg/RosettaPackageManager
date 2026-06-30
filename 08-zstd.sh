#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.8  -  Zstd-1.5.7
# Auto-generated from chapter08/zstd.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="zstd-1.5.7.tar.gz"

cd "$SRC"
echo ">>> Building Zstd-1.5.7 from $TARBALL"
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
make prefix=/usr

# ----- test suite (optional, slow) -- uncomment to run -----
# make check

make prefix=/usr install

rm -v /usr/lib/libzstd.a
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: Zstd-1.5.7"
