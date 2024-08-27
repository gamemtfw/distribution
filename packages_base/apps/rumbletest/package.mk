# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present 351ELEC (https://github.com/351elec)
# Copyright (C) 2023 JELOS (https://github.com/JustEnoughLinuxOS)

PKG_NAME="rumbletest"
PKG_VERSION="a1111a94db673d0ccb159302f90fd6eafaa5ca07"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/brettchalupa/sdl_rumble"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="toolchain SDL2"
PKG_PRIORITY="optional"
PKG_SECTION="tools"
PKG_TOOLCHAIN="manual"
PKG_SHORTDESC="A Single panel file Manager."
PKG_PATCH_DIRS="${DEVICE}"

make_target() {
  MAKEDEVICE=$(echo ${DEVICE^^} | sed "s#-#_##g")
  make DEVICE=${MAKEDEVICE^^} SDL2_CONFIG=${SYSROOT_PREFIX}/usr/bin/sdl2-config CC=${CXX}
}

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/bin
  cp rumbletest ${INSTALL}/usr/bin/
  chmod 0755 ${INSTALL}/usr/bin/rumbletest
}
