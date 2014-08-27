#!/bin/sh

export DEB_BUILD_HARDENING=1

# this assumes that sqlite3 is installed to ./sqlite/install, compiled using something like this:
#./configure --disable-threadsafe --disable-dynamic-extensions --prefix=$HOME/dev/vcprompt/sqlite3/install CC='musl-gcc' CFLAGS='-static -O2 -fPIC' LDFLAGS='-static'

autoconf

./configure --with-sqlite3=sqlite3/install CC='musl-gcc' CFLAGS='-static -O2' LDFLAGS='-static'

make &&
strip --strip-all vcprompt
