#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.25  -  Libcap-2.77
# Auto-generated from chapter08/libcap.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="libcap-2.77.tar.xz"

cd "$SRC"
echo ">>> Building Libcap-2.77 from $TARBALL"
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
sed -i '/install -m.*STA/d' libcap/Makefile

make prefix=/usr lib=lib

# ----- test suite (optional, slow) -- uncomment to run -----
# make test

make prefix=/usr lib=lib install
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: Libcap-2.77"
