# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2017-2022 Tomasz Maciej Nowak <tmn505@gmail.com>
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr-dvbapi
PKG_VERSION := 2.2.6
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/manio/vdr-plugin-dvbapi.git
PKG_SOURCE_VERSION := c5f3648c8f0bb7213280253bad106a6a3e113b9e
PKG_MIRROR_HASH := f5b97d4d2fb0bfc96144a4976b7561e520bf4255535851852bf1d30a36ec855e

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILES := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tmn505@gmail.com>

PKG_BUILD_PARALLEL := 1

include $(INCLUDE_DIR)/package.mk

define Package/vdr-dvbapi
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := VDR dvbapi bridge to OSCam
  URL := https://github.com/manio/vdr-plugin-dvbapi
  DEPENDS := vdr +@BUILD_PATENTED +libdvbcsa +VDR_DVBAPI_SSL:libopenssl
endef

define Package/vdr-dvbapi/description
 VDR dvbapi plugin for use with OSCam.
endef

define Package/vdr-dvbapi/config
	if PACKAGE_vdr-dvbapi

		config VDR_DVBAPI_SSL
			bool "AES keys support (openssl)"
			default n

	endif
endef

MAKE_FLAGS += \
	LIBDVBCSA=1 \
	$(if $(CONFIG_VDR_DVBAPI_SSL),LIBSSL=1)

define Build/Configure
	$(SED) \
		'/^PKGCFG  =/c PKGCFG = $$$$(shell pkg-config --variable=$$$$(1) $$$$(STAGING_DIR)/usr/lib/pkgconfig/vdr.pc)' \
		-e '/^LIBSSL =/d' \
		$(PKG_BUILD_DIR)/Makefile
endef

define Package/vdr-dvbapi/install
	$(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) DESTDIR=$(1) install-lib

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [dvbapi] > $(1)/etc/vdr/conf.d/20-dvbapi.conf
endef

$(eval $(call BuildPackage,vdr-dvbapi))
