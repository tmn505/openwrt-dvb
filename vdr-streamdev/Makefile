#
# Copyright (C) 2017 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-streamdev
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
#PKG_SOURCE_URL := https://projects.vdr-developer.org/git/vdr-plugin-streamdev.git
#PKG_SOURCE_VERSION := e2a9b979d3fb92967c7a6a8221e674eb7e55c813
PKG_SOURCE_URL := https://github.com/ciminus/vdr-plugin-streamdev.git
PKG_SOURCE_VERSION := acb1473661ef88d1283e64aa41d6cf0794a8c4d3
PKG_VERSION := 0.6.1-$(shell printf '%.8s' $(PKG_SOURCE_VERSION))

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILE := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

include $(INCLUDE_DIR)/package.mk

define Package/vdr-streamdev-client
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR streamdev client plugin
  DEPENDS := vdr
  URL := https://projects.vdr-developer.org/projects/plg-streamdev
endef

define Package/vdr-streamdev-client/description
 With the streamdev client plugin you can receive live TV streams via VTP network protocol (VDR-to-VDR).
endef

define Package/vdr-streamdev-server
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR streamdev server plugin
  DEPENDS := vdr
  URL := https://projects.vdr-developer.org/projects/plg-streamdev
endef

define Package/vdr-streamdev-server/description
 With the streamdev server plugin you can transmit live TV streams via network. Current version supports:
  VDR-to-VDR streaming for native VDR clients,
  HTTP streaming, which is particularly useful for Windows clients and clients on the Internet and
  Multicast streaming if you have many clients watching the same channels or as a feed for multicast-only settop boxes.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR)/client/po; $(TOPDIR)/package/openwrt-dvb/vdr/po2unicode.sh; \
	cd $(PKG_BUILD_DIR)/server/po; $(TOPDIR)/package/openwrt-dvb/vdr/po2unicode.sh;)
endef

define Package/vdr-streamdev-client/install
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install-client

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [streamdev-client] > $(1)/etc/vdr/conf.d/30-streamdev-client.conf
endef

define Package/vdr-streamdev-server/install
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install-server

	$(INSTALL_DIR) $(1)/etc/vdr/plugins/streamdev-server
	$(CP) $(PKG_BUILD_DIR)/streamdev-server/* $(1)/etc/vdr/plugins/streamdev-server/

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [streamdev-server] > $(1)/etc/vdr/conf.d/70-streamdev-server.conf
endef

$(eval $(call BuildPackage,vdr-streamdev-client))
$(eval $(call BuildPackage,vdr-streamdev-server))
