define Package/generic-as102
  SECTION := dvb-devices
  CATEGORY := DVB devices
  SUBMENU := Terrestrial (DVB-T/T2)
  TITLE := Abilis 102 based
  DEPENDS := +as102-firmware +kmod-dvb-as102
endef

define Package/generic-as102/description
 Supported:
 ADB-100T NBox DVB-T USB dongle.
endef

define Package/generic-as102/install
	$(INSTALL_DIR) $(1)/etc
endef
$(eval $(call BuildPackage,generic-as102))


define Package/generic-dib0700
  SECTION := dvb-devices
  CATEGORY := DVB devices
  SUBMENU := Terrestrial (DVB-T/T2)
  TITLE := Dibcom 0700 based
  DEPENDS := +dib0700-firmware +kmod-dvb-usb-dib0700
endef

define Package/generic-dib0700/description
 Supported:
 Medion CTX1921 (V2.1.2) USB DVB-T dongle.
endef

define Package/generic-dib0700/install
	$(INSTALL_DIR) $(1)/etc
endef
$(eval $(call BuildPackage,generic-dib0700))


define Package/generic-it9135
  SECTION := dvb-devices
  CATEGORY := DVB devices
  SUBMENU := Terrestrial (DVB-T/T2)
  TITLE := ITE 9135 based
  DEPENDS := +it9135-firmware +kmod-dvb-fe-af9033 +kmod-dvb-usb-af9035 +kmod-media-tuner-it913x
endef

define Package/generic-it9135/description
 Supported:
 HDTV USB DVB-T dongle,
 WandTV DVB-T digital terrestrial TV stick (EzTV869 1.0).
endef

define Package/generic-it9135/install
	$(INSTALL_DIR) $(1)/etc
endef
$(eval $(call BuildPackage,generic-it9135))


define Package/generic-rtl2838u
  SECTION := dvb-devices
  CATEGORY := DVB devices
  SUBMENU := Terrestrial (DVB-T/T2)
  TITLE := RealTek RTL2838U based
  DEPENDS := +kmod-dvb-fe-rtl2832 +kmod-dvb-usb-rtl28xxu
endef

define Package/generic-rtl2838u/description
 Supported:
 NOT ONLY TV LV5TDLX DVB-T USB,
 RealTek RTL2838UHIDIR,
 Trekstor DVB-T Stick Terres 2.0.
endef

define Package/generic-rtl2838u/install
	$(INSTALL_DIR) $(1)/etc
endef
$(eval $(call BuildPackage,generic-rtl2838u))


define Package/hauppauge-wintv-dualhd
  SECTION := dvb-devices
  CATEGORY := DVB devices
  SUBMENU := Multistandard
  TITLE := Hauppauge WinTV dualHD
  DEPENDS := +si2157-firmware +si2168-firmware +kmod-media-tuner-si2157 +kmod-dvb-fe-si2168 \
	+kmod-em28xx-dvb
endef

define Package/hauppauge-wintv-dualhd/description
 Supported:
 Hauppauge WinTV dualHD.
endef

define Package/hauppauge-wintv-dualhd/install
	$(INSTALL_DIR) $(1)/etc
endef
$(eval $(call BuildPackage,hauppauge-wintv-dualhd))


define Package/pctv-460e
  SECTION := dvb-devices
  CATEGORY := DVB devices
  SUBMENU := Satellite (DVB-S/S2)
  TITLE := PCTV Systems DVB-S2 Stick 460e
  DEPENDS := +tda10071-firmware +kmod-dvb-fe-a8293 +kmod-dvb-fe-tda10071 +kmod-em28xx-dvb
endef

define Package/pctv-460e/description
 Supported:
 PCTV Systems DVB-S2 Stick 460e.
endef

define Package/pctv-460e/install
	$(INSTALL_DIR) $(1)/etc
endef
$(eval $(call BuildPackage,pctv-460e))


define Package/terratec-cinergy-s2-hd
  SECTION := dvb-devices
  CATEGORY := DVB devices
  SUBMENU := Satellite (DVB-S/S2)
  TITLE := TerraTec CINERGY S2 Stick/USB HD
  DEPENDS := +ds3000-firmware +kmod-dvb-usb-dw2102
endef

define Package/terratec-cinergy-s2-hd/description
 Supported:
 TerraTec CINERGY S2 Stick HD rev3,
 TerraTec CINERGY S2 USB HD rev1,
 TerraTec CINERGY S2 USB HD rev2,
 TerraTec CINERGY S2 USB HD rev4.
endef

define Package/terratec-cinergy-s2-hd/install
	$(INSTALL_DIR) $(1)/etc
endef
$(eval $(call BuildPackage,terratec-cinergy-s2-hd))


define Package/terratec-cinergy-tc2-stick
  SECTION := dvb-devices
  CATEGORY := DVB devices
  SUBMENU := Multistandard
  TITLE := TerraTec CINERGY TC2 Stick
  DEPENDS := +it9303-firmware +si2168-firmware +kmod-dvb-fe-si2168 +kmod-dvb-usb-af9035 \
	+kmod-media-tuner-si2157
endef

define Package/terratec-cinergy-tc2-stick/description
 Supported:
 TerraTec CINERGY TC2 Stick.
endef

define Package/terratec-cinergy-tc2-stick/install
	$(INSTALL_DIR) $(1)/etc
endef
$(eval $(call BuildPackage,terratec-cinergy-tc2-stick))


define Package/tt-ct2-4650-ci
  SECTION := dvb-devices
  CATEGORY := DVB devices
  SUBMENU := Multistandard
  TITLE := TechnoTrend Connect CT2-4650 CI
  DEPENDS := +si2158-firmware +si2168-firmware +kmod-media-tuner-si2157 +kmod-dvb-fe-si2168 \
	+kmod-dvb-fe-sp2 +kmod-dvb-fe-ts2020 +kmod-dvb-usb-dvbsky
endef

define Package/tt-ct2-4650-ci/description
 Supported:
 TechnoTrend Connect CT2-4650 CI v1,
 TechnoTrend Connect CT2-4650 CI v1.1.
endef

define Package/tt-ct2-4650-ci/install
	$(INSTALL_DIR) $(1)/etc
endef
$(eval $(call BuildPackage,tt-ct2-4650-ci))
