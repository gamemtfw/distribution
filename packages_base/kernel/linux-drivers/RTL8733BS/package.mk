# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8733BS"
PKG_VERSION="872701dd7738a81fce71509a9b8c86b54af2f80f"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/modtestgmt/rtl8733bs"
PKG_URL="https://github.com/modtestgmt/rtl8733bs.git"
PKG_DEPENDS_TARGET="toolchain linux kernel-firmware"
PKG_NEED_UNPACK="${LINUX_DEPENDS}"
PKG_LONGDESC="Realtek RTL8733BS Linux driver"
PKG_IS_KERNEL_PKG="yes"
PKG_TOOLCHAIN="make"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make modules \
       ARCH=${TARGET_KERNEL_ARCH} \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=${TARGET_KERNEL_PREFIX} \
       CONFIG_POWER_SAVING=y
}

makeinstall_target() {
  mkdir -p ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
    cp *.ko ${INSTALL}/$(get_full_module_dir)/${PKG_NAME}
}
