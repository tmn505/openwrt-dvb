define DvbFrontend
  SUBMENU := $(DVB_MENU)
  V4L_KCONFIG := \
	$2
  DEPENDS := +kmod-i2c-core +kmod-dvb-core +kmod-i2c-mux +kmod-regmap
  FILES := $(PKG_BUILD_DIR)/v4l/$1.ko
  AUTOLOAD := $(call AutoProbe,$1)
endef


define KernelPackage/dvb-drxd
  TITLE := Micronas DRXD
  $(call DvbFrontend,drxd,CONFIG_DVB_DRXD)
  DEPENDS := +drxd-firmware
endef

define KernelPackage/dvb-drxd/description
 Micronas DRX-D DVB-T demodulator.
endef

$(eval $(call KernelPackage,dvb-drxd))


define KernelPackage/dvb-drxk
  TITLE := Micronas DRXK
  $(call DvbFrontend,drxk,CONFIG_DVB_DRXK)
endef

define KernelPackage/dvb-drxk/description
 Micronas DRX-K DVB-C/T demodulator.
endef

$(eval $(call KernelPackage,dvb-drxk))


define KernelPackage/dvb-pll
  TITLE := Generic I2C PLL based tuners
  $(call DvbFrontend,dvb-pll,CONFIG_DVB_PLL)
endef

define KernelPackage/dvb-pll/description
 This module drives a number of tuners based on PLL chips with a
 common I2C interface.
endef

$(eval $(call KernelPackage,dvb-pll))


define KernelPackage/dvb-rtl2830
  TITLE := Realtek RTL2830 DVB-T
  $(call DvbFrontend,rtl2830,CONFIG_DVB_RTL2830)
endef

define KernelPackage/dvb-rtl2830/description
 Realtek RTL2830 DVB-T
endef

$(eval $(call KernelPackage,dvb-rtl2830))


define KernelPackage/dvb-rtl2832
  TITLE := Realtek RTL2832 DVB-T
  $(call DvbFrontend,rtl2832,CONFIG_DVB_RTL2832)
  DEPENDS += +kmod-i2c-mux
endef

define KernelPackage/dvb-rtl2832/description
 Realtek RTL2832 DVB-T
endef

$(eval $(call KernelPackage,dvb-rtl2832))


define KernelPackage/dvb-si2168
  TITLE := Silicon Labs Si2168
  $(call DvbFrontend,si2168,CONFIG_DVB_SI2168)
  DEPENDS += +kmod-i2c-mux
endef

define KernelPackage/dvb-si2168/description
 Silicon Labs Si2168
endef

$(eval $(call KernelPackage,dvb-si2168))


define KernelPackage/dvb-zl10353
  TITLE := Zarlink ZL10353 based tuner
  $(call DvbFrontend,zl10353,CONFIG_DVB_ZL10353)
endef

define KernelPackage/dvb-zl10353/description
 A DVB-T tuner module.
endef

$(eval $(call KernelPackage,dvb-zl10353))


define KernelPackage/dvb-tda10023
  TITLE := Philips TDA10023 based tuner
  $(call DvbFrontend,tda10023,CONFIG_DVB_TDA10023)
endef

define KernelPackage/dvb-tda10023/description
 A DVB-C tuner module.
endef

$(eval $(call KernelPackage,dvb-tda10023))


define KernelPackage/dvb-tda10048
  TITLE := Philips TDA10048HN based tuner
  $(call DvbFrontend,tda10048,CONFIG_DVB_TDA10048)
endef

define KernelPackage/dvb-tda10048/description
 A DVB-T tuner module.
endef

$(eval $(call KernelPackage,dvb-tda10048))


define KernelPackage/dvb-af9013
  TITLE := Afatech AF9013 demodulator
  $(call DvbFrontend,af9013,CONFIG_DVB_AF9013)
  DEPENDS += @LINUX_4_7
endef

define KernelPackage/dvb-af9013/description
 Support for AF9013 DVB frontend.
endef

$(eval $(call KernelPackage,dvb-af9013))


define KernelPackage/dvb-af9033
  TITLE := Afatech AF9033 DVB-T demodulator
  $(call DvbFrontend,af9033,CONFIG_DVB_AF9033)
endef

define KernelPackage/dvb-af9033/description
 Support for AF9033 DVB frontend.
endef

$(eval $(call KernelPackage,dvb-af9033))


define KernelPackage/dvb-tuner-dib0070
  TITLE := DiBcom DiB0070 silicon base-band tuner
  $(call DvbFrontend,dib0070,CONFIG_DVB_TUNER_DIB0070)
endef

define KernelPackage/dvb-tuner-dib0070/description
 A driver for the silicon baseband tuner DiB0070 from DiBcom.
 This device is only used inside a SiP called together with a
 demodulator for now.
endef

$(eval $(call KernelPackage,dvb-tuner-dib0070))


define KernelPackage/dvb-tuner-cxusb
  TITLE := Conexant USB2.0 hybrid reference design support
  $(call DvbFrontend,cxusb,CONFIG_DVB_USB_CXUSB)
endef

define KernelPackage/dvb-tuner-cxusb/description
 Support the Conexant USB2.0 hybrid reference design.
 Currently, only DVB and ATSC modes are supported, analog mode
 shall be added in the future.
endef

$(eval $(call KernelPackage,dvb-tuner-dib0070))


define KernelPackage/dvb-tuner-dib0090
  TITLE := DiBcom DiB0090 silicon base-band tuner
  $(call DvbFrontend,dib0090,CONFIG_DVB_TUNER_DIB0090)
endef

define KernelPackage/dvb-tuner-dib0090/description
 A driver for the silicon baseband tuner DiB0090 from DiBcom.
 This device is only used inside a SiP called together with a
 demodulator for now.
endef

$(eval $(call KernelPackage,dvb-tuner-dib0090))


define KernelPackage/dvb-dib3000mb
  TITLE := DiBcom 3000M-B
  $(call DvbFrontend,dib3000mb,CONFIG_DVB_DIB3000MB)
endef

define KernelPackage/dvb-dib3000mb/description
 A DVB-T tuner module. Designed for mobile usage. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-dib3000mb))


define KernelPackage/dvb-dibx000-common
  SUBMENU := $(DVB_MENU)
  TITLE := Common library for DiBX000 drivers
  FILES := $(PKG_BUILD_DIR)/v4l/dibx000_common.ko
  AUTOLOAD := $(call AutoProbe,dibx000_common)
endef

$(eval $(call KernelPackage,dvb-dibx000-common))


define KernelPackage/dvb-dib3000mc
  TITLE := DiBcom 3000P/M-C
  $(call DvbFrontend,dib3000mc,CONFIG_DVB_DIB3000MC)
  DEPENDS += +kmod-dvb-dibx000-common
endef

define KernelPackage/dvb-dib3000mc/description
 A DVB-T tuner module. Designed for mobile usage. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-dib3000mc))


define KernelPackage/dvb-dib7000m
  TITLE := DiBcom 7000MA/MB/PA/PB/MC
  $(call DvbFrontend,dib7000m,CONFIG_DVB_DIB7000M)
  DEPENDS += +kmod-dvb-dibx000-common
endef

define KernelPackage/dvb-dib7000m/description
 A DVB-T tuner module. Designed for mobile usage. Say Y when you want
 to support this frontend
endef

$(eval $(call KernelPackage,dvb-dib7000m))


define KernelPackage/dvb-dib7000p
  TITLE := DiBcom 7000PC
  $(call DvbFrontend,dib7000p,CONFIG_DVB_DIB7000P)
  DEPENDS += +kmod-dvb-dibx000-common
endef

define KernelPackage/dvb-dib7000p/description
 A DVB-T tuner module. Designed for mobile usage. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-dib7000p))


define KernelPackage/dvb-dib8000
  TITLE := DiBcom 8000MB/MC
  $(call DvbFrontend,dib8000,CONFIG_DVB_DIB8000)
  DEPENDS += +kmod-dvb-dibx000-common
endef

define KernelPackage/dvb-dib8000/description
 A driver for DiBcom's DiB8000 ISDB-T/ISDB-Tsb demodulator.
 Say Y when you want to support this frontend.
endef

$(eval $(call KernelPackage,dvb-dib8000))


define KernelPackage/dvb-dib9000
  TITLE := DiBcom 9000
  $(call DvbFrontend,dib9000,CONFIG_DVB_DIB9000)
  DEPENDS += +kmod-dvb-dibx000-common
endef

define KernelPackage/dvb-dib9000/description
 A DVB-T tuner module. Designed for mobile usage. Say Y when you want
 to support this frontend.
endef

$(eval $(call KernelPackage,dvb-dib9000))


define KernelPackage/dvb-m88ds3103
  TITLE := Montage Technology M88DS3103
  $(call DvbFrontend,m88ds3103,CONFIG_DVB_M88DS3103)
  DEPENDS += +m88ds3103-firmware
endef

define KernelPackage/dvb-m88ds3103/description
 Montage Technology M88DS3103 DVB-S/S2 demodulator driver.
endef

$(eval $(call KernelPackage,dvb-m88ds3103))


define KernelPackage/dvb-cx24113
  TITLE := Conexant CX24113
  $(call DvbFrontend,cx24113,CONFIG_DVB_CX24113)
endef

define KernelPackage/dvb-cx24113/description
 Conexant CX24113/CX24128 tuner for DVB-S/DSS.
endef

$(eval $(call KernelPackage,dvb-cx24113))


define KernelPackage/dvb-cx24120
  TITLE := Conexant CX24120
  $(call DvbFrontend,cx24120,CONFIG_DVB_CX24120)
  DEPENDS += +cx24120-firmware
endef

define KernelPackage/dvb-cx24120/description
 Conexant CX24120 DVB-S/S2 tuner module.
endef

$(eval $(call KernelPackage,dvb-cx24120))


define KernelPackage/dvb-cx24123
  TITLE := Conexant CX24123
  $(call DvbFrontend,cx24123,CONFIG_DVB_CX24123)
endef

define KernelPackage/dvb-cx24123/description
 Conexant CX24123 DVB-S tuner module.
endef

$(eval $(call KernelPackage,dvb-cx24123))


define KernelPackage/dvb-isl6421
  TITLE := Intersil ISL6421
  $(call DvbFrontend,isl6421,CONFIG_DVB_ISL6421)
endef

define KernelPackage/dvb-isl6421/description
 Intersil ISL6421 SEC control chip module.
endef

$(eval $(call KernelPackage,dvb-isl6421))


define KernelPackage/dvb-lnbp21
  TITLE := STMicroelectronics LNBP21/LNBH24
  $(call DvbFrontend,lnbp21,CONFIG_DVB_LNBP21)
endef

define KernelPackage/dvb-lnbp21/description
 STMicroelectronics LNBP21/LNBH24 SEC chip controllers module.
endef

$(eval $(call KernelPackage,dvb-lnbp21))


define KernelPackage/dvb-s5h1420
  TITLE := Samsung S5H1420
  $(call DvbFrontend,s5h1420,CONFIG_DVB_S5H1420)
endef

define KernelPackage/dvb-s5h1420/description
 Samsung S5H1420 DVB-S tuner module.
endef

$(eval $(call KernelPackage,dvb-s5h1420))


define KernelPackage/dvb-stb0899
  TITLE := STMicroelectronics STB0899
  $(call DvbFrontend,stb0899,CONFIG_DVB_STB0899)
endef

define KernelPackage/dvb-stb0899/description
 STMicroelectronics STB0899 DVB-S/S2/DSS Multistandard demodulator module.
endef

$(eval $(call KernelPackage,dvb-stb0899))


define KernelPackage/dvb-stb6100
  TITLE := STMicroelectronics STB6100
  $(call DvbFrontend,stb6100,CONFIG_DVB_STB6100)
endef

define KernelPackage/dvb-stb6100/description
 A Silicon tuner from ST used in conjunction with the STB0899 demodulator.
endef

$(eval $(call KernelPackage,dvb-stb6100))
