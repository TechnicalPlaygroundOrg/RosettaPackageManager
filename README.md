# Rosetta Package Build Scripts

Using LFS 13.0 as the base

One bash script per package, in build order, generated from the book HTML.

## Usage (inside the chroot)

```bash
export SRC=/sources   # where your tarballs live (default /sources)
./00-build-all.sh     # run everything in order, OR
./03-glibc.sh         # run a single package
```

## What each script does

1. `cd $SRC` and extract the package tarball
2. `cd` into the unpacked source dir (auto-detected from the tarball)
3. Run the exact configure/make/install commands from the book
4. `cd $SRC` and `rm -rf` the source dir

Test suites (`make check`, `su tester ...`) are present but commented out.

## Manifest

- `01-man-pages.sh` - Man-pages-6.17 (man-pages-6.17.tar.xz)
- `02-iana-etc.sh` - Iana-Etc-20260202 (iana-etc-20260202.tar.gz)
- `03-glibc.sh` - Glibc-2.43 (glibc-2.43.tar.xz)
- `04-zlib.sh` - Zlib-1.3.2 (zlib-1.3.2.tar.gz)
- `05-bzip2.sh` - Bzip2-1.0.8 (bzip2-1.0.8.tar.gz)
- `06-xz.sh` - Xz-5.8.2 (xz-5.8.2.tar.xz)
- `07-lz4.sh` - Lz4-1.10.0 (lz4-1.10.0.tar.gz)
- `08-zstd.sh` - Zstd-1.5.7 (zstd-1.5.7.tar.gz)
- `09-file.sh` - File-5.46 (file-5.46.tar.gz)
- `10-readline.sh` - Readline-8.3 (readline-8.3.tar.gz)
- `11-pcre2.sh` - Pcre2-10.47 (pcre2-10.47.tar.bz2)
- `12-m4.sh` - M4-1.4.21 (m4-1.4.21.tar.xz)
- `13-bc.sh` - Bc-7.0.3 (bc-7.0.3.tar.xz)
- `14-flex.sh` - Flex-2.6.4 (flex-2.6.4.tar.gz)
- `15-tcl.sh` - Tcl-8.6.17 (tcl8.6.17-src.tar.gz)
- `16-expect.sh` - Expect-5.45.4 (expect5.45.4.tar.gz)
- `17-dejagnu.sh` - DejaGNU-1.6.3 (dejagnu-1.6.3.tar.gz)
- `18-pkgconf.sh` - Pkgconf-2.5.1 (pkgconf-2.5.1.tar.xz)
- `19-binutils.sh` - Binutils-2.46.0 (binutils-2.46.0.tar.xz)
- `20-gmp.sh` - GMP-6.3.0 (gmp-6.3.0.tar.xz)
- `21-mpfr.sh` - MPFR-4.2.2 (mpfr-4.2.2.tar.xz)
- `22-mpc.sh` - MPC-1.3.1 (mpc-1.3.1.tar.gz)
- `23-attr.sh` - Attr-2.5.2 (attr-2.5.2.tar.gz)
- `24-acl.sh` - Acl-2.3.2 (acl-2.3.2.tar.xz)
- `25-libcap.sh` - Libcap-2.77 (libcap-2.77.tar.xz)
- `26-libxcrypt.sh` - Libxcrypt-4.5.2 (libxcrypt-4.5.2.tar.xz)
- `27-shadow.sh` - Shadow-4.19.3 (shadow-4.19.3.tar.xz)
- `28-gcc.sh` - GCC-15.2.0 (gcc-15.2.0.tar.xz)
- `29-ncurses.sh` - Ncurses-6.6 (ncurses-6.6.tar.gz)
- `30-sed.sh` - Sed-4.9 (sed-4.9.tar.xz)
- `31-psmisc.sh` - Psmisc-23.7 (psmisc-23.7.tar.xz)
- `32-gettext.sh` - Gettext-1.0 (gettext-1.0.tar.xz)
- `33-bison.sh` - Bison-3.8.2 (bison-3.8.2.tar.xz)
- `34-grep.sh` - Grep-3.12 (grep-3.12.tar.xz)
- `35-bash.sh` - Bash-5.3 (bash-5.3.tar.gz)
- `36-libtool.sh` - Libtool-2.5.4 (libtool-2.5.4.tar.xz)
- `37-gdbm.sh` - GDBM-1.26 (gdbm-1.26.tar.gz)
- `38-gperf.sh` - Gperf-3.3 (gperf-3.3.tar.gz)
- `39-expat.sh` - Expat-2.7.4 (expat-2.7.4.tar.xz)
- `40-inetutils.sh` - Inetutils-2.7 (inetutils-2.7.tar.gz)
- `41-less.sh` - Less-692 (less-692.tar.gz)
- `42-perl.sh` - Perl-5.42.0 (perl-5.42.0.tar.xz)
- `43-xml-parser.sh` - XML-Parser-2.47 (XML-Parser-2.47.tar.gz)
- `44-intltool.sh` - Intltool-0.51.0 (intltool-0.51.0.tar.gz)
- `45-autoconf.sh` - Autoconf-2.72 (autoconf-2.72.tar.xz)
- `46-automake.sh` - Automake-1.18.1 (automake-1.18.1.tar.xz)
- `47-openssl.sh` - OpenSSL-3.6.1 (openssl-3.6.1.tar.gz)
- `48-libelf.sh` - Libelf-0.194 (elfutils-0.194.tar.bz2)
- `49-libffi.sh` - Libffi-3.5.2 (libffi-3.5.2.tar.gz)
- `50-sqlite.sh` - Sqlite-3510200 (sqlite-autoconf-3510200.tar.gz)
- `51-Python.sh` - Python-3.14.3 (Python-3.14.3.tar.xz)
- `52-flit-core.sh` - Flit-Core-3.12.0 (flit_core-3.12.0.tar.gz)
- `53-packaging.sh` - Packaging-26.0 (packaging-26.0.tar.gz)
- `54-wheel.sh` - Wheel-0.46.3 (wheel-0.46.3.tar.gz)
- `55-setuptools.sh` - Setuptools-82.0.0 (setuptools-82.0.0.tar.gz)
- `56-ninja.sh` - Ninja-1.13.2 (ninja-1.13.2.tar.gz)
- `57-meson.sh` - Meson-1.10.1 (meson-1.10.1.tar.gz)
- `58-kmod.sh` - Kmod-34.2 (kmod-34.2.tar.xz)
- `59-coreutils.sh` - Coreutils-9.10 (coreutils-9.10.tar.xz)
- `60-diffutils.sh` - Diffutils-3.12 (diffutils-3.12.tar.xz)
- `61-gawk.sh` - Gawk-5.3.2 (gawk-5.3.2.tar.xz)
- `62-findutils.sh` - Findutils-4.10.0 (findutils-4.10.0.tar.xz)
- `63-groff.sh` - Groff-1.23.0 (groff-1.23.0.tar.gz)
- `64-grub.sh` - GRUB-2.14 (grub-2.14.tar.xz)
- `65-gzip.sh` - Gzip-1.14 (gzip-1.14.tar.xz)
- `66-iproute2.sh` - IPRoute2-6.18.0 (iproute2-6.18.0.tar.xz)
- `67-kbd.sh` - Kbd-2.9.0 (kbd-2.9.0.tar.xz)
- `68-libpipeline.sh` - Libpipeline-1.5.8 (libpipeline-1.5.8.tar.gz)
- `69-make.sh` - Make-4.4.1 (make-4.4.1.tar.gz)
- `70-patch.sh` - Patch-2.8 (patch-2.8.tar.xz)
- `71-tar.sh` - Tar-1.35 (tar-1.35.tar.xz)
- `72-texinfo.sh` - Texinfo-7.2 (texinfo-7.2.tar.xz)
- `73-vim.sh` - Vim-9.2.0078 (vim-9.2.0078.tar.gz)
- `74-markupsafe.sh` - MarkupSafe-3.0.3 (markupsafe-3.0.3.tar.gz)
- `75-jinja2.sh` - Jinja2-3.1.6 (jinja2-3.1.6.tar.gz)
- `76-systemd.sh` - Systemd-259.1 (systemd-259.1.tar.gz)
- `77-dbus.sh` - D-Bus-1.16.2 (dbus-1.16.2.tar.xz)
- `78-man-db.sh` - Man-DB-2.13.1 (man-db-2.13.1.tar.xz)
- `79-procps-ng.sh` - Procps-ng-4.0.6 (procps-ng-4.0.6.tar.xz)
- `80-util-linux.sh` - Util-linux-2.41.3 (util-linux-2.41.3.tar.xz)
- `81-e2fsprogs.sh` - E2fsprogs-1.47.3 (e2fsprogs-1.47.3.tar.gz)
