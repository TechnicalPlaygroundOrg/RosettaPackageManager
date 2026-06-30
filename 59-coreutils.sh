#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.59  -  Coreutils-9.10
# Auto-generated from chapter08/coreutils.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="coreutils-9.10.tar.xz"

cd "$SRC"
echo ">>> Building Coreutils-9.10 from $TARBALL"
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
patch -Np1 -i ../coreutils-9.10-i18n-1.patch

autoreconf -fv
automake -af
FORCE_UNSAFE_CONFIGURE=1 ./configure \
            --prefix=/usr

make

# ----- test suite (optional, slow) -- uncomment to run -----
# make NON_ROOT_USERNAME=tester check-root

# ----- test suite (optional, slow) -- uncomment to run -----
# groupadd -g 102 dummy -U tester

# ----- test suite (optional, slow) -- uncomment to run -----
# chown -R tester .

# ----- test suite (optional, slow) -- uncomment to run -----
# su tester -c "PATH=$PATH make -k RUN_EXPENSIVE_TESTS=yes check" \
#    < /dev/null

# ----- test suite (optional, slow) -- uncomment to run -----
# groupdel dummy

make install

mv -v /usr/bin/chroot /usr/sbin
mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8
sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: Coreutils-9.10"
