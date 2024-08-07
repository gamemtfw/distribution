# SPDX-License-Identifier: GPL-2.0-or-later

PKG_NAME="thememaster"
PKG_VERSION="428d44b33d8a41c782038eebc4dc2212f9576125"
PKG_ARCH="any"
PKG_LICENSE="CUSTOM"
PKG_SITE="https://github.com/JohnIrvine1433/ThemeMaster"
PKG_URL="${PKG_SITE}.git"
GET_HANDLER_SUPPORT="git"
PKG_SHORTDESC="Theme Master"
PKG_LONGDESC="Manage your themes on your device"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/ThemeMaster
  cp -rf ThemeMaster/* ${INSTALL}/usr/share/ThemeMaster/
  mkdir -p ${INSTALL}/usr/config/modules/
  cp ThemeMaster.sh ${INSTALL}/usr/config/modules/
}
