#
# Copyright (C) 2017 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-dvbapi
PKG_VERSION := 2.2.4
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/manio/vdr-plugin-dvbapi.git
PKG_SOURCE_VERSION := d7c75875430dfdee84b04a87ad15cca0410df40b

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILE := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

include $(INCLUDE_DIR)/package.mk

define Package/vdr-dvbapi
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR dvbapi bridge to OSCam
  DEPENDS := vdr +libdvbcsa +libopenssl
  URL := https://github.com/manio/vdr-plugin-dvbapi
endef

define Package/vdr-dvbapi/description
 VDR dvbapi plugin for use with OSCam.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR)/po; $(TOPDIR)/package/media_feed/vdr/po2unicode.sh;)
endef

MAKE_FLAGS += LIBDVBCSA=1

define Package/vdr-dvbapi/install
	$(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) DESTDIR=$(1) install

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [dvbapi] > $(1)/etc/vdr/conf.d/20-dvbapi.conf
endef

$(eval $(call BuildPackage,vdr-dvbapi))
