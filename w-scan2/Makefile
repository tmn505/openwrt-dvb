# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2023 Tomasz Maciej Nowak <tmn505@gmail.com>
#
include $(TOPDIR)/rules.mk

PKG_NAME := w-scan2
PKG_VERSION := 1.0.14
PKG_RELEASE := 1

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/stefantalpalaru/w_scan2.git
PKG_SOURCE_VERSION := ef299fac9b22306c44a0de18dc64338fc3b4b1e4
PKG_MIRROR_HASH := f6a8ddb9557d79e66fd054a9456f465827d0c18bcf7fa7553ddb780ab7a89426

PKG_LICENSE := GPL-2.0
PKG_LICENSE_FILES := COPYING

PKG_MAINTAINER := Tomasz Maciej Nowak <tmn505@gmail.com>

PKG_BUILD_PARALLEL := 1

include $(INCLUDE_DIR)/package.mk

define Package/w-scan2
  SECTION := utils
  CATEGORY := Utilities
  TITLE := w_scan2 performs frequency scans for DVB and ATSC
  URL := https://github.com/stefantalpalaru/w_scan2
  DEPENDS := @BROKEN
endef

define Package/w-scan2/description
 w_scan2 is a small command line utility used to perform frequency scans for
 DVB and ATSC transmissions. It is capable of creating channels.conf files
 (in different output formats !) as well as initial tuning data for scan.
 It's based on the utility scan from linuxtv-dvb-apps, but meanwhile it was
  heavily changed and has different features:
 1. no need for "initial transponders", and such no need for a config file
 2. w_scan2 finds automatically the best matching dvb card
 3. complete different command line options
 4. a different default output format as well as bunch of output formats.
 This package does not include the script file "w_scan_start.sh".
endef

define Package/w-scan2/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/w_scan2 $(1)/usr/bin/
endef

$(eval $(call BuildPackage,w-scan2))
