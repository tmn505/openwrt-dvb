#
# Copyright (C) 2017 Tomasz Maciej Nowak <tomek_n@o2.pl>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk

PKG_NAME := dvb-firmware
PKG_RELEASE := 1

PKG_SOURCE_DATE := 2017-01-23
PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/LibreELEC/dvb-firmware.git
PKG_SOURCE_VERSION := c91bab0210ef74af0090e7bda121dd628f32511a

PKG_MAINTAINER := Tomasz Maciej Nowak <tomek_n@o2.pl>

include $(INCLUDE_DIR)/package.mk

define Package/firmware-default
  SECTION := firmware
  CATEGORY := Firmware
  TITLE := $(1)
endef

define Build/Compile
endef


Package/as102-firmware = $(call Package/firmware-default,Abilis AS102)
define Package/as102-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/as102_data1_st.hex \
		$(PKG_BUILD_DIR)/firmware/as102_data2_st.hex \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,as102-firmware))


Package/cx24120-firmware = $(call Package/firmware-default,Conexant CX24120 DVB-S/S2 frontend)
define Package/cx24120-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/dvb-fe-cx24120-1.20.58.2.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,cx24120-firmware))


Package/dib0700-firmware = $(call Package/firmware-default,DiBcom 0700 USB bridge)
define Package/dib0700-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/dvb-usb-dib0700-1.20.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,dib0700-firmware))


Package/drxd-firmware = $(call Package/firmware-default,Micronas DRXD demodulator)
define Package/drxd-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/drxd-a2-1.1.fw \
		$(PKG_BUILD_DIR)/firmware/drxd-b1-1.1.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,drxd-firmware))


Package/m88ds3103-firmware = $(call Package/firmware-default,Montage Technology M88DS3103 DVB-S/S2 demodulator)
define Package/m88ds3103-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/dvb-demod-m88ds3103.fw \
		$(PKG_BUILD_DIR)/firmware/dvb-demod-m88rs6000.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,m88ds3103-firmware))


Package/ngene-firmware = $(call Package/firmware-default,Micronas nGene PCIExpress bridge)
define Package/ngene-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/ngene_15.fw \
		$(PKG_BUILD_DIR)/firmware/ngene_16.fw \
		$(PKG_BUILD_DIR)/firmware/ngene_17.fw \
		$(PKG_BUILD_DIR)/firmware/ngene_18.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,ngene-firmware))


#$(eval $(call BuildPackage,dvb-firmware))
