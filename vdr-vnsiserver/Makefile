# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2017-2022 Tomasz Maciej Nowak <tmn505@gmail.com>
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-vnsiserver
PKG_VERSION := 1.8.1
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/vdr-projects/vdr-plugin-vnsiserver.git
PKG_SOURCE_VERSION := 9694587c5149242c8ec03aa938d389789803904f
PKG_MIRROR_HASH := 6a6148321d30705f142983f1310d2e3a0c8ae569cd130380e4fb5900f71c21ef

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILES := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tmn505@gmail.com>

PKG_BUILD_PARALLEL := 1

include $(INCLUDE_DIR)/package.mk

define Package/vdr-vnsiserver
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR plugin to handle KODI clients
  URL := https://github.com/vdr-projects/vdr-plugin-vnsiserver
  DEPENDS := vdr
endef

define Package/vdr-vnsiserver/description
 The vdr-plugin-vnsiserver is able to handle serveral KODI clients connecting
 via the VNSI addon.
endef

define Build/Configure
	$(SED) '/^PKGCFG =/c PKGCFG = $$$$(shell pkg-config --variable=$$$$(1) $$$$(STAGING_DIR)/usr/lib/pkgconfig/vdr.pc)' $(PKG_BUILD_DIR)/Makefile
endef

define Package/vdr-vnsiserver/install
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install-lib

	$(INSTALL_DIR) $(1)/etc/vdr/plugins/vnsiserver
	$(CP) $(PKG_BUILD_DIR)/vnsiserver/* $(1)/etc/vdr/plugins/vnsiserver/

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [vnsiserver] > $(1)/etc/vdr/conf.d/70-vnsiserver.conf
endef

$(eval $(call BuildPackage,vdr-vnsiserver))
