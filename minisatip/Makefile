#
# Copyright (C) 2017-2018 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := minisatip
PKG_VERSION := 0.5.69
PKG_RELEASE := 2

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/catalinii/minisatip.git
PKG_SOURCE_VERSION := bd493b1addd4a2d73ead880b5ea66a239e80224d

PKG_LICENSE := GPL-2.0

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

include $(INCLUDE_DIR)/package.mk

define Package/minisatip
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := SAT>IP server
  URL := https://minisatip.org
  DEPENDS := @BROKEN +MINISATIP_DVBAPI:libdvbapi +MINISATIP_DVBCSA:libdvbcsa +MINISATIP_CI:libdvben50221 +MINISATIP_AES:libopenssl
  MENU := 1
endef

define Package/minisatip/description
 SAT>IP server, tested with DVB-S, DVB-S2, DVB-T, DVB-T2, DVB-C, DVB-C2,
 ATSC and ISDB-T cards.
endef

define Package/minisatip/config
	if PACKAGE_minisatip

		config MINISATIP_CI
			bool "Common Interface"
			default n

		config MINISATIP_AES
			bool "OpenSSL (AES as part of DVBAPI)"
			default n

		config MINISATIP_DVBCSA
			bool "DVBCSA"
			default n

		config MINISATIP_CLIENT
			bool "SatIP Client"
			default y

		config MINISATIP_DVBAPI
			bool "dvbapi"
			default y

	endif
endef

ifeq ($(CONFIG_MINISATIP_CI),)
	CONFIGURE_ARGS += --disable-dvbca
endif

ifeq ($(CONFIG_MINISATIP_AES),)
	CONFIGURE_ARGS += --disable-dvbaes
endif

ifeq ($(CONFIG_MINISATIP_DVBCSA),)
	CONFIGURE_ARGS += --disable-dvbcsa
endif

ifeq ($(CONFIG_MINISATIP_CLIENT),)
	CONFIGURE_ARGS += --disable-satipc
endif

ifeq ($(CONFIG_MINISATIP_DVBAPI),)
	CONFIGURE_ARGS += --disable-dvbapi
endif

define Package/minisatip/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/minisatip $(1)/usr/sbin/minisatip

	$(INSTALL_DIR) $(1)/usr/share/minisatip
	$(CP) $(PKG_BUILD_DIR)/html $(1)/usr/share/minisatip/

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/minisatip.init $(1)/etc/init.d/minisatip

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/minisatip.config $(1)/etc/config/minisatip
endef

$(eval $(call BuildPackage,minisatip))
