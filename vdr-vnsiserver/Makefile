#
# Copyright (C) 2017 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-vnsiserver
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/FernetMenta/vdr-plugin-vnsiserver.git
PKG_SOURCE_VERSION := 1fd5aeee87e0cd27ba6b7860d86efc57c2863fcb
PKG_VERSION := 1.5.2-$(shell printf '%.8s' $(PKG_SOURCE_VERSION))

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILE := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

include $(INCLUDE_DIR)/package.mk

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

define Build/Configure
	(cd $(PKG_BUILD_DIR)/po; $(TOPDIR)/package/openwrt-dvb/vdr/po2unicode.sh;)
endef

define Package/vdr-vnsiserver/install
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install

	$(INSTALL_DIR) $(1)/etc/vdr/plugins/vnsiserver
	$(CP) $(PKG_BUILD_DIR)/vnsiserver/* $(1)/etc/vdr/plugins/vnsiserver/

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [vnsiserver] > $(1)/etc/vdr/conf.d/70-vnsiserver.conf
endef

$(eval $(call BuildPackage,vdr-vnsiserver))
