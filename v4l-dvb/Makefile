#
# Copyright (C) 2011 OpenWrt.org
# Copyright (C) 2017-2018 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME := v4l-dvb
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/tbsdtv/media_build.git
PKG_SOURCE_VERSION := 4735369fca22122cbc4dffd16c36026747563b0b

V4L_SOURCE_URL := https://github.com/tbsdtv/linux_media.git
V4L_SOURCE_VERSION := 23087976705d594febef88e9160c3eb76abb2d48
V4L_REPO_NAME := $(shell printf $(V4L_SOURCE_URL) | awk -F'/' '{sub(/\.git/, "", $$NF); printf $$NF}')
PKG_SOURCE_DATE := 2018-10-16
V4L_SOURCE_FILE := $(V4L_REPO_NAME)-$(PKG_SOURCE_DATE)-$(shell printf '%.8s' $(V4L_SOURCE_VERSION)).tar.bz2

PKG_LICENSE := GPL-2.0
PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

PKG_BUILD_PARALLEL := 1
PKG_INSTALL := 1

SCAN_DEPS = *.mk

include $(INCLUDE_DIR)/package.mk

MAKE_VARS += \
	TOPDIR="" \
	KDIR=$(LINUX_DIR) \
	DIR=$(LINUX_DIR) \
	SRCDIR=$(LINUX_DIR)

define Build/Prepare
	$(call Build/Prepare/Default)

	(if [ -s $(DL_DIR)/$(V4L_SOURCE_FILE) ]; \
		then $(CP) $(DL_DIR)/$(V4L_SOURCE_FILE) $(PKG_BUILD_DIR)/linux/$(subst _,-,$(V4L_REPO_NAME)).tar.bz2; \
	else if [ -d $(DL_DIR)/$(V4L_REPO_NAME) ]; \
			then (cd $(DL_DIR)/$(V4L_REPO_NAME); git checkout HEAD; git pull); \
		else git clone --single-branch $(V4L_SOURCE_URL) $(DL_DIR)/$(V4L_REPO_NAME); \
		fi; \
		cd $(DL_DIR)/$(V4L_REPO_NAME); git checkout $(V4L_SOURCE_VERSION); \
		cd $(PKG_BUILD_DIR)/linux; make tar DIR=$(DL_DIR)/$(V4L_REPO_NAME); \
		$(CP) $(subst _,-,$(V4L_REPO_NAME)).tar.bz2 $(DL_DIR)/$(V4L_SOURCE_FILE); \
	fi;)

	$(MAKE) -C $(PKG_BUILD_DIR) untar
	$(CP) ./files/* $(PKG_BUILD_DIR)/
endef

define Build/Configure
	$(call Build/Compile/Default,allyesconfig)
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/v4l-dvb
	$(CP) $(PKG_BUILD_DIR)/linux/include/* $(1)/usr/include/v4l-dvb/
endef

define Build/Install
	touch $(PKG_BUILD_DIR)/.built
endef

DVB_MENU := DVB Drivers

define KernelPackage/media
  SUBMENU := $(DVB_MENU)
  TITLE := V4L/DVB Drivers from TBS
  URL := http://www.linuxtv.org
  HIDDEN := y
  V4L_KCONFIG := \
	CONFIG_MEDIA_SUPPORT=m \
	CONFIG_VIDEO_KERNEL_VERSION=y
  FILES := $(PKG_BUILD_DIR)/v4l/media.ko
  AUTOLOAD := $(call AutoProbe,media)
  DEPENDS := @PCI_SUPPORT||USB_SUPPORT
endef

define KernelPackage/media/description
 Live development version of V4L and DVB driver
endef

$(eval $(call KernelPackage,media))

include $(sort $(wildcard ./*.mk))
