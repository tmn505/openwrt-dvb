#
# Copyright (C) 2017-2018 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-vdrmanager
PKG_VERSION := 0.14
PKG_RELEASE := 2

PKG_SOURCE := $(PKG_NAME)-$(PKG_VERSION).tgz
PKG_SOURCE_URL := https://projects.vdr-developer.org/attachments/download/1971

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILE := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

include $(INCLUDE_DIR)/package.mk

define Package/vdr-vdrmanager
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR manager plugin
  DEPENDS := vdr +libopenssl +zlib
  URL := https://projects.vdr-developer.org/projects/plg-manager
endef

define Package/vdr-vdrmanager/description
 With VDR-Manager you can program VDR using mobile devices running Android.
 So you can browse the EPG, manage timers and wakeup your VDR from anywhere.
endef

define Package/vdr-vdrmanager/install
	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install-lib

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [vdrmanager] > $(1)/etc/vdr/conf.d/80-vdrmanager.conf
endef

$(eval $(call BuildPackage,vdr-vdrmanager))
