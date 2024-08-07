# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present 351ELEC (https://github.com/351elec)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="fileman"
PKG_VERSION="c1465eacbb0f3bfbdb5538ab1ca3cc2ff04c76a1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/ohmylittlev/fileman"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain SDL2 SDL2_image SDL2_gfx SDL2_ttf"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_SHORTDESC="A Single panel file Manager."
PKG_PATCH_DIRS="${DEVICE}"

make_target() {
  MAKEDEVICE=$(echo ${DEVICE^^} | sed "s#-#_##g")
  make DEVICE=${MAKEDEVICE^^} RES_PATH=/usr/share/fileman/res START_PATH=/storage/roms I18N_PATH=/usr/share/fileman/lang SDL2_CONFIG=${SYSROOT_PREFIX}/usr/bin/sdl2-config CC=${CXX}
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  mkdir -p ${INSTALL}/usr/share/fileman
  cp fileman ${INSTALL}/usr/bin/
  cp -rf res ${INSTALL}/usr/share/fileman/
  chmod 0755 ${INSTALL}/usr/bin/fileman
  mkdir -p ${INSTALL}/usr/share/fileman/lang/zh_CN/LC_MESSAGES
  cp po/zh/fileman.mo ${INSTALL}/usr/share/fileman/lang/zh_CN/LC_MESSAGES/fileman.mo
}
