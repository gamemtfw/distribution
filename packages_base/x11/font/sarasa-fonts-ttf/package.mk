# SPDX-License-Identifier: GPL-2.0-or-later

PKG_NAME="sarasa-fonts-ttf"
PKG_VERSION=""
PKG_LICENSE="OFL-1.1"
PKG_SITE="https://github.com/be5invis/Sarasa-Gothic"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain util-macros"
PKG_LONGDESC="This packages included the high-quality and open-sourced TrueType vector fonts. Including CJK characters."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p ${INSTALL}/usr/share/fonts/sarasa
  cp ${PKG_DIR}/*.ttf ${INSTALL}/usr/share/fonts/sarasa
}

post_install() {
  mkfontdir ${INSTALL}/usr/share/fonts/sarasa
  mkfontscale ${INSTALL}/usr/share/fonts/sarasa
}