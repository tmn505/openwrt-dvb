# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2017-2022 Tomasz Maciej Nowak <tmn505@gmail.com>
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-satip
PKG_VERSION := 2.4.1
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/rofafor/vdr-plugin-satip.git
PKG_SOURCE_VERSION := 0a216f1cf9d6401b1afbff420f4fa244ec15d299
PKG_MIRROR_HASH := 9994f79878f778c59a80c113a3caf94a362628a83e66972f1429be68e5863402

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILES := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tmn505@gmail.com>

PKG_BUILD_PARALLEL := 1

include $(INCLUDE_DIR)/package.mk

define Package/vdr-satip
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR satip frontend device
  URL := http://www.saunalahti.fi/~rahrenbe/vdr/satip
  DEPENDS := vdr +libcurl +pugixml
endef

define Package/vdr-satip/description
 VDR satip frontend device plugin.
endef

define Build/Configure
	$(SED) '/^PKGCFG =/c PKGCFG = $$$$(shell pkg-config --variable=$$$$(1) $$$$(STAGING_DIR)/usr/lib/pkgconfig/vdr.pc)' $(PKG_BUILD_DIR)/Makefile
endef

define Package/vdr-satip/install
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install-lib install-conf

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [satip] > $(1)/etc/vdr/conf.d/30-satip.conf
endef

$(eval $(call BuildPackage,vdr-satip))
