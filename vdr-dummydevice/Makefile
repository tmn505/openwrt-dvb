#
# Copyright (C) 2017-2018 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-dummydevice
PKG_VERSION := 2.0.0
PKG_RELEASE := 2

PKG_BUILD_DIR := $(BUILD_DIR)/dummydevice-$(PKG_VERSION)
PKG_SOURCE := $(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL := http://phivdr.dyndns.org/vdr/vdr-dummydevice
PKG_HASH := 5c0049824415bd463d3abc728a3136ee064b60a37b5d3a1986cf282b0d757085

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILE := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

include $(INCLUDE_DIR)/package.mk

define Package/vdr-dummydevice
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR dummy output device
  DEPENDS := vdr
  URL := http://phivdr.dyndns.org/vdr/vdr-dummydevice
endef

define Package/vdr-dummydevice/description
 VDR dummy output device plugin.
endef

define Package/vdr-dummydevice/install
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install-lib

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [dummydevice] > $(1)/etc/vdr/conf.d/10-dummydevice.conf
endef

$(eval $(call BuildPackage,vdr-dummydevice))
