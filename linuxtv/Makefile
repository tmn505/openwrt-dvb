# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2022 Tomasz Maciej Nowak <tmn505@gmail.com>
#
include $(TOPDIR)/rules.mk

PKG_NAME := linuxtv
PKG_RELEASE := 1

PKG_MAINTAINER := Tomasz Maciej Nowak <tmn505@gmail.com>

PKG_BUILD_PARALLEL := 0
PKG_HOST_ONLY := 1
PKG_INSTALL := 1

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/host-build.mk

define Package/linuxtv
  TITLE := HACK: append V4L-DVB config to Linux config
  BUILDONLY := 1
endef

$(HOST_STAMP_INSTALLED): $(HOST_STAMP_BUILT) FORCE

define Host/Compile
	$(if $(SDK),,$(error Only usage inside of OpenWrt SDK is supported. Sorry))
endef

define Host/Install
	$(if $(wildcard $(LINUX_DIR)/.config.orig), \
		mv -f $(LINUX_DIR)/.config.orig $(LINUX_DIR)/.config)
	cp $(LINUX_DIR)/.config $(LINUX_DIR)/.config.orig
	$(SCRIPT_DIR)/package-metadata.pl \
		kconfig \
		$(TMP_DIR)/info/.packageinfo-v4l-dvb \
		$(TOPDIR)/.config \
		>> $(LINUX_DIR)/.config
	rm -f $(HOST_STAMP_INSTALLED)
endef

define Host/Clean
	$(CP) $(LINUX_DIR)/.config.orig $(LINUX_DIR)/.config
	rm -f $(LINUX_DIR)/.config.orig
endef

$(eval $(call BuildPackage,linuxtv))
$(eval $(call HostBuild))
