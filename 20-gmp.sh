#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.20  -  GMP-6.3.0
# Auto-generated from chapter08/gmp.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="gmp-6.3.0.tar.xz"

cd "$SRC"
echo ">>> Building GMP-6.3.0 from $TARBALL"
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
ABI=32 ./configure ...

sed -i '/long long t1;/,+1s/()/(...)/' configure

./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.3.0

make
make html

# ----- test suite (optional, slow) -- uncomment to run -----
# make check 2>&1 | tee gmp-check-log

# ----- test suite (optional, slow) -- uncomment to run -----
# awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log

make install
make install-html
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: GMP-6.3.0"
