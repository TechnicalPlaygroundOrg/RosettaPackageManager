#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.77  -  D-Bus-1.16.2
# Auto-generated from chapter08/dbus.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="dbus-1.16.2.tar.xz"

cd "$SRC"
echo ">>> Building D-Bus-1.16.2 from $TARBALL"
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
mkdir build
cd    build

meson setup --prefix=/usr --buildtype=release --wrap-mode=nofallback ..

ninja

# ----- test suite (optional, slow) -- uncomment to run -----
# ninja test

ninja install

ln -sfv /etc/machine-id /var/lib/dbus
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: D-Bus-1.16.2"
