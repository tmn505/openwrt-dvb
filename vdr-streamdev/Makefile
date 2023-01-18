# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2017-2022 Tomasz Maciej Nowak <tmn505@gmail.com>
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-streamdev
PKG_VERSION := 0.6.3
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/vdr-projects/vdr-plugin-streamdev.git
PKG_SOURCE_VERSION := da74779591827ad7e10493b0eade65a11c525171
PKG_MIRROR_HASH := 02e5bc30af0630696cf7a94650908c0151b75754d927747cc8af49ab5622cc5f

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILES := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tmn505@gmail.com>

PKG_BUILD_PARALLEL := 1

include $(INCLUDE_DIR)/package.mk

define Package/vdr-streamdev-client
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR streamdev client plugin
  URL := https://github.com/vdr-projects/vdr-plugin-streamdev
  DEPENDS := vdr
endef

define Package/vdr-streamdev-client/description
 With the streamdev client plugin you can receive live TV streams via VTP network protocol (VDR-to-VDR).
endef

define Package/vdr-streamdev-server
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR streamdev server plugin
  URL := https://github.com/vdr-projects/vdr-plugin-streamdev
  DEPENDS := vdr
endef

define Package/vdr-streamdev-server/description
 With the streamdev server plugin you can transmit live TV streams via network. Current version supports:
  VDR-to-VDR streaming for native VDR clients,
  HTTP streaming, which is particularly useful for Windows clients and clients on the Internet and
  Multicast streaming if you have many clients watching the same channels or as a feed for multicast-only settop boxes.
endef

define Build/Configure
	$(SED) '/^PKGCFG =/c PKGCFG = $$$$(shell pkg-config --variable=$$$$(1) $$$$(STAGING_DIR)/usr/lib/pkgconfig/vdr.pc)' \
		-e '/^LIBDIR \:=/d' \
		-e '/^LOCDIR \:=/d' \
		$(PKG_BUILD_DIR)/Makefile

	$(SED) 's,install\: install-lib install-i18n,install\: install-lib,' \
		$(PKG_BUILD_DIR)/client/Makefile
	$(SED) 's,install\: install-lib install-i18n,install\: install-lib,' \
		$(PKG_BUILD_DIR)/server/Makefile
endef

define Package/vdr-streamdev-client/install
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install-client

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [streamdev-client] > $(1)/etc/vdr/conf.d/30-streamdev-client.conf
endef

define Package/vdr-streamdev-server/install
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install-server

	$(INSTALL_DIR) $(1)/etc/vdr/plugins/streamdev-server
	$(CP) $(PKG_BUILD_DIR)/streamdev-server/. $(1)/etc/vdr/plugins/streamdev-server/.

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [streamdev-server] > $(1)/etc/vdr/conf.d/70-streamdev-server.conf
endef

$(eval $(call BuildPackage,vdr-streamdev-client))
$(eval $(call BuildPackage,vdr-streamdev-server))
