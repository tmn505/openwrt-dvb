#
# Copyright (C) 2011 OpenWrt.org
# Copyright (C) 2017 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

PKG_NAME := v4l-dvb
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://bitbucket.org/CrazyCat/media_build.git
PKG_SOURCE_VERSION := 48b08424d630be7ea7aeaa367e4a44f8ca6e26ac

V4L_REPO_URL := https://github.com/crazycat69/linux_media.git
V4L_REPO_VERSION := af020ce55b878709d6e2ab72a0776449e998f52c
V4L_REPO_NAME := $(shell printf $(V4L_REPO_URL) | awk -F'/' '{sub(/\.git/, "", $$NF); printf $$NF}')

PKG_LICENSE := GPL-2.0
PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

#PKG_JOBS = -j4

SCAN_DEPS = *.mk

include $(INCLUDE_DIR)/package.mk

MAKE_VARS += \
	TOPDIR="" \
	KDIR=$(LINUX_DIR) \
	DIR=$(LINUX_DIR)\
	SRCDIR=$(LINUX_DIR)

define Build/Prepare
	(if [ -d $(DL_DIR)/$(V4L_REPO_NAME) ]; \
		then (cd $(DL_DIR)/$(V4L_REPO_NAME); git checkout HEAD; git pull); \
	else git clone --single-branch --depth 1 $(V4L_REPO_URL) $(DL_DIR)/$(V4L_REPO_NAME); \
	fi; \
	cd $(DL_DIR)/$(V4L_REPO_NAME); git checkout $(V4L_REPO_VERSION))

	$(call Build/Prepare/Default)
	(cd $(PKG_BUILD_DIR)/linux; make tar DIR=$(DL_DIR)/$(V4L_REPO_NAME))
	$(call Build/Compile/Default,untar)
endef

define Build/Configure
	$(call Build/Compile/Default,stagingconfig)
endef

DVB_MENU := DVB Drivers

define KernelPackage/media
  SUBMENU := $(DVB_MENU)
  TITLE := V4L/DVB CrazyCat Edition
  URL := http://www.linuxtv.org/
  HIDDEN := y
  V4L_KCONFIG := \
	CONFIG_MEDIA_SUPPORT=m \
	CONFIG_VIDEO_KERNEL_VERSION=y
  FILES := $(PKG_BUILD_DIR)/v4l/media.ko
  AUTOLOAD := $(call AutoProbe,media)
  DEPENDS := +kernel
endef

define KernelPackage/media/description
 Live development version of V4L and DVB driver
endef

$(eval $(call KernelPackage,media))


define KernelPackage/dvb-core
  SUBMENU := $(DVB_MENU)
  TITLE := DVB core support
  V4L_KCONFIG := \
	CONFIG_DVB_CORE \
	CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=n \
	CONFIG_DVB_DYNAMIC_MINORS=n \
	CONFIG_DVB_MAX_ADAPTERS=16 \
	CONFIG_DVB_NET=y \
	CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-core.ko
  AUTOLOAD := $(call AutoProbe,dvb-core)
  DEPENDS += +kmod-media
endef

define KernelPackage/dvb-core/description
 Kernel modules for DVB support.
endef

$(eval $(call KernelPackage,dvb-core))


define KernelPackage/rc-core
  SUBMENU := $(DVB_MENU)
  TITLE := Remote Controller support
  V4L_KCONFIG := \
	CONFIG_MEDIA_RC_SUPPORT=y \
	CONFIG_RC_CORE
  FILES := $(PKG_BUILD_DIR)/v4l/rc-core.ko
  AUTOLOAD := $(call AutoProbe,rc-core)
  DEPENDS := +kmod-media +kmod-input-core
endef

define KernelPackage/rc-core/description
 Enable support for Remote Controllers on Linux. This is
 needed in order to support several video capture adapters,
 standalone IR receivers/transmitters, and RF receivers.

 Enable this option if you have a video capture board even
 if you don't need IR, as otherwise, you may not be able to
 compile the driver for your adapter.
endef

$(eval $(call KernelPackage,rc-core))


include $(sort $(wildcard ./*.mk))
