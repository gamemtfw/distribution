# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present 351ELEC (https://github.com/351elec)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="requests"
PKG_VERSION="147c8511ddbfa5e8f71bbf5c18ede0c4ceb3bba4"
PKG_LICENSE="Apache"
PKG_SITE="https://github.com/psf/requests"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain Python3 python-certifi urllib3 idna charset_normalizer"
PKG_SHORTDESC="A python library to send http requests"
PKG_TOOLCHAIN="manual"

pre_make_target() {
  export PYTHONXCPREFIX="${SYSROOT_PREFIX}/usr"
  export LDSHARED="${CC} -shared"
}

make_target() {
	python3 setup.py build --cross-compile
}

makeinstall_target() {
	python3 setup.py install --root=${INSTALL} --prefix=/usr
}
