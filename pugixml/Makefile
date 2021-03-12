#
# Copyright (C) 2017-2018 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := pugixml
PKG_VERSION := 1.9
PKG_RELEASE := 1

PKG_SOURCE := $(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL := http://github.com/zeux/pugixml/releases/download/v$(PKG_VERSION)/
PKG_HASH := d156d35b83f680e40fd6412c4455fdd03544339779134617b9b28d19e11fdba6

PKG_LICENSE := MIT
PKG_LICENSE_FILE := readme.txt

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

PKG_INSTALL := 1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/pugixml
  SECTION := libs
  CATEGORY := Libraries
  TITLE := XML parser for C++
  URL := https://pugixml.org
  DEPENDS := @BROKEN +libcurl +libstdcpp
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
	$(CP) $(PKG_INSTALL_DIR)/* $(1)/
endef

define Package/pugixml/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libpugixml.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,pugixml))
