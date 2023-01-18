# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2017-2022 Tomasz Maciej Nowak <tmn505@gmail.com>
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-vdrmanager
PKG_VERSION := 0.15
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/vdr-projects/vdr-plugin-vdrmanager.git
PKG_SOURCE_VERSION := 3a8b944ee18ae2db7e60bce1fb600d2b0ce6428c
PKG_MIRROR_HASH := bd3f4c5a041101809be473967a3b8159368bfa5f6593851c565035b0f8fba0c1

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILES := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tmn505@gmail.com>

PKG_BUILD_PARALLEL := 1

include $(INCLUDE_DIR)/package.mk

define Package/vdr-vdrmanager
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR manager plugin
  URL := https://github.com/vdr-projects/vdr-plugin-vdrmanager
  DEPENDS := vdr +VDR_MANAGER_SSL:libopenssl +VDR_MANAGER_ZLIB:zlib
endef

define Package/vdr-vdrmanager/description
 With VDR-Manager you can program VDR using mobile devices running Android.
 So you can browse the EPG, manage timers and wakeup your VDR from anywhere.
endef

define Package/vdr-vdrmanager/config
	if PACKAGE_vdr-vdrmanager

		config VDR_MANAGER_SSL
			bool "Traffic encryption (openssl)"
			default n

		choice
			prompt "Traffic compression type"
			default VDR_MANAGER_GZIP

			config VDR_MANAGER_ZLIB
				bool "zlib"

			config VDR_MANAGER_GZIP
				bool "gzip"
		endchoice

	endif
endef

MAKE_PATH := $(PKG_NAME)
MAKE_FLAGS += \
	VDRMANAGER_USE_SSL=$(if $(CONFIG_VDR_MANAGER_SSL),1,0) \
	VDRMANAGER_USE_ZLIB=$(if $(CONFIG_VDR_MANAGER_ZLIB),1,0) \
	VDRMANAGER_USE_GZIP=$(if $(CONFIG_VDR_MANAGER_GZIP),1,0)

define Build/Configure
	$(SED) \
		'/^PKGCFG =/c PKGCFG = $$$$(shell pkg-config --variable=$$$$(1) $$$$(STAGING_DIR)/usr/lib/pkgconfig/vdr.pc)' \
		-e '/^ADDITIONAL_LIBS =/c ADDITIONAL_LIBS = $$$$(shell pkg-config --variable=$$$$(1) $$$$(STAGING_DIR)/usr/lib/pkgconfig/openssl.pc)' \
		-e '/^ADDITIONAL_LIBS +=/c ADDITIONAL_LIBS += $$$$(shell pkg-config --variable=$$$$(1) $$$$(STAGING_DIR)/usr/lib/pkgconfig/zlib.pc)' \
		$(PKG_BUILD_DIR)/$(MAKE_PATH)/Makefile
endef

define Package/vdr-vdrmanager/install
	$(MAKE) -C $(PKG_BUILD_DIR)/$(MAKE_PATH) DESTDIR=$(1) install-lib

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [vdrmanager] > $(1)/etc/vdr/conf.d/80-vdrmanager.conf
endef

$(eval $(call BuildPackage,vdr-vdrmanager))
