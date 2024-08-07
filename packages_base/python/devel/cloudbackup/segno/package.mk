# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present 351ELEC (https://github.com/351elec)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="segno"
PKG_VERSION="f9617fc8b5024c03cc4f7d4a50af8ca51a4c03d8"
PKG_LICENSE="OSI"
PKG_SITE="https://github.com/heuer/segno"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain Python3"
PKG_SHORTDESC="segno"
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
