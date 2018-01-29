#
# Copyright (C) 2017 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-control
PKG_VERSION := 0.0.2a-kw3
PKG_RELEASE := 1

PKG_BUILD_DIR := $(BUILD_DIR)/control-$(PKG_VERSION)
PKG_SOURCE := $(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL := http://www.u32.de/download

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILE := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

include $(INCLUDE_DIR)/package.mk

define Package/vdr-control
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR telnet control plugin
  DEPENDS := vdr
  URL := https://www.u32.de/vdr.html#control
endef

define Package/vdr-control/description
 Control VDR with telnet.
endef

MAKE_FLAGS += \
	VDRDIR=$(STAGING_DIR)/usr/include/vdr \
	LIBDIR=$(PKG_BUILD_DIR)

define Package/vdr-control/install
	$(INSTALL_DIR) $(1)/usr/lib/vdr
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/libvdr-*.so.* $(1)/usr/lib/vdr/

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [control] > $(1)/etc/vdr/conf.d/50-control.conf
	$(CP) ./files/remote.conf $(1)/etc/vdr/
endef

$(eval $(call BuildPackage,vdr-control))
