#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.35  -  Bash-5.3
# Auto-generated from chapter08/bash.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="bash-5.3.tar.gz"

cd "$SRC"
echo ">>> Building Bash-5.3 from $TARBALL"
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
./configure --prefix=/usr             \
            --without-bash-malloc     \
            --with-installed-readline \
            --docdir=/usr/share/doc/bash-5.3

make

# ----- test suite (optional, slow) -- uncomment to run -----
# chown -R tester .

# ----- test suite (optional, slow) -- uncomment to run -----
# LC_ALL=C.UTF-8 su -s /usr/bin/expect tester << "EOF"
# set timeout -1
# spawn make tests
# expect eof
# lassign [wait] _ _ _ value
# exit $value
# EOF

make install

# exec /usr/bin/bash --login
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: Bash-5.3"
