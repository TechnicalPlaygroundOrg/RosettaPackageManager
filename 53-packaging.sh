#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.53  -  Packaging-26.0
# Auto-generated from chapter08/packaging.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="packaging-26.0.tar.gz"

cd "$SRC"
echo ">>> Building Packaging-26.0 from $TARBALL"
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
pip3 wheel -w dist --no-cache-dir --no-build-isolation --no-deps $PWD

pip3 install --no-index --find-links dist packaging
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: Packaging-26.0"
