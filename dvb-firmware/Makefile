# SPDX-License-Identifier: GPL-2.0-only
#
# Copyright (C) 2017-2022 Tomasz Maciej Nowak <tmn505@gmail.com>
#
include $(TOPDIR)/rules.mk

PKG_NAME := dvb-firmware
PKG_RELEASE := 5

PKG_SOURCE_DATE := 2021-07-19
PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/LibreELEC/dvb-firmware.git
PKG_SOURCE_VERSION := 0eaf5b3928561d06d254cf5489d1e622bc827e5d
PKG_MIRROR_HASH := c847ddf3ca0d8e81fbde7324c1c55d331077e2f708d79e3b4bfe914a4c90ac5a

PKG_MAINTAINER := Tomasz Maciej Nowak <tmn505@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/firmware-default
  SECTION := firmware
  CATEGORY := Firmware
  TITLE := $(1)
endef

Build/Compile := :


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


Package/ds3000-firmware = $(call Package/firmware-default,Montage Technology M88DS3000)
define Package/ds3000-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/dvb-fe-ds3000.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,ds3000-firmware))


Package/it9135-firmware = $(call Package/firmware-default,ITE Tech IT9135)
define Package/it9135-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/dvb-usb-it9135-01.fw \
		$(PKG_BUILD_DIR)/firmware/dvb-usb-it9135-02.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,it9135-firmware))


Package/it9303-firmware = $(call Package/firmware-default,ITE Tech IT9303)
define Package/it9303-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/dvb-usb-it9303-01.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,it9303-firmware))


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


Package/si2157-firmware = $(call Package/firmware-default,Silicon Labs Si2157)
define Package/si2157-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/dvb-tuner-si2157-a30-01.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,si2157-firmware))


Package/si2158-firmware = $(call Package/firmware-default,Silicon Labs Si2158)
define Package/si2158-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/dvb-tuner-si2158-a20-01.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,si2158-firmware))


Package/si2168-firmware = $(call Package/firmware-default,Silicon Labs Si2168)
define Package/si2168-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/dvb-demod-si2168-01.fw \
		$(PKG_BUILD_DIR)/firmware/dvb-demod-si2168-02.fw \
		$(PKG_BUILD_DIR)/firmware/dvb-demod-si2168-a20-01.fw \
		$(PKG_BUILD_DIR)/firmware/dvb-demod-si2168-a30-01.fw \
		$(PKG_BUILD_DIR)/firmware/dvb-demod-si2168-b40-01.fw \
		$(PKG_BUILD_DIR)/firmware/dvb-demod-si2168-d60-01.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,si2168-firmware))


Package/tda10071-firmware = $(call Package/firmware-default,NXP TDA10071)
define Package/tda10071-firmware/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) \
		$(PKG_BUILD_DIR)/firmware/dvb-fe-tda10071.fw \
		$(1)/lib/firmware
endef
$(eval $(call BuildPackage,tda10071-firmware))


#$(eval $(call BuildPackage,dvb-firmware))
