# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2011 OpenWrt.org
# Copyright (C) 2017-2022 Tomasz Maciej Nowak <tmn505@gmail.com>
#
include $(TOPDIR)/rules.mk

PKG_NAME := vdr
PKG_VERSION := 2.6.3
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := http://git.tvdr.de/vdr.git
PKG_SOURCE_VERSION := 8b14723e9ef4f408cfb357f6c27235cf491efd12
PKG_MIRROR_HASH := 0ed77eaf8799c36bab794f721af415d70b0e7bd3631978fcae2a3798bbfea5a5

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILES := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tmn505@gmail.com>

PKG_BUILD_PARALLEL := 1
PKG_INSTALL := 1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/vdr
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := Video Disk Recorder
  URL := http://www.tvdr.de
  DEPENDS := @BROKEN +libcap +libjpeg +libncurses +libstdcpp $(ICONV_DEPENDS) $(INTL_DEPENDS)
endef

define Package/vdr/description
 Video Disk Recorder (VDR) is a digital sat-receiver program using Linux and DVB technologies.
 It allows one to record MPEG2 streams, as well as output the stream to TV.
endef

define Package/vdr-epgtableid0
  SECTION := multimedia
  CATEGORY := Multimedia
  TITLE := Plugin for handling EPG events with 0x00 table id
  URL := http://www.tvdr.de
  DEPENDS := vdr
endef

define Build/Configure
	rm -fR \
		$(PKG_BUILD_DIR)/PLUGINS/src/hello \
		$(PKG_BUILD_DIR)/PLUGINS/src/osddemo \
		$(PKG_BUILD_DIR)/PLUGINS/src/pictures \
		$(PKG_BUILD_DIR)/PLUGINS/src/servicedemo \
		$(PKG_BUILD_DIR)/PLUGINS/src/skincurses \
		$(PKG_BUILD_DIR)/PLUGINS/src/status \
		$(PKG_BUILD_DIR)/PLUGINS/src/svdrpdemo \
		$(PKG_BUILD_DIR)/po
endef

TARGET_CXXFLAGS += -DDEBUG_DISABLE_BACKTRACE
TARGET_LDFLAGS += $(if $(ICONV_FULL),-liconv)
TARGET_LDFLAGS += $(if $(INTL_FULL),-lintl)

MAKE_FLAGS += \
	PREFIX="/usr" \
	VIDEODIR="/mnt/video" \
	CONFDIR="/etc/vdr" \
	CACHEDIR="/tmp/vdr" \
	$(if $(V),VERBOSE=1)

define Build/Install
	$(call Build/Install/Default,install-pc install-bin install-includes)
endef

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/vdr/conffiles
/etc/vdr
endef

define Package/vdr/install
	$(MAKE) -C $(PKG_BUILD_DIR) $(MAKE_FLAGS) DESTDIR=$(1) \
		install-conf \
		install-bin

	echo [vdr] > $(1)/etc/vdr/conf.d/00-vdr.conf

	$(INSTALL_DIR) $(1)/etc/vdr/plugins

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/vdr.init $(1)/etc/init.d/vdr

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/vdr.config $(1)/etc/config/vdr

	$(INSTALL_DIR) $(1)/usr/share/locale
endef

define Package/vdr-epgtableid0/install
	$(MAKE) -C $(PKG_BUILD_DIR)/PLUGINS/src/epgtableid0 $(MAKE_FLAGS) DESTDIR=$(1) install-lib

	$(INSTALL_DIR) $(1)/etc/vdr/conf.d
	echo [epgtableid0] > $(1)/etc/vdr/conf.d/01-epgtableid0.conf
endef

$(eval $(call BuildPackage,vdr))
$(eval $(call BuildPackage,vdr-epgtableid0))
