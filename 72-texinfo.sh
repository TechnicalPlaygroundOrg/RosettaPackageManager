#!/bin/bash
# LFS 13.0-systemd  -  Chapter 8.72  -  Texinfo-7.2
# Auto-generated from chapter08/texinfo.html.  Run inside the chroot.
# Test-suite steps are commented out; uncomment to run them.
set -e

SRC="${SRC:-/sources}"
TARBALL="texinfo-7.2.tar.xz"

cd "$SRC"
echo ">>> Building Texinfo-7.2 from $TARBALL"
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
sed 's/! $output_file eq/$output_file ne/' -i tp/Texinfo/Convert/*.pm

./configure --prefix=/usr

make

# ----- test suite (optional, slow) -- uncomment to run -----
# make check

make install

make TEXMF=/usr/share/texmf install-tex

pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2>/dev/null
  done
popd
# ----- end LFS book commands -----

cd "$SRC"
rm -rf "${SRC:?}/${__srcdir:?}"
echo ">>> Done: Texinfo-7.2"
