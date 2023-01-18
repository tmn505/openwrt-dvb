# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2017-2022 Tomasz Maciej Nowak <tmn505@gmail.com>
#
include $(TOPDIR)/rules.mk

PKG_NAME := satpi
PKG_VERSION := 1.6.2
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/Barracuda09/SATPI.git
PKG_SOURCE_VERSION := c4077cab8048d211d8b7181a9da05f5d1fc61409
PKG_MIRROR_HASH := 9016d84c55ba545d1956c050389eb6e2db11d0a7bedd58efbed10825465c2c51

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILES := LICENSE

PKG_MAINTAINER := Tomasz Maciej Nowak <tmn505@gmail.com>

PKG_BUILD_PARALLEL := 1

include $(INCLUDE_DIR)/package.mk

define Package/satpi
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := SAT>IP server
  URL := http://barracuda09.github.io/SATPI
  DEPENDS := +libatomic +libstdcpp +BUILD_PATENTED&&SATPI_LIBDVBCSA:libdvbcsa
endef

define Package/satpi/description
 SATIP server for linux (suitable to run on an Raspberry Pi).
 Currently supporting DVB-S/S2/T/C and transform DVB-S requests to DVB-C.
endef

define Package/satpi/config
	if PACKAGE_satpi
		config SATPI_LIBDVBCSA
			bool "Channels descrambling with libdvbcsa"
			default n
	endif
endef

MAKE_FLAGS += $(if $(CONFIG_SATPI_LIBDVBCSA),LIBDVBCSA=yes)

define Package/satpi/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/satpi $(1)/usr/sbin/satpi

	$(INSTALL_DIR) $(1)/usr/share/satpi
	chmod -x+X -R $(PKG_BUILD_DIR)/web
	$(CP) $(PKG_BUILD_DIR)/web $(1)/usr/share/satpi/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/satpi.init $(1)/etc/init.d/satpi

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/satpi.config $(1)/etc/config/satpi
endef

$(eval $(call BuildPackage,satpi))
