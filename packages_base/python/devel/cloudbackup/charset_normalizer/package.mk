# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present 351ELEC (https://github.com/351elec)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="charset_normalizer"
PKG_VERSION="79dce4857914fead2ffe55eb787cad6d5cf14643"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/Ousret/charset_normalizer"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain Python3"
PKG_SHORTDESC="charset_normalizer"
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
