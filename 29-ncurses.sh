#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.29  -  Ncurses-6.6
# Auto-generated from chapter08/ncurses.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="ncurses-6.6.tar.gz"

cd "$SRC"
echo ">>> Building Ncurses-6.6 from $TARBALL"
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
./configure --prefix=/usr           \
            --mandir=/usr/share/man \
            --with-shared           \
            --without-debug         \
            --without-normal        \
            --with-cxx-shared       \
            --enable-pc-files       \
            --with-pkg-config-libdir=/usr/lib/pkgconfig

make

make DESTDIR=$PWD/dest install
sed -e 's/^#if.*XOPEN.*$/#if 1/' \
    -i dest/usr/include/curses.h
cp --remove-destination -av dest/* /

for lib in ncurses form panel menu ; do
    ln -sfv lib${lib}w.so /usr/lib/lib${lib}.so
    ln -sfv ${lib}w.pc    /usr/lib/pkgconfig/${lib}.pc
done

ln -sfv libncursesw.so /usr/lib/libcurses.so

cp -v -R doc -T /usr/share/doc/ncurses-6.6

make distclean
./configure --prefix=/usr    \
            --with-shared    \
            --without-normal \
            --without-debug  \
            --without-cxx-binding \
            --with-abi-version=5
make sources libs
cp -av lib/lib*.so.5* /usr/lib
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: Ncurses-6.6"
