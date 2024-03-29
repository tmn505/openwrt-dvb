define KernelPackage/dvb-usb
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Support for various USB DVB devices
  KCONFIG := CONFIG_DVB_USB
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb)
  DEPENDS := +kmod-dvb-core +kmod-i2c-core +kmod-rc-core +kmod-usb-core
endef

define KernelPackage/dvb-usb/description
 By enabling this you will be able to choose the various supported
 USB1.1 and USB2.0 DVB devices.

 Almost every USB device needs a firmware.

 For a complete list of supported USB devices see the LinuxTV DVB Wiki:
 <http://www.linuxtv.org/wiki/index.php/DVB_USB>
endef
$(eval $(call KernelPackage,dvb-usb))

define DvbUsb
  SUBMENU := $(LINUXTV_MENU)
  DEPENDS := +kmod-dvb-usb $(1)
endef


define KernelPackage/dvb-usb-v2
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Support for various USB DVB devices v2
  KCONFIG := CONFIG_DVB_USB_V2
  FILES := $(PKG_BUILD_DIR)/v4l/dvb_usb_v2.ko
  AUTOLOAD := $(call AutoProbe,dvb_usb_v2)
  DEPENDS := +kmod-dvb-core +kmod-i2c-core +kmod-rc-core +kmod-usb-core
endef

define KernelPackage/dvb-usb-v2/description
 By enabling this you will be able to choose the various supported
 USB1.1 and USB2.0 DVB devices.

 Almost every USB device needs a firmware.

 For a complete list of supported USB devices see the LinuxTV DVB Wiki:
 <http://www.linuxtv.org/wiki/index.php/DVB_USB>
endef
$(eval $(call KernelPackage,dvb-usb-v2))

define DvbUsbV2
  SUBMENU := $(LINUXTV_MENU)
  DEPENDS := +kmod-dvb-usb-v2 $(1)
endef


define KernelPackage/airspy
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Airspy
  KCONFIG := CONFIG_USB_AIRSPY
  FILES := $(PKG_BUILD_DIR)/v4l/airspy.ko
  AUTOLOAD := $(call AutoProbe,airspy)
  DEPENDS := +kmod-usb-core +kmod-videobuf2-v4l2 +kmod-videobuf2-vmalloc
endef

define KernelPackage/airspy/description
 This is a video4linux2 driver for AirSpy SDR device.
endef
$(eval $(call KernelPackage,airspy))


define KernelPackage/b2c2-flexcop-usb
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Technisat/B2C2 Air/Sky/Cable2PC USB
  KCONFIG := CONFIG_DVB_B2C2_FLEXCOP_USB
  FILES := $(PKG_BUILD_DIR)/v4l/b2c2-flexcop-usb.ko
  AUTOLOAD := $(call AutoProbe,b2c2-flexcop-usb)
  DEPENDS := +kmod-i2c-core +kmod-b2c2-flexcop +kmod-usb-core
endef

define KernelPackage/b2c2-flexcop-usb/description
 Support for the Air/Sky/Cable2PC USB1.1 box (DVB/ATSC) by Technisat/B2C2.
endef
$(eval $(call KernelPackage,b2c2-flexcop-usb))


define KernelPackage/cx231xx-dvb-ci
  SUBMENU := $(LINUXTV_MENU)
  TITLE := DVB/ATSC Support for Cx231xx based TV cards
  KCONFIG := CONFIG_VIDEO_CX231XX CONFIG_VIDEO_CX231XX_DVB
  FILES := $(PKG_BUILD_DIR)/v4l/cx231xx.ko $(PKG_BUILD_DIR)/v4l/cx231xx-dvb-ci.ko
  AUTOLOAD := $(call AutoProbe,cx231xx-dvb-ci)
  DEPENDS := @V4L_SRC_TBSDTV +kmod-cx2341x +kmod-dvb-core +kmod-dvb-fe-lgdt3305 \
	+kmod-dvb-fe-mb86a20s +kmod-dvb-fe-s5h1411 +kmod-dvb-fe-s5h1432 +kmod-dvb-fe-tas2101 \
	+kmod-i2c-core +kmod-media-tuner-av201x +kmod-media-tuner-r820t +kmod-media-tuner-tda18271 \
	+kmod-media-tuner-xc5000 +kmod-rc-core +kmod-tveeprom +kmod-usb-core +kmod-videobuf \
	+kmod-videobuf2-v4l2
endef

define KernelPackage/cx231xx-dvb-ci/description
 This adds support for DVB cards based on the Conexant cx231xx chips.
endef
$(eval $(call KernelPackage,cx231xx-dvb-ci))


define KernelPackage/dvb-as102
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Abilis AS102 DVB receiver
  KCONFIG := CONFIG_DVB_AS102 CONFIG_DVB_AS102_FE
  FILES := \
	$(PKG_BUILD_DIR)/v4l/dvb-as102.ko \
	$(PKG_BUILD_DIR)/v4l/as102_fe.ko
  AUTOLOAD := $(call AutoProbe,dvb-as102 as102_fe)
  DEPENDS := +kmod-dvb-core +kmod-i2c-core +kmod-input-core +kmod-usb-core
endef

define KernelPackage/dvb-as102/description
 Support for the Abilis AS102 based DVB-T USB2.0 receivers.
endef
$(eval $(call KernelPackage,dvb-as102))


define KernelPackage/dvb-ttusb-budget
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Technotrend/Hauppauge Nova-USB devices
  KCONFIG := CONFIG_DVB_TTUSB_BUDGET
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-ttusb-budget.ko
  AUTOLOAD := $(call AutoProbe,dvb-ttusb-budget)
  DEPENDS := @PCI_SUPPORT +kmod-dvb-core +kmod-dvb-fe-cx22700 +kmod-dvb-fe-lnbp21 \
	+kmod-dvb-fe-stv0297 +kmod-dvb-fe-stv0299 +kmod-dvb-fe-tda1004x +kmod-dvb-fe-tda8083 \
	+kmod-dvb-fe-ves1820 +kmod-usb-core
endef

define KernelPackage/dvb-ttusb-budget/description
 Support for external USB adapters designed by Technotrend and
 produced by Hauppauge, shipped under the brand name 'Nova-USB'.
endef
$(eval $(call KernelPackage,dvb-ttusb-budget))


define KernelPackage/dvb-usb-a800
  TITLE := AVerMedia AverTV DVB-T USB 2.0 (A800)
  KCONFIG := CONFIG_DVB_USB_A800
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-a800.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-a800)
  $(call DvbUsb,+kmod-dvb-usb-dibusb-mc-common)
endef

define KernelPackage/dvb-usb-a800/description
 Say Y here to support the AVerMedia AverTV DVB-T USB 2.0 (A800) receiver.
endef
$(eval $(call KernelPackage,dvb-usb-a800))


define KernelPackage/dvb-usb-af9005
  TITLE := Afatech AF9005 DVB-T USB1.1 support
  KCONFIG := CONFIG_DVB_USB_AF9005
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-af9005.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-af9005)
  $(call DvbUsb,+kmod-media-tuner-mt2060 +kmod-media-tuner-qt1010)
endef

define KernelPackage/dvb-usb-af9005/description
 Say Y here to support the Afatech AF9005 based DVB-T USB1.1 receiver
 and the TerraTec Cinergy T USB XE (Rev.1)
endef
$(eval $(call KernelPackage,dvb-usb-af9005))


define KernelPackage/dvb-usb-af9015
  TITLE := Afatech AF9015 DVB-T USB2.0 support
  KCONFIG := CONFIG_DVB_USB_AF9015
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-af9015.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-af9015)
  $(call DvbUsbV2,+kmod-dvb-pll +kmod-media-tuner-mc44s803 +kmod-media-tuner-mt2060 \
	+kmod-media-tuner-mxl5005s +kmod-media-tuner-mxl5007t +kmod-media-tuner-qt1010 \
	+kmod-media-tuner-tda18218 +kmod-media-tuner-tda18271 +kmod-regmap-core)
endef

define KernelPackage/dvb-usb-af9015/description
 Support for the Afatech AF9015 based DVB-T USB2.0 receiver.
endef
$(eval $(call KernelPackage,dvb-usb-af9015))


define KernelPackage/dvb-usb-af9035
  TITLE := Afatech AF9035 DVB-T USB2.0 support
  KCONFIG := CONFIG_DVB_USB_AF9035
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-af9035.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-af9035)
  $(call DvbUsbV2,+kmod-media-tuner-fc0011 +kmod-media-tuner-fc0012 +kmod-media-tuner-mxl5007t \
	+kmod-media-tuner-tda18218)
endef

define KernelPackage/dvb-usb-af9035/description
 Say Y here to support the Afatech AF9035 based DVB USB receiver.
endef
$(eval $(call KernelPackage,dvb-usb-af9035))


define KernelPackage/dvb-usb-anysee
  TITLE := Anysee DVB-T/C USB2.0 support
  KCONFIG := CONFIG_DVB_USB_ANYSEE
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-anysee.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-anysee)
  $(call DvbUsbV2,+kmod-dvb-fe-cx24116 +kmod-dvb-fe-cxd2820r +kmod-dvb-fe-isl6423 +kmod-dvb-fe-mt352 \
	+kmod-dvb-fe-stv0900 +kmod-dvb-fe-stv6110 +kmod-dvb-fe-tda10023 +kmod-dvb-fe-zl10353 \
	+kmod-dvb-pll)
endef

define KernelPackage/dvb-usb-anysee/description
 Anysee DVB-T/C USB2.0 support
endef
$(eval $(call KernelPackage,dvb-usb-anysee))


define KernelPackage/dvb-usb-au6610
  TITLE := Alcor Micro AU6610 USB2.0 support
  KCONFIG := CONFIG_DVB_USB_AU6610
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-au6610.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-au6610)
  $(call DvbUsbV2,+kmod-cypress-firmware +kmod-media-tuner-qt1010 +kmod-dvb-fe-zl10353)
endef

define KernelPackage/dvb-usb-au6610/description
 Say Y here to support the Sigmatek DVB-110 DVB-T USB2.0 receiver.
endef
$(eval $(call KernelPackage,dvb-usb-au6610))


define KernelPackage/dvb-usb-az6007
  TITLE := AzureWave 6007 and clones DVB-T/C USB2.0 support
  KCONFIG := CONFIG_DVB_USB_AZ6007
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-az6007.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-az6007)
  $(call DvbUsbV2,+kmod-cypress-firmware +kmod-dvb-fe-drxk +kmod-media-tuner-mt2063)
endef

define KernelPackage/dvb-usb-az6007/description
 Say Y here to support the AZ6007 receivers like Terratec H7.
endef
$(eval $(call KernelPackage,dvb-usb-az6007))


define KernelPackage/dvb-usb-az6027
  TITLE := Azurewave DVB-S/S2 USB2.0 AZ6027 support
  KCONFIG := CONFIG_DVB_USB_AZ6027
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-az6027.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-az6027)
  $(call DvbUsb,+kmod-dvb-fe-stb0899 +kmod-dvb-fe-stb6100)
endef

define KernelPackage/dvb-usb-az6027/description
 Say Y here to support the AZ6027 device
endef
$(eval $(call KernelPackage,dvb-usb-az6027))


define KernelPackage/dvb-usb-ce6230
  TITLE := Intel CE6230 DVB-T USB2.0 support
  KCONFIG := CONFIG_DVB_USB_CE6230
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-ce6230.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-ce6230)
  $(call DvbUsbV2,+kmod-media-tuner-mxl5005s +kmod-dvb-fe-zl10353)
endef

define KernelPackage/dvb-usb-ce6230/description
 Say Y here to support the Intel CE6230 DVB-T USB2.0 receiver.
endef
$(eval $(call KernelPackage,dvb-usb-ce6230))


define KernelPackage/dvb-usb-cxusb
  TITLE := Conexant USB2.0 hybrid reference design support
  KCONFIG := \
	CONFIG_DVB_USB_CXUSB \
	CONFIG_DVB_USB_CXUSB_ANALOG=n
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-cxusb.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-cxusb)
  $(call DvbUsb,+kmod-dvb-fe-dib0070 +kmod-dvb-fe-atbm8830 +kmod-dvb-fe-cx22702 \
	+kmod-dvb-fe-dib7000p +kmod-dvb-fe-lgdt330x +kmod-dvb-fe-lgs8gxx +kmod-dvb-fe-mt352 \
	+kmod-dvb-fe-zl10353 +kmod-dvb-pll +kmod-media-tuner-max2165 +kmod-media-tuner-mxl5005s \
	+kmod-media-tuner-simple +kmod-media-tuner-xc2028 +kmod-videobuf2-v4l2)
endef

define KernelPackage/dvb-usb-cxusb/description
 Support the Conexant USB2.0 hybrid reference design.
 Currently, only DVB and ATSC modes are supported, analog mode
 shall be added in the future.
endef
$(eval $(call KernelPackage,dvb-usb-cxusb))


define KernelPackage/dvb-usb-dib0700
  TITLE := DiBcom DiB0700 USB DVB devices
  KCONFIG := CONFIG_DVB_USB_DIB0700
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dib0700.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dib0700)
  $(call DvbUsb,+kmod-dvb-fe-dib0070 +kmod-dvb-fe-dib0090 +kmod-dvb-fe-dib3000mc \
	+kmod-dvb-fe-dib7000m +kmod-dvb-fe-dib7000p +kmod-dvb-fe-dib8000 +kmod-dvb-fe-dib9000 \
	+kmod-dvb-fe-lgdt3305 +kmod-dvb-fe-s5h1411 +kmod-media-tuner-mt2060 +kmod-media-tuner-mt2266 \
	+kmod-media-tuner-mxl5007t +kmod-media-tuner-xc2028 +kmod-media-tuner-xc4000 \
	+kmod-media-tuner-xc5000)
endef

define KernelPackage/dvb-usb-dib0700/description
 Support for USB2.0/1.1 DVB receivers based on the DiB0700 USB bridge. The
 USB bridge is also present in devices having the DiB7700 DVB-T-USB
 silicon. This chip can be found in devices offered by Hauppauge,
 Avermedia and other big and small companies.

 For an up-to-date list of devices supported by this driver, have a look
 on the LinuxTV Wiki at www.linuxtv.org.

 Say Y if you own such a device and want to use it. You should build it as
 a module.
endef
$(eval $(call KernelPackage,dvb-usb-dib0700))


define KernelPackage/dvb-usb-dibusb-common
  TITLE := Common library for DiBcom USB drivers
  KCONFIG := CONFIG_DVB_USB
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dibusb-common.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dibusb-common)
  $(call DvbUsb,)
endef
$(eval $(call KernelPackage,dvb-usb-dibusb-common))


define KernelPackage/dvb-usb-dibusb-mc-common
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Common library for DiBcom USB drivers
  KCONFIG := CONFIG_DVB_USB_DIB3000MC
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dibusb-mc-common.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dibusb-mc-common)
  DEPENDS := +kmod-dvb-fe-dib3000mc +kmod-dvb-pll +kmod-dvb-usb-dibusb-common +kmod-media-tuner-mt2060
endef
$(eval $(call KernelPackage,dvb-usb-dibusb-mc-common))


define KernelPackage/dvb-usb-dibusb-mb
  SUBMENU := $(LINUXTV_MENU)
  TITLE := DiBcom USB DVB-T devices (DiB3000M-B based)
  KCONFIG :=  \
	CONFIG_DVB_USB_DIBUSB_MB_FAULTY=y \
	CONFIG_DVB_USB_DIBUSB_MB
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dibusb-mb.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dibusb-mb)
  DEPENDS := +kmod-dvb-fe-dib3000mb +kmod-dvb-pll +kmod-dvb-usb-dibusb-common
endef

define KernelPackage/dvb-usb-dibusb-mb/description
 Support for USB 1.1 and 2.0 DVB-T receivers based on reference designs made by
 DiBcom (<http://www.dibcom.fr>) equipped with a DiB3000M-B demodulator.

 For an up-to-date list of devices supported by this driver, have a look
 on the Linux-DVB Wiki at www.linuxtv.org.

 Say Y if you own such a device and want to use it. You should build it as
 a module.
endef
$(eval $(call KernelPackage,dvb-usb-dibusb-mb))


define KernelPackage/dvb-usb-dibusb-mc
  SUBMENU := $(LINUXTV_MENU)
  TITLE := DiBcom USB DVB-T devices (DiB3000M-C/P based)
  KCONFIG := CONFIG_DVB_USB_DIBUSB_MC
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dibusb-mc.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dibusb-mc)
  DEPENDS := +kmod-dvb-usb-dibusb-mc-common
endef

define KernelPackage/dvb-usb-dibusb-mc/description
 Support for USB2.0 DVB-T receivers based on reference designs made by
 DiBcom (<http://www.dibcom.fr>) equipped with a DiB3000M-C/P demodulator.

 For an up-to-date list of devices supported by this driver, have a look
 on the Linux-DVB Wiki at www.linuxtv.org.

 Say Y if you own such a device and want to use it. You should build it as
 a module.
endef
$(eval $(call KernelPackage,dvb-usb-dibusb-mc))


define KernelPackage/dvb-usb-digitv
  TITLE := Nebula Electronics uDigiTV DVB-T USB2.0 support
  KCONFIG := CONFIG_DVB_USB_DIGITV
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-digitv.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-digitv)
  $(call DvbUsb,+kmod-dvb-pll +kmod-dvb-fe-mt352 +kmod-dvb-fe-nxt6000)
endef

define KernelPackage/dvb-usb-digitv/description
 Say Y here to support the Nebula Electronics uDigitV USB2.0 DVB-T receiver.
endef
$(eval $(call KernelPackage,dvb-usb-digitv))


define KernelPackage/dvb-usb-dtt200u
  TITLE := WideView WT-200U and WT-220U (pen) DVB-T USB2.0 support (Yakumo/Hama/Typhoon/Yuan)
  KCONFIG := CONFIG_DVB_USB_DTT200U
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dtt200u.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dtt200u)
  $(call DvbUsb,)
endef

define KernelPackage/dvb-usb-dtt200u/description
 Say Y here to support the WideView/Yakumo/Hama/Typhoon/Yuan DVB-T USB2.0 receiver.
 The receivers are also known as DTT200U (Yakumo) and UB300 (Yuan).
 The WT-220U and its clones are pen-sized.
endef
$(eval $(call KernelPackage,dvb-usb-dtt200u))


define KernelPackage/dvb-usb-dtv5100
  TITLE := AME DTV-5100 USB2.0 DVB-T support
  KCONFIG := CONFIG_DVB_USB_DTV5100
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dtv5100.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dtv5100)
  $(call DvbUsb,+kmod-dvb-fe-zl10353 +kmod-media-tuner-qt1010)
endef

define KernelPackage/dvb-usb-dtv5100/description
 Say Y here to support the AME DTV-5100 USB2.0 DVB-T receiver.
endef
$(eval $(call KernelPackage,dvb-usb-dtv5100))


define KernelPackage/dvb-usb-dvbsky
  TITLE := DVBSky USB support
  KCONFIG := CONFIG_DVB_USB_DVBSKY
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dvbsky.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dvbsky)
  $(call DvbUsbV2,+kmod-dvb-fe-m88ds3103)
endef

define KernelPackage/dvb-usb-dvbsky/description
 Say Y here to support the USB receivers from DVBSky.
endef
$(eval $(call KernelPackage,dvb-usb-dvbsky))


define KernelPackage/dvb-usb-dw2102
  TITLE := DvbWorld & TeVii DVB-S/S2 USB2.0 support
  KCONFIG := CONFIG_DVB_USB_DW2102
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dw2102.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dw2102)
  $(call DvbUsb,+kmod-dvb-fe-cx24116 +kmod-dvb-fe-cxd2820r +kmod-dvb-fe-ds3000 \
	+kmod-dvb-fe-m88rs2000 +kmod-dvb-fe-mt312 +kmod-dvb-fe-si21xx +kmod-dvb-fe-stb6000 \
	+kmod-dvb-fe-stb6100 +kmod-dvb-fe-stv0288 +kmod-dvb-fe-stv0299 +kmod-dvb-fe-stv0900 \
	+kmod-dvb-fe-stv090x +kmod-dvb-fe-stv6110 +kmod-dvb-fe-tda10023 +kmod-dvb-fe-ts2020 \
	+kmod-dvb-fe-zl10039 +kmod-dvb-pll +kmod-media-tuner-tda18271 +kmod-media-tuner-tda18273)
endef

define KernelPackage/dvb-usb-dw2102/description
 Say Y here to support the DvbWorld, TeVii, Prof, TechnoTrend
 DVB-S/S2 USB2.0 receivers.
endef
$(eval $(call KernelPackage,dvb-usb-dw2102))


define KernelPackage/dvb-usb-ec168
  TITLE := E3C EC168 DVB-T USB2.0 support
  KCONFIG := CONFIG_DVB_USB_EC168
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-ec168.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-ec168)
  $(call DvbUsbV2,+kmod-dvb-fe-ec100 +kmod-media-tuner-mxl5005s)
endef

define KernelPackage/dvb-usb-ec168/description
 Say Y here to support the E3C EC168 DVB-T USB2.0 receiver.
endef
$(eval $(call KernelPackage,dvb-usb-ec168))


define KernelPackage/dvb-usb-gl861
  TITLE := Genesys Logic GL861 USB2.0 support
  KCONFIG := CONFIG_DVB_USB_GL861
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-gl861.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-gl861)
  $(call DvbUsbV2,+kmod-dvb-fe-zl10353 +kmod-media-tuner-qt1010)
endef

define KernelPackage/dvb-usb-gl861/description
 Say Y here to support the MSI Megasky 580 (55801) DVB-T USB2.0
 receiver with USB ID 0db0:5581, Friio White ISDB-T receiver
 with USB ID 0x7a69:0001.
endef
$(eval $(call KernelPackage,dvb-usb-gl861))


define KernelPackage/dvb-usb-gp8psk
  TITLE := GENPIX 8PSK DVB-S Devices
  KCONFIG := \
	CONFIG_DVB_USB_GP8PSK \
	CONFIG_DVB_GP8PSK_FE
  FILES := \
	$(PKG_BUILD_DIR)/v4l/dvb-usb-gp8psk.ko \
	$(PKG_BUILD_DIR)/v4l/gp8psk-fe.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-gp8psk gp8psk-fe)
  $(call DvbUsb,)
endef

define KernelPackage/dvb-usb-gp8psk/description
 Say Y here to support the GENPIX 8PSK DVB-S device.
endef
$(eval $(call KernelPackage,dvb-usb-gp8psk))


define KernelPackage/dvb-usb-lmedm04
  TITLE := LME DM04/QQBOX DVB-S USB2.0 support
  KCONFIG := CONFIG_DVB_USB_LME2510
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-lmedm04.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-lmedm04)
  $(call DvbUsbV2,+kmod-dvb-fe-ix2505v +kmod-dvb-fe-m88rs2000 +kmod-dvb-fe-stv0288 \
	+kmod-dvb-fe-stv0299 +kmod-dvb-fe-tda10086 +kmod-dvb-fe-tda826x +kmod-dvb-fe-ts2020 \
	+kmod-dvb-pll)
endef

define KernelPackage/dvb-usb-lmedm04/description
 Say Y here to support the LME DM04/QQBOX DVB-S USB2.0.
endef
$(eval $(call KernelPackage,dvb-usb-lmedm04))


define KernelPackage/dvb-usb-m920x
  TITLE := Uli m920x DVB-T USB2.0 support
  KCONFIG := CONFIG_DVB_USB_M920X
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-m920x.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-m920x)
  $(call DvbUsb,+kmod-dvb-fe-mt352 +kmod-dvb-fe-tda1004x +kmod-media-tuner-mt2060 \
	+kmod-media-tuner-qt1010 +kmod-media-tuner-tda827x +kmod-media-tuner-simple)
endef

define KernelPackage/dvb-usb-m920x/description
 Say Y here to support the MSI Mega Sky 580 USB2.0 DVB-T receiver.
 Currently, only devices with a product id of
 "DTV USB MINI" (in cold state) are supported.
 Firmware required.
endef
$(eval $(call KernelPackage,dvb-usb-m920x))


define KernelPackage/dvb-usb-mxl111sf
  TITLE := MxL111SF DTV USB2.0 support
  KCONFIG := CONFIG_DVB_USB_MXL111SF
  FILES := \
	$(PKG_BUILD_DIR)/v4l/dvb-usb-mxl111sf.ko \
	$(PKG_BUILD_DIR)/v4l/mxl111sf-demod.ko \
	$(PKG_BUILD_DIR)/v4l/mxl111sf-tuner.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-mxl111sf mxl111sf-demod mxl111sf-tuner)
  $(call DvbUsbV2,+kmod-dvb-fe-lg2160 +kmod-dvb-fe-lgdt3305 +kmod-tveeprom)
endef

define KernelPackage/dvb-usb-mxl111sf/description
 Say Y here to support the MxL111SF USB2.0 DTV receiver.
endef
$(eval $(call KernelPackage,dvb-usb-mxl111sf))


define KernelPackage/dvb-usb-nova-t-usb2
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Hauppauge WinTV-NOVA-T usb2 DVB-T USB2.0 support
  KCONFIG := CONFIG_DVB_USB_NOVA_T_USB2
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-nova-t-usb2.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-nova-t-usb2)
  DEPENDS := +kmod-dvb-usb-dibusb-mc-common
endef

define KernelPackage/dvb-usb-nova-t-usb2/description
 Say Y here to support the Hauppauge WinTV-NOVA-T usb2 DVB-T USB2.0 receiver.
endef
$(eval $(call KernelPackage,dvb-usb-nova-t-usb2))


define KernelPackage/dvb-usb-opera
  TITLE := Opera1 DVB-S USB2.0 receiver
  KCONFIG := CONFIG_DVB_USB_OPERA1
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-opera.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-opera)
  $(call DvbUsb,+kmod-dvb-fe-stv0299 +kmod-dvb-pll)
endef

define KernelPackage/dvb-usb-opera/description
 Say Y here to support the Opera DVB-S USB2.0 receiver.
endef
$(eval $(call KernelPackage,dvb-usb-opera))


define KernelPackage/dvb-usb-pctv452e
  TITLE := Pinnacle PCTV HDTV Pro USB device/TT Connect S2-3600
  KCONFIG := CONFIG_DVB_USB_PCTV452E
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-pctv452e.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-pctv452e)
  $(call DvbUsb,+kmod-dvb-fe-isl6423 +kmod-dvb-fe-lnbp22 +kmod-dvb-fe-stb0899 +kmod-dvb-fe-stb6100 \
	+kmod-ttpci-eeprom)
endef

define KernelPackage/dvb-usb-pctv452e/description
 Support for external USB adapter designed by Pinnacle,
 shipped under the brand name 'PCTV HDTV Pro USB'.
 Also supports TT Connect S2-3600/3650 cards.
 Say Y if you own such a device and want to use it.
endef
$(eval $(call KernelPackage,dvb-usb-pctv452e))


define KernelPackage/dvb-usb-rtl28xxu
  TITLE := Realtek RTL28xxU DVB USB support
  KCONFIG := CONFIG_DVB_USB_RTL28XXU
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-rtl28xxu.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-rtl28xxu)
  $(call DvbUsbV2,+kmod-dvb-fe-cxd2841er +kmod-media-tuner-fc0012 +kmod-media-tuner-fc0013 \
	+kmod-media-tuner-mt2060 +kmod-media-tuner-mxl5005s +kmod-media-tuner-qt1010 \
	+kmod-media-tuner-r820t)
endef

define KernelPackage/dvb-usb-rtl28xxu/description
 Realtek RTL28xxU DVB USB support.
endef
$(eval $(call KernelPackage,dvb-usb-rtl28xxu))


define KernelPackage/dvb-usb-tbs5220
  TITLE := TurboSight TBS5220 DVB-T/T2/C USB2.0 support
  KCONFIG := CONFIG_DVB_USB_TBS5220
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbs5220.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbs5220)
  $(call DvbUsb,@V4L_SRC_TBSDTV)
endef

define KernelPackage/dvb-usb-tbs5220/description
 Say Y here to support the TurboSight TBS5220 DVB-T/T2/C USB2.0 receivers.
endef
$(eval $(call KernelPackage,dvb-usb-tbs5220))


define KernelPackage/dvb-usb-tbs5301
  TITLE := TurboSight 5301 hdmi USB2.0 support
  KCONFIG := CONFIG_DVB_USB_TBS5301
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbs5301.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbs5301)
  $(call DvbUsb,@V4L_SRC_TBSDTV +kmod-dvb-fe-tas2971)
endef

define KernelPackage/dvb-usb-tbs5301/description
 Say Y here to support the TurboSight 5301 hdmi USB2.0 receivers.
endef
$(eval $(call KernelPackage,dvb-usb-tbs5301))


define KernelPackage/dvb-usb-tbs5520
  TITLE := TurboSight TBS5520 support
  KCONFIG := CONFIG_DVB_USB_TBS5520
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbs5520.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbs5520)
  $(call DvbUsb,@V4L_SRC_TBSDTV +kmod-dvb-fe-avl6882 +kmod-media-tuner-r848)
endef

define KernelPackage/dvb-usb-tbs5520/description
 Say Y here to support the Turbosight TBS5520 USB2 DVB-T/T2/C/S/S2 device.
endef
$(eval $(call KernelPackage,dvb-usb-tbs5520))


define KernelPackage/dvb-usb-tbs5520se
  TITLE := TurboSight TBS5520SE support
  KCONFIG := CONFIG_DVB_USB_TBS5520se
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbs5520se.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbs5520se)
  $(call DvbUsb,@V4L_SRC_TBSDTV +kmod-media-tuner-av201x)
endef

define KernelPackage/dvb-usb-tbs5520se/description
 Say Y here to support the Turbosight TBS5520se USB2 DVB-T/T2/C/C2/S/S2/S2x device.
endef
$(eval $(call KernelPackage,dvb-usb-tbs5520se))


define KernelPackage/dvb-usb-tbs5580
  TITLE := TurboSight TBS5580 CI support
  KCONFIG := CONFIG_DVB_USB_TBS5580
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbs5580.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbs5580)
  $(call DvbUsb,@V4L_SRC_TBSDTV +kmod-media-tuner-av201x)
endef

define KernelPackage/dvb-usb-tbs5580/description
 Say Y here to support the Turbosight TBS5580 CI USB2 DVB-T/T2/C/C2/S/S2/S2x device.
endef
$(eval $(call KernelPackage,dvb-usb-tbs5580))


define KernelPackage/dvb-usb-tbs5590
  TITLE := Turbosight TBS5590 usb2.0 capture support
  KCONFIG := CONFIG_DVB_USB_TBS5590
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbs5590.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbs5590)
  $(call DvbUsb,@V4L_SRC_TBSDTV +kmod-dvb-fe-tbs-priv +kmod-media-tuner-av201x)
endef

define KernelPackage/dvb-usb-tbs5590/description
 Say Y here to support the Turbosight TBS5590 USB2.0 DVB-T/T2/C/C2/S/S2/S2x ASI-IN device.
endef
$(eval $(call KernelPackage,dvb-usb-tbs5590))


define KernelPackage/dvb-usb-tbs5880
  TITLE := TurboSight TBS5880 DVB-T/T2/C USB2.0 support
  KCONFIG := CONFIG_DVB_USB_TBS5880
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbs5880.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbs5880)
  $(call DvbUsb,@V4L_SRC_TBSDTV +kmod-dvb-fe-cxd2820r)
endef

define KernelPackage/dvb-usb-tbs5880/description
 Say Y here to support the TurboSight TBS5880 DVB-T/T2/C USB2.0 receivers.
endef
$(eval $(call KernelPackage,dvb-usb-tbs5880))


define KernelPackage/dvb-usb-tbs5881
  TITLE := TurboSight TBS5881 DVB-T/T2/C USB2.0 support
  KCONFIG := CONFIG_DVB_USB_TBS5881
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbs5881.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbs5881)
  $(call DvbUsb,@V4L_SRC_TBSDTV)
endef

define KernelPackage/dvb-usb-tbs5881/description
 Say Y here to support the TurboSight TBS5881 DVB-T/T2/C USB2.0 receivers.
endef
$(eval $(call KernelPackage,dvb-usb-tbs5881))


define KernelPackage/dvb-usb-tbs5922se
  TITLE := TurboSight 5922SE DVB-S2 USB2.0 support
  KCONFIG := CONFIG_DVB_USB_TBS5922SE
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbs5922se.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbs5922se)
  $(call DvbUsb,@V4L_SRC_TBSDTV +kmod-dvb-fe-tas2101 +kmod-media-tuner-av201x)
endef

define KernelPackage/dvb-usb-tbs5922se/description
 Say Y here to support the TurboSight 5922SE DVB-S USB2.0 receivers.
endef
$(eval $(call KernelPackage,dvb-usb-tbs5922se))


define KernelPackage/dvb-usb-tbs5925
  TITLE := TurboSight 5925 DVB-S2 USB2.0 support
  KCONFIG := CONFIG_DVB_USB_TBS5925
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbs5925.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbs5925)
  $(call DvbUsb,@V4L_SRC_TBSDTV +kmod-dvb-fe-stb6100 +kmod-dvb-fe-stv090x)
endef

define KernelPackage/dvb-usb-tbs5925/description
 Say Y here to support the TurboSight 5925 DVB-S USB2.0 receivers.
endef
$(eval $(call KernelPackage,dvb-usb-tbs5925))


define KernelPackage/dvb-usb-tbs5927
  TITLE := TurboSight 5927 DVB-S2 USB2.0 support
  KCONFIG := CONFIG_DVB_USB_TBS5927
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbs5927.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbs5927)
  $(call DvbUsb,@V4L_SRC_TBSDTV +kmod-dvb-fe-stv091x +kmod-media-tuner-stv6120)
endef

define KernelPackage/dvb-usb-tbs5927/description
 Say Y here to support the TurboSight 5927 DVB-S USB2.0 receivers.
endef
$(eval $(call KernelPackage,dvb-usb-tbs5927))


define KernelPackage/dvb-usb-tbsqbox2
  TITLE := TurboSight QBOX2 DVB-S2 USB2.0 support
  KCONFIG := CONFIG_DVB_USB_TBSQBOX2
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbsqbox2.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbsqbox2)
  $(call DvbUsb,@V4L_SRC_TBSDTV +kmod-dvb-fe-stb6100 +kmod-dvb-fe-stv090x)
endef

define KernelPackage/dvb-usb-tbsqbox2/description
 Say Y here to support the TurboSight QBOX2 DVB-S USB2.0 receivers.
endef
$(eval $(call KernelPackage,dvb-usb-tbsqbox2))


define KernelPackage/dvb-usb-tbsqbox22
  TITLE := TurboSight QBOX22 DVB-S2 USB2.0 support
  KCONFIG := CONFIG_DVB_USB_TBSQBOX22
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbsqbox22.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbsqbox22)
  $(call DvbUsb,@V4L_SRC_TBSDTV +kmod-dvb-fe-tas2101 +kmod-media-tuner-av201x)
endef

define KernelPackage/dvb-usb-tbsqbox22/description
 Say Y here to support the TurboSight QBOX22 DVB-S USB2.0 receivers.
endef
$(eval $(call KernelPackage,dvb-usb-tbsqbox22))


define KernelPackage/dvb-usb-tbsqbox
  TITLE := TurboSight QBOX DVB-S2 USB2.0 support
  KCONFIG := CONFIG_DVB_USB_TBSQBOX
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbsqbox.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbsqbox)
  $(call DvbUsb,@V4L_SRC_TBSDTV +kmod-dvb-fe-stb6000 +kmod-dvb-fe-stv0288)
endef

define KernelPackage/dvb-usb-tbsqbox/description
 Say Y here to support the TurboSight QBOX DVB-S USB2.0 receivers.
endef
$(eval $(call KernelPackage,dvb-usb-tbsqbox))


define KernelPackage/dvb-usb-tbsqbox2ci
  TITLE := TurboSight QBOX2 CI DVB-S2 USB2.0 support
  KCONFIG := CONFIG_DVB_USB_TBSQBOX2CI
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbsqbox2ci.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbsqbox2ci)
  $(call DvbUsb,@V4L_SRC_TBSDTV +kmod-dvb-fe-stb6100 +kmod-dvb-fe-stv090x)
endef

define KernelPackage/dvb-usb-tbsqbox2ci/description
 Say Y here to support the TurboSight QBOX2 CI DVB-S USB2.0 receivers.
endef
$(eval $(call KernelPackage,dvb-usb-tbsqbox2ci))


define KernelPackage/dvb-usb-tbsqboxs2
  TITLE := TurboSight QBOX S2 DVB-S2 USB2.0 support
  KCONFIG := CONFIG_DVB_USB_TBSQBOXS2
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-tbsqboxs2.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-tbsqboxs2)
  $(call DvbUsb,@V4L_SRC_TBSDTV +kmod-dvb-fe-cx24116)
endef

define KernelPackage/dvb-usb-tbsqboxs2/description
 Say Y here to support the TurboSight QBOX S2 DVB-S USB2.0 receivers.
endef
$(eval $(call KernelPackage,dvb-usb-tbsqboxs2))


define KernelPackage/dvb-usb-technisat-usb2
  TITLE := Technisat DVB-S/S2 USB2.0 support
  KCONFIG := CONFIG_DVB_USB_TECHNISAT_USB2
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-technisat-usb2.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-technisat-usb2)
  $(call DvbUsb,+kmod-dvb-fe-stv090x +kmod-dvb-fe-stv6110x)
endef

define KernelPackage/dvb-usb-technisat-usb2/description
 Say Y here to support the Technisat USB2 DVB-S/S2 device.
endef
$(eval $(call KernelPackage,dvb-usb-technisat-usb2))


define KernelPackage/dvb-usb-ttusb2
  TITLE := Pinnacle 400e DVB-S USB2.0 support
  KCONFIG := CONFIG_DVB_USB_TTUSB2
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-ttusb2.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-ttusb2)
  $(call DvbUsb,+kmod-dvb-fe-lnbp21 +kmod-dvb-fe-tda10023 +kmod-dvb-fe-tda10048 +kmod-dvb-fe-tda10086 \
	+kmod-dvb-fe-tda826x +kmod-media-tuner-tda827x)
endef

define KernelPackage/dvb-usb-ttusb2/description
 Say Y here to support the Pinnacle 400e DVB-S USB2.0 receiver and
 the TechnoTrend CT-3650 CI DVB-C/T USB2.0 receiver. The
 firmware protocol used by this module is similar to the one used by the
 old ttusb-driver - that's why the module is called dvb-usb-ttusb2.
endef
$(eval $(call KernelPackage,dvb-usb-ttusb2))


define KernelPackage/dvb-usb-umt-010
  SUBMENU := $(LINUXTV_MENU)
  TITLE := HanfTek UMT-010 DVB-T USB2.0 support
  KCONFIG := CONFIG_DVB_USB_UMT_010
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-umt-010.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-umt-010)
  DEPENDS := +kmod-dvb-fe-mt352 +kmod-dvb-pll +kmod-dvb-usb-dibusb-common
endef

define KernelPackage/dvb-usb-umt-010/description
 Say Y here to support the HanfTek UMT-010 USB2.0 stick-sized DVB-T receiver.
endef
$(eval $(call KernelPackage,dvb-usb-umt-010))


define KernelPackage/dvb-usb-vp702x
  TITLE := TwinhanDTV StarBox and clones DVB-S USB2.0 support
  KCONFIG := CONFIG_DVB_USB_VP702X
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-vp702x.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-vp702x)
  $(call DvbUsb)
endef

define KernelPackage/dvb-usb-vp702x/description
 TwinhanDTV StarBox, DigitalRise USB Starbox and
 TYPHOON DVB-S USB 2.0 BOX.
endef
$(eval $(call KernelPackage,dvb-usb-vp702x))


define KernelPackage/dvb-usb-vp7045
  TITLE := TwinhanDTV Alpha/MagicBoxII, DNTV tinyUSB2, Beetle USB2.0 support
  KCONFIG := CONFIG_DVB_USB_VP7045
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-vp7045.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-vp7045)
  $(call DvbUsb)
endef

define KernelPackage/dvb-usb-vp7045/description
 TwinhanDTV Alpha (stick) (VP-7045), TwinhanDTV MagicBox II (VP-7046),
 DigitalNow TinyUSB 2 DVB-t, DigitalRise USB 2.0 Ter (Beetle) and
 TYPHOON DVB-T USB DRIVE.
endef
$(eval $(call KernelPackage,dvb-usb-vp7045))


define KernelPackage/em28xx-dvb
  SUBMENU := $(LINUXTV_MENU)
  TITLE := DVB/ATSC Support for em28xx based TV cards
  KCONFIG := CONFIG_VIDEO_EM28XX CONFIG_VIDEO_EM28XX_DVB
  FILES := $(PKG_BUILD_DIR)/v4l/em28xx.ko $(PKG_BUILD_DIR)/v4l/em28xx-dvb.ko
  AUTOLOAD := $(call AutoProbe,em28xx-dvb)
  DEPENDS := +kmod-dvb-core +kmod-dvb-fe-cxd2820r +kmod-dvb-fe-drx39xyj +kmod-dvb-fe-drxd \
	+kmod-dvb-fe-drxk +kmod-dvb-fe-lgdt3305 +kmod-dvb-fe-lgdt330x +kmod-dvb-fe-mb86a20s \
	+kmod-dvb-fe-mt352 +kmod-dvb-fe-s5h1409 +kmod-dvb-fe-s921 +kmod-dvb-fe-tda10023 \
	+kmod-dvb-fe-tda18271c2dd +kmod-dvb-fe-zl10353 +kmod-media-tuner-mt2060 \
	+kmod-media-tuner-qt1010 +kmod-media-tuner-tda18271 +kmod-media-tuner-simple \
	+kmod-media-tuner-xc2028 +kmod-media-tuner-xc5000 +kmod-tveeprom +kmod-usb-core
endef

define KernelPackage/em28xx-dvb/description
 This adds support for DVB cards based on the Empiatech em28xx chips.
endef
$(eval $(call KernelPackage,em28xx-dvb))


define KernelPackage/hackrf
  SUBMENU := $(LINUXTV_MENU)
  TITLE := HackRF
  KCONFIG := CONFIG_USB_HACKRF
  FILES := $(PKG_BUILD_DIR)/v4l/hackrf.ko
  AUTOLOAD := $(call AutoProbe,hackrf)
  DEPENDS := +kmod-usb-core +kmod-videobuf2-v4l2 +kmod-videobuf2-vmalloc
endef

define KernelPackage/hackrf/description
 To compile this driver as a module, choose M here, the module will be called hackrf.
endef
$(eval $(call KernelPackage,hackrf))


define KernelPackage/msi2500
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Mirics MSi2500
  KCONFIG := CONFIG_USB_MSI2500
  FILES := $(PKG_BUILD_DIR)/v4l/msi2500.ko
  AUTOLOAD := $(call AutoProbe,msi2500)
  DEPENDS := +kmod-usb-core +kmod-videobuf2-v4l2 +kmod-videobuf2-vmalloc
endef
$(eval $(call KernelPackage,msi2500))


define KernelPackage/smsusb
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Siano SMS1xxx based MDTV receiver
  KCONFIG := CONFIG_SMS_USB_DRV
  FILES := $(PKG_BUILD_DIR)/v4l/smsusb.ko
  AUTOLOAD := $(call AutoProbe,smsusb)
  DEPENDS := +kmod-smsmdtv +kmod-usb-core
endef

define KernelPackage/smsusb/description
 Choose if you would like to have Siano's support for USB interface.
endef
$(eval $(call KernelPackage,smsusb))


define KernelPackage/tm6000-dvb
  SUBMENU := $(LINUXTV_MENU)
  TITLE := DVB Support for tm6000 based TV cards
  KCONFIG := CONFIG_VIDEO_TM6000 CONFIG_VIDEO_TM6000_DVB
  FILES := $(PKG_BUILD_DIR)/v4l/tm6000.ko $(PKG_BUILD_DIR)/v4l/tm6000-dvb.ko
  AUTOLOAD := $(call AutoProbe,tm6000-dvb)
  DEPENDS := +kmod-dvb-core +kmod-dvb-fe-zl10353 +kmod-media-tuner-xc2028 +kmod-media-tuner-xc5000 \
	+kmod-rc-core +kmod-usb-core +kmod-videobuf
endef

define KernelPackage/tm6000-dvb/description
 This adds support for DVB cards based on the tm5600/tm6000 chip.
endef
$(eval $(call KernelPackage,tm6000-dvb))


define KernelPackage/ttusb-dec
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Technotrend/Hauppauge USB DEC devices
  KCONFIG := CONFIG_DVB_TTUSB_DEC
  FILES := $(PKG_BUILD_DIR)/v4l/ttusb_dec.ko $(PKG_BUILD_DIR)/v4l/ttusbdecfe.ko
  AUTOLOAD := $(call AutoProbe,ttusb_dec ttusbdecfe)
  DEPENDS := @PCI_SUPPORT +kmod-dvb-core +kmod-input-core +kmod-usb-core
endef

define KernelPackage/ttusb-dec/description
 Support for external USB adapters designed by Technotrend and
 produced by Hauppauge, shipped under the brand name 'DEC2000-t'
 and 'DEC3000-s'.
endef
$(eval $(call KernelPackage,ttusb-dec))


define KernelPackage/zd1301
  TITLE := ZyDAS ZD1301
  KCONFIG := CONFIG_DVB_USB_ZD1301
  FILES := $(PKG_BUILD_DIR)/v4l/zd1301.ko
  AUTOLOAD := $(call AutoProbe,zd1301)
  $(call DvbUsbV2,+kmod-dvb-fe-zd1301-demod)
endef

define KernelPackage/zd1301/description
 Say Y here to support the ZyDAS ZD1301 DVB USB receiver.
endef
$(eval $(call KernelPackage,zd1301))

