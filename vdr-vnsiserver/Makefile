#
# Copyright (C) 2017-2018 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-vnsiserver
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/FernetMenta/vdr-plugin-vnsiserver.git
PKG_MIRROR_HASH := 52f975bc4e4b65aa95f6f43aeef0bd808bb44935ba0a0075bf4c5d6b4ae90a10
PKG_SOURCE_VERSION := 49003f036609ee2a0b8d819979c063d8f8d348c8
PKG_VERSION := 1.8.0

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILE := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/vdr-vnsiserver
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR plugin to handle KODI clients
  DEPENDS := vdr
  URL := https://github.com/FernetMenta/vdr-plugin-vnsiserver
endef

define Package/vdr-vnsiserver/description
 The vdr-plugin-vnsiserver is able to handle serveral KODI clients connecting
 via the VNSI addon.
endef

define Package/vdr-vnsiserver/install
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install-lib

	$(INSTALL_DIR) $(1)/etc/vdr/plugins/vnsiserver
	$(CP) $(PKG_BUILD_DIR)/vnsiserver/* $(1)/etc/vdr/plugins/vnsiserver/

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [vnsiserver] > $(1)/etc/vdr/conf.d/70-vnsiserver.conf
endef

$(eval $(call BuildPackage,vdr-vnsiserver))
