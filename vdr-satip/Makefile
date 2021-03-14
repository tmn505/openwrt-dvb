#
# Copyright (C) 2017-2018 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-satip
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/rofafor/vdr-plugin-satip.git
PKG_MIRROR_HASH := a076c0d26a42cdd19666168f945d4fac477051cbe6dc0a1383eb2f76dd6de6f5
PKG_SOURCE_VERSION := 299296bbb1a7274e7c67abee64a6edc24bf965bc
PKG_VERSION := 2.4.0

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILE := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

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

TARGET_CXXFLAGS+= -std=gnu++98

# rework because dep of w-scan-cpp
#define Build/InstallDev
#	$(INSTALL_DIR) $(1)/usr/include/vdr/PLUGIN/satip
#	$(CP) $(PKG_BUILD_DIR)/satip.h $(1)/usr/include/vdr/PLUGIN/satip/
#endef

define Package/vdr-satip/install
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install-lib install-conf

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [satip] > $(1)/etc/vdr/conf.d/30-satip.conf
endef

$(eval $(call BuildPackage,vdr-satip))
