#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.79  -  Procps-ng-4.0.6
# Auto-generated from chapter08/procps-ng.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="procps-ng-4.0.6.tar.xz"

cd "$SRC"
echo ">>> Building Procps-ng-4.0.6 from $TARBALL"
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
./configure --prefix=/usr                           \
            --docdir=/usr/share/doc/procps-ng-4.0.6 \
            --disable-static                        \
            --disable-kill                          \
            --enable-watch8bit                      \
            --with-systemd

make

# ----- test suite (optional, slow) -- uncomment to run -----
# chown -R tester .
# su tester -c "PATH=$PATH make check"

make install
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: Procps-ng-4.0.6"
