# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present 351ELEC (https://github.com/351elec)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="bypy"
PKG_VERSION="b30e9e0d356dbc842b575efe737463b2f48d3f4a"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/houtianze/bypy"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain Python3 requests requests-toolbelt multiprocess segno"
PKG_SHORTDESC="A baidu netdisk python client"
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
	mkdir -p ${INSTALL}/usr/bin/
	cp baidupan_backup ${INSTALL}/usr/bin/
	cp baidupan_download ${INSTALL}/usr/bin/
	cp baidupanauth ${INSTALL}/usr/bin/
	chmod 0755 ${INSTALL}/usr/bin/*
	mkdir -p ${INSTALL}/usr/config/modules
	ln -sf /usr/bin/baidupan_backup ${INSTALL}/usr/config/modules/baidupan_backup.sh
	ln -sf /usr/bin/baidupan_download ${INSTALL}/usr/config/modules/baidupan_download.sh
}
