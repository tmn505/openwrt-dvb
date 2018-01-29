#
# Copyright (C) 2017 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := satpi
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/Barracuda09/SATPI.git
PKG_SOURCE_VERSION := 067986df123966ea4ab8ff3aadd4ebdef70f649a
PKG_VERSION := 1.5.220-$(shell printf '%.8s' $(PKG_SOURCE_VERSION))

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILE := LICENSE

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

include $(INCLUDE_DIR)/package.mk

define Package/satpi
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := SAT>IP server
  URL := http://barracuda09.github.io/SATPI
  DEPENDS := +libstdcpp +SATPI_LIBDVBCSA:libdvbcsa
  MENU := 1
endef

define Package/satpi/description
 SATIP server for linux (suitable to run on an Raspberry Pi).
 Currently supporting DVB-S/S2/T/C and transform DVB-S requests to DVB-C.
endef

define Package/satpi/config
	if PACKAGE_satpi

		config SATPI_LIBDVBCSA
			bool "LIBDVBCSA"
			default y

	endif
endef

ifeq ($(CONFIG_SATPI_LIBDVBCSA),y)
	MAKE_FLAGS += LIBDVBCSA=yes
endif

define Package/satpi/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/satpi $(1)/usr/sbin/satpi

	$(INSTALL_DIR) $(1)/usr/share/satpi
	chmod -x+X -R $(PKG_BUILD_DIR)/web
	$(CP) $(PKG_BUILD_DIR)/web $(1)/usr/share/satpi/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/satpi.init $(1)/etc/init.d/satpi

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/satpi.conf $(1)/etc/config/satpi
endef

$(eval $(call BuildPackage,satpi))
