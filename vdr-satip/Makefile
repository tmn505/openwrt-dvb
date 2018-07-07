#
# Copyright (C) 2017-2018 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-satip
PKG_RELEASE := 2

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/rofafor/vdr-plugin-satip.git
PKG_SOURCE_VERSION := 28cc3cae63b48810350c98b4e3c0b580b6a153f3
PKG_VERSION := 2.2.5-$(shell printf '%.8s' $(PKG_SOURCE_VERSION))

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILE := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

include $(INCLUDE_DIR)/package.mk

define Package/vdr-satip
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR satip frontend device
  DEPENDS := vdr +libcurl +pugixml
  URL := http://www.saunalahti.fi/~rahrenbe/vdr/satip
endef

define Package/vdr-satip/description
 VDR satip frontend device plugin.
endef

define Package/vdr-satip/install
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install-lib install-conf

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [satip] > $(1)/etc/vdr/conf.d/30-satip.conf
endef

$(eval $(call BuildPackage,vdr-satip))
