# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2017-2022 Tomasz Maciej Nowak <tmn505@gmail.com>
#
include $(TOPDIR)/rules.mk

PKG_NAME := pugixml
PKG_VERSION := 1.13
PKG_RELEASE := 1

PKG_SOURCE := $(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL := http://github.com/zeux/pugixml/releases/download/v$(PKG_VERSION)/
PKG_HASH := 40c0b3914ec131485640fa57e55bf1136446026b41db91c1bef678186a12abbe

PKG_LICENSE := MIT
PKG_LICENSE_FILES := readme.txt

PKG_MAINTAINER := Tomasz Maciej Nowak <tmn505@gmail.com>

PKG_BUILD_PARALLEL := 1
PKG_INSTALL := 1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/pugixml
  SECTION := libs
  CATEGORY := Libraries
  TITLE := XML parser for C++
  URL := https://pugixml.org
  DEPENDS := +libstdcpp
endef

define Package/pugixml/description
 Light-weight C++ XML processing library. It features:
 DOM-like interface with rich traversal/modification capabilities
 Extremely fast non-validating XML parser which constructs the DOM tree from an XML file/buffer
 XPath 1.0 implementation for complex data-driven tree queries
 Full Unicode support with Unicode interface variants and automatic encoding conversions
endef

CMAKE_OPTIONS += -DBUILD_SHARED_LIBS:BOOL=TRUE

define Build/InstallDev
	$(CP) $(PKG_INSTALL_DIR)/. $(1)/.
endef

define Package/pugixml/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpugixml.so* $(1)/usr/lib/.
endef

$(eval $(call BuildPackage,pugixml))
