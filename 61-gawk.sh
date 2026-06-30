#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.61  -  Gawk-5.3.2
# Auto-generated from chapter08/gawk.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="gawk-5.3.2.tar.xz"

cd "$SRC"
echo ">>> Building Gawk-5.3.2 from $TARBALL"
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
sed -i 's/extras//' Makefile.in

./configure --prefix=/usr

make

# ----- test suite (optional, slow) -- uncomment to run -----
# chown -R tester .
# su tester -c "PATH=$PATH make check"

rm -f /usr/bin/gawk-5.3.2
make install

ln -sv gawk.1 /usr/share/man/man1/awk.1

install -vDm644 doc/{awkforai.txt,*.{eps,pdf,jpg}} -t /usr/share/doc/gawk-5.3.2
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: Gawk-5.3.2"
