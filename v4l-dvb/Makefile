#
# Copyright (C) 2011 OpenWrt.org
# Copyright (C) 2017-2022 Tomasz Maciej Nowak <tmn505@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/kernel.mk

include ./origin/selected.mk

PKG_RELEASE := 1

PKG_LICENSE := GPL-2.0
PKG_MAINTAINER := Tomasz Maciej Nowak <tmn505@gmail.com>

PKG_BUILD_PARALLEL := 1
PKG_INSTALL := 1
PKG_EXTMOD_SUBDIRS := v4l
PKG_CONFIG_DEPENDS := \
	CONFIG_V4L_SRC_TBSDTV \
	CONFIG_V4L_SRC_LINUXTV

SCAN_DEPS = *.mk

include $(INCLUDE_DIR)/package.mk

MAKE_VARS += \
	TOPDIR="" \
	DIR=$(LINUX_DIR) \
	KDIR=$(LINUX_DIR) \
	SRCDIR=$(LINUX_DIR)

MAKE_FLAGS += \
	ARCH=$(LINUX_KARCH)

Build/Patch := :
Build/Install/Default := :

define Build/Prepare
	$(call Build/Prepare/Default)

	(if [ -s $(DL_DIR)/$(V4L_SOURCE_FILE) ]; \
		then $(CP) $(DL_DIR)/$(V4L_SOURCE_FILE) $(PKG_BUILD_DIR)/linux/linux-media.tar.bz2; \
	else if [ -d $(DL_DIR)/$(V4L_REPO_NAME) ]; \
			then (cd $(DL_DIR)/$(V4L_REPO_NAME); git checkout HEAD; git pull); \
		else git clone --single-branch $(V4L_SOURCE_URL) $(DL_DIR)/$(V4L_REPO_NAME); \
		fi; \
		cd $(DL_DIR)/$(V4L_REPO_NAME); git checkout $(V4L_SOURCE_VERSION); \
		cd $(PKG_BUILD_DIR)/linux; make tar DIR=$(DL_DIR)/$(V4L_REPO_NAME); \
		$(CP) linux-media.tar.bz2 $(DL_DIR)/$(V4L_SOURCE_FILE); \
	fi;)

	$(MAKE) -C $(PKG_BUILD_DIR) untar
	$(CP) ./files/* $(PKG_BUILD_DIR)/

	$(call Build/Patch/Default)
endef

define Build/Configure
	$(call Build/Compile/Default,prepare)
endef

define Build/Compile
	+$(KERNEL_MAKE) $(PKG_JOBS) M=$(PKG_BUILD_DIR)/$(PKG_EXTMOD_SUBDIRS) modules
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/v4l-dvb
	$(CP) $(PKG_BUILD_DIR)/linux/include/* $(1)/usr/include/v4l-dvb/
	$(CP) $(PKG_BUILD_DIR)/$(PKG_EXTMOD_SUBDIRS)/Module.symvers $(1)/usr/include/v4l-dvb/
endef

DVB_MENU := DVB Drivers

define KernelPackage/mc
  TITLE := V4L/DVB Drivers
  URL := http://www.linuxtv.org
  HIDDEN := y
  DEFAULT := y
  V4L_KCONFIG := \
	CONFIG_MEDIA_SUPPORT=m \
	CONFIG_VIDEO_KERNEL_VERSION=y
  FILES := $(PKG_BUILD_DIR)/v4l/mc.ko
  AUTOLOAD := $(call AutoProbe,mc)
  DEPENDS := @PCI_SUPPORT||USB_SUPPORT
endef
define KernelPackage/mc/config
	source "$(SOURCE)/origin/Config.in"
endef

define KernelPackage/mc/description
 Live development version of V4L and DVB driver
endef

$(eval $(call KernelPackage,mc))

include $(sort $(wildcard ./*.mk))
