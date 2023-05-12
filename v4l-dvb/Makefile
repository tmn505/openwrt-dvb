# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2011 OpenWrt.org
# Copyright (C) 2017-2022 Tomasz Maciej Nowak <tmn505@gmail.com>
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

SCAN_DEPS = *.mk

include $(INCLUDE_DIR)/package.mk

PKG_BUILD_DEPENDS := linuxtv/host

MAKE_VARS += \
	DIR=$(LINUX_DIR) \
	KDIR=$(LINUX_DIR) \
	SRCDIR=$(LINUX_DIR)

Build/Patch := :
Build/Install/Default := :
KernelPackage/depends := :

define Build/Prepare
	$(call Build/Prepare/Default)

	$(SED) '/^DATE .*/a TAR_TS := `git -C $$$$(DIR) log --format="@%ct" -n 1`' \
		-e 's,$$$$(TARDIR),$$$$(sort $$$$(TARDIR)),g' \
		-e 's,$$$$(TARFILES),$$$$(sort $$$$(TARFILES)),g' \
		-e 's,)`", | LC_ALL=C sort)`",g' \
		-e 's,tar cf ,tar --numeric-owner --owner=0 --group=0 --mode=a-s --sort=name --mtime="$$$$(TAR_TS)" -c -f ,g' \
		-e 's,tar rvf ,tar --numeric-owner --owner=0 --group=0 --mode=a-s --sort=name --mtime="$$$$(TAR_TS)" -r -v -f ,g' \
		$(PKG_BUILD_DIR)/linux/Makefile

	(if [ "`mkhash -N sha256 $(DL_DIR)/$(V4L_SOURCE_FILE)`" = "$(V4L_HASH)" ]; \
		then $(CP) $(DL_DIR)/$(V4L_SOURCE_FILE) $(PKG_BUILD_DIR)/linux/linux-media.tar.bz2; \
	else if [ -d $(DL_DIR)/$(V4L_REPO_NAME)/.git ]; \
			then git -C $(DL_DIR)/$(V4L_REPO_NAME) fetch --progress; \
			else git clone --progress --single-branch $(V4L_SOURCE_URL) $(DL_DIR)/$(V4L_REPO_NAME); \
		fi; \
		git -C $(DL_DIR)/$(V4L_REPO_NAME) checkout --progress $(V4L_SOURCE_VERSION); \
		cd $(PKG_BUILD_DIR)/linux; make tar DIR=$(DL_DIR)/$(V4L_REPO_NAME); \
		if [ "`mkhash -N sha256 linux-media.tar.bz2`" = "$(V4L_HASH)" ]; \
			then $(CP) linux-media.tar.bz2 $(DL_DIR)/$(V4L_SOURCE_FILE); \
			else echo 'Error: linux-media.tar.bz2 check sum does not match V4L_HASH.'; false; \
		fi; \
	fi;)

	$(MAKE) -C $(PKG_BUILD_DIR) untar

	$(call Build/Patch/Default)
endef

define Build/Configure
	$(SCRIPT_DIR)/package-metadata.pl \
		kconfig \
		$(TMP_DIR)/info/.packageinfo*v4l-dvb \
		$(TOPDIR)/.config \
		> $(PKG_BUILD_DIR)/$(PKG_EXTMOD_SUBDIRS)/.config

	$(call Build/Compile/Default,prepare)
endef

define Build/Compile
	+$(KERNEL_MAKE) \
		$(PKG_JOBS) \
		CONFIG_WERROR=n \
		M=$(PKG_BUILD_DIR)/$(PKG_EXTMOD_SUBDIRS) \
		modules

	mv -f $(LINUX_DIR)/.config.orig $(LINUX_DIR)/.config
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/v4l-dvb
	$(CP) $(PKG_BUILD_DIR)/linux/include/. $(1)/usr/include/v4l-dvb/.
	$(CP) $(PKG_BUILD_DIR)/$(PKG_EXTMOD_SUBDIRS)/.config $(1)/usr/include/v4l-dvb/
	$(CP) $(PKG_BUILD_DIR)/$(PKG_EXTMOD_SUBDIRS)/Module.symvers $(1)/usr/include/v4l-dvb/
endef


LINUXTV_MENU := V4L-DVB Drivers

define KernelPackage/mc
  TITLE := Media Controller API
  URL := https://linuxtv.org
  KCONFIG := \
	CONFIG_MEDIA_SUPPORT=m \
	CONFIG_MEDIA_CONTROLLER=y \
	CONFIG_MEDIA_CONTROLLER_DVB=m \
	CONFIG_MEDIA_CONTROLLER_REQUEST_API=n
  FILES := $(PKG_BUILD_DIR)/v4l/mc.ko
  DEFAULT := y
  HIDDEN := y
  DEPENDS := @PCI_SUPPORT||USB_SUPPORT
endef

define KernelPackage/mc/config
	source "$(SOURCE)/origin/Config.in"
endef

define KernelPackage/mc/description
 Enable the media controller API used to query media devices internal
 topology and configure it dynamically.
endef
$(eval $(call KernelPackage,mc))

include $(sort $(wildcard *.mk))
