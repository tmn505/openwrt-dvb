# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2017-2022 Tomasz Maciej Nowak <tmn505@gmail.com>
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-control
PKG_VERSION := 1.0.0
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/wirbel-at-vdr-portal/vdr-plugin-control.git
PKG_SOURCE_VERSION := 09fb0a510445041c5df875452c736816e2a1b298
PKG_MIRROR_HASH := 4174551496fc6b7337c89e03d886faea6c7e058214d42094fbf98c6043bdfe25

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILES := LICENSE

PKG_MAINTAINER := Tomasz Maciej Nowak <tmn505@gmail.com>

PKG_BUILD_PARALLEL := 1

include $(INCLUDE_DIR)/package.mk

define Package/vdr-control
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := Telnet control of a VDR
  URL := https://github.com/wirbel-at-vdr-portal/vdr-plugin-control
  DEPENDS := vdr
endef

define Package/vdr-control/description
 Control VDR OSD with telnet client.
endef

define Build/Configure
	$(SED) '/^PKGCFG =/c PKGCFG = $$$$(shell pkg-config --variable=$$$$(1) $$$$(STAGING_DIR)/usr/lib/pkgconfig/vdr.pc)' $(PKG_BUILD_DIR)/Makefile
endef

define Package/vdr-control/install
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install-lib

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [control] > $(1)/etc/vdr/conf.d/50-control.conf
	$(CP) ./files/remote.conf $(1)/etc/vdr/.
endef

$(eval $(call BuildPackage,vdr-control))
