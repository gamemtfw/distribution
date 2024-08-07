# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present 351ELEC (https://github.com/351elec)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="requests-toolbelt"
PKG_VERSION="c62d9774a3b1469f609bdc5a213f86c714e059bf"
PKG_LICENSE="Apache"
PKG_SITE="https://github.com/requests/toolbelt"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain Python3"
PKG_SHORTDESC="A collection of utilities for requests"
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
