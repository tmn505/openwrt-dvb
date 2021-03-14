#
# Copyright (C) 2017-2018 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-vdrmanager
PKG_SOURCE_DATE:=2019-10-10
PKG_RELEASE := 1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://projects.vdr-developer.org/git/vdr-manager.git
PKG_MIRROR_HASH:=ccdbaed5a69b09ed5afbedbd3c5d8858aea42bad86609352702e6009e06467fd
PKG_SOURCE_VERSION:=3a8b944ee18ae2db7e60bce1fb600d2b0ce6428c

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILE := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

#PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_SOURCE_DATE)-3a8b944e/vdr-vdrmanager

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

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

MAKE_PATH:=vdr-vdrmanager

#define Build/Install
#	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install-lib
#endef

#define Build/Compile
#	$(MAKE) -C $(PKG_BUILD_DIR) DESTDIR=$(1) install
#endef

define Package/vdr-vdrmanager/install
	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/vdr-vdrmanager/libvdr-vdrmanager.so $(1)/usr/lib/
# add .so.apiversion ?
	echo [vdrmanager] > $(1)/etc/vdr/conf.d/80-vdrmanager.conf
endef

$(eval $(call BuildPackage,vdr-vdrmanager))
