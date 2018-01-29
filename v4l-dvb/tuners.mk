TUNER_MENU:=Media tuners

define MediaTuner
  SUBMENU := $(TUNER_MENU)
  V4L_KCONFIG := \
	CONFIG_MEDIA_SUPPORT=m \
	CONFIG_MEDIA_DIGITAL_TV_SUPPORT=m \
	$2
  DEPENDS := +kmod-media +kmod-i2c-core
  FILES := $(PKG_BUILD_DIR)/v4l/$1.ko
  AUTOLOAD := $(call AutoProbe,$1)
endef


define KernelPackage/media-tuner-e4000
  TITLE := Elonics E4000 silicon tuner
  $(call MediaTuner,e4000,CONFIG_MEDIA_TUNER_E4000)
  DEPENDS += +kmod-regmap +kmod-video-core
endef

define KernelPackage/media-tuner-e4000/description
 Elonics E4000 silicon tuner driver.
endef

$(eval $(call KernelPackage,media-tuner-e4000))


define KernelPackage/media-tuner-fc0011
  TITLE := Fitipower FC0011 silicon tuner
  $(call MediaTuner,fc0011,CONFIG_MEDIA_TUNER_FC0011)
endef

define KernelPackage/media-tuner-fc0011/description
 Fitipower FC0011 silicon tuner driver.
endef

$(eval $(call KernelPackage,media-tuner-fc0011))


define KernelPackage/media-tuner-fc0012
  TITLE := Fitipower FC0012 silicon tuner
  $(call MediaTuner,fc0012,CONFIG_MEDIA_TUNER_FC0012)
endef

define KernelPackage/media-tuner-fc0012/description
 Fitipower FC0012 silicon tuner driver.
endef

$(eval $(call KernelPackage,media-tuner-fc0012))


define KernelPackage/media-tuner-fc0013
  TITLE := Fitipower FC0013 silicon tuner
  $(call MediaTuner,fc0013,CONFIG_MEDIA_TUNER_FC0013)
endef

define KernelPackage/media-tuner-fc0013/description
 Fitipower FC0013 silicon tuner driver.
endef

$(eval $(call KernelPackage,media-tuner-fc0013))


define KernelPackage/media-tuner-fc2580
  TITLE := FCI FC2580 silicon tuner
  $(call MediaTuner,fc2580,CONFIG_MEDIA_TUNER_FC2580)
  DEPENDS += +kmod-regmap +kmod-video-core
endef

define KernelPackage/media-tuner-fc2580/description
 FCI FC2580 silicon tuner driver.
endef

$(eval $(call KernelPackage,media-tuner-fc2580))


define KernelPackage/media-tuner-it913x
  TITLE := ITE Tech IT913x silicon tuner
  $(call MediaTuner,it913x,CONFIG_MEDIA_TUNER_IT913X)
  DEPENDS += +kmod-regmap
endef

define KernelPackage/media-tuner-it913x/description
 ITE Tech IT913x silicon tuner driver.
endef

$(eval $(call KernelPackage,media-tuner-it913x))


define KernelPackage/media-tuner-si2157
  TITLE := Silicon Labs Si2157 silicon tuner
  $(call MediaTuner,si2157,CONFIG_MEDIA_TUNER_SI2157)
  DEPENDS += +kmod-regmap
endef

define KernelPackage/media-tuner-si2157/description
 Silicon Labs Si2157 silicon tuner driver.
endef

$(eval $(call KernelPackage,media-tuner-si2157))


define KernelPackage/media-tuner-max2165
  TITLE := Maxim MAX2165 silicon tuner
  $(call MediaTuner,max2165,CONFIG_MEDIA_TUNER_MAX2165)
endef

define KernelPackage/media-tuner-max2165/description
 A driver for the silicon tuner MAX2165 from Maxim.
endef

$(eval $(call KernelPackage,media-tuner-max2165))


define KernelPackage/media-tuner-mc44s803
  TITLE := Freescale MC44S803 Broadband tuners
  $(call MediaTuner,mc44s803,CONFIG_MEDIA_TUNER_MC44S803)
endef

define KernelPackage/media-tuner-mc44s803/description
 Say Y here to support the Freescale MC44S803 based tuners
endef

$(eval $(call KernelPackage,media-tuner-mc44s803))


define KernelPackage/media-tuner-mt2060
  TITLE := Microtune MT2060 silicon IF tuner
  $(call MediaTuner,mt2060,CONFIG_MEDIA_TUNER_MT2060)
endef

define KernelPackage/media-tuner-mt2060/description
 A driver for the silicon IF tuner MT2060 from Microtune.
endef

$(eval $(call KernelPackage,media-tuner-mt2060))


define KernelPackage/media-tuner-mt2063
  TITLE := Microtune MT2063 silicon IF tuner
  $(call MediaTuner,mt2063,CONFIG_MEDIA_TUNER_MT2063)
endef

define KernelPackage/media-tuner-mt2063/description
 A driver for the silicon IF tuner MT2063 from Microtune.
endef

$(eval $(call KernelPackage,media-tuner-mt2063))


define KernelPackage/media-tuner-mt20xx
  TITLE := Microtune 2032 / 2050 tuners
  $(call MediaTuner,mt20xx,CONFIG_MEDIA_TUNER_MT20XX)
endef

define KernelPackage/media-tuner-mt20xx/description
 Say Y here to include support for the MT2032 / MT2050 tuner.
endef

$(eval $(call KernelPackage,media-tuner-mt20xx))


define KernelPackage/media-tuner-mt2131
  TITLE := Microtune MT2131 silicon tuner
  $(call MediaTuner,mt2131,CONFIG_MEDIA_TUNER_MT2131)
endef

define KernelPackage/media-tuner-mt2131/description
 A driver for the silicon baseband tuner MT2131 from Microtune.
endef

$(eval $(call KernelPackage,media-tuner-mt2131))


define KernelPackage/media-tuner-mt2266
  TITLE := Microtune MT2266 silicon tuner
  $(call MediaTuner,mt2266,CONFIG_MEDIA_TUNER_MT2266)
endef

define KernelPackage/media-tuner-mt2266/description
 A driver for the silicon baseband tuner MT2266 from Microtune.
endef

$(eval $(call KernelPackage,media-tuner-mt2266))


define KernelPackage/media-tuner-mxl5005s
  TITLE := MaxLinear MSL5005S silicon tuner
  $(call MediaTuner,mxl5005s,CONFIG_MEDIA_TUNER_MXL5005S)
endef

define KernelPackage/media-tuner-mxl5005s/description
 A driver for the silicon tuner MXL5005S from MaxLinear.
endef

$(eval $(call KernelPackage,media-tuner-mxl5005s))


define KernelPackage/media-tuner-mxl5007t
  TITLE := MaxLinear MxL5007T silicon tuner
  $(call MediaTuner,mxl5007t,CONFIG_MEDIA_TUNER_MXL5007T)
endef

define KernelPackage/media-tuner-mxl5007t/description
 A driver for the silicon tuner MxL5007T from MaxLinear.
endef

$(eval $(call KernelPackage,media-tuner-mxl5007t))


define KernelPackage/media-tuner-qt1010
  TITLE := Quantek QT1010 silicon tuner
  $(call MediaTuner,qt1010,CONFIG_MEDIA_TUNER_QT1010)
endef

define KernelPackage/media-tuner-qt1010/description
 A driver for the silicon tuner QT1010 from Quantek.
endef

$(eval $(call KernelPackage,media-tuner-qt1010))


define KernelPackage/media-tuner-r820t
  TITLE := Rafael Micro R820T silicon tuner
  $(call MediaTuner,r820t,CONFIG_MEDIA_TUNER_R820T)
endef

define KernelPackage/media-tuner-r820t/description
 Rafael Micro R820T silicon tuner driver.
endef

$(eval $(call KernelPackage,media-tuner-r820t))


define KernelPackage/media-tuner-simple
  SUBMENU := $(TUNER_MENU)
  TITLE := Simple tuner support
  V4L_KCONFIG :=  \
	CONFIG_MEDIA_SUPPORT=m \
	CONFIG_MEDIA_TUNER_SIMPLE
  DEPENDS := +kmod-i2c-core +kmod-media-tuner-tda9887
  FILES :=  \
	$(PKG_BUILD_DIR)/v4l/tuner-simple.ko \
	$(PKG_BUILD_DIR)/v4l/tuner-types.ko
  AUTOLOAD := $(call AutoProbe,tuner-simple tuner-types)
endef

define KernelPackage/media-tuner-simple/description
 Say Y here to include support for various simple tuners.
endef

$(eval $(call KernelPackage,media-tuner-simple))


define KernelPackage/media-tuner-tda18212
  TITLE := NXP TDA18212 silicon tuner
  $(call MediaTuner,tda18212,CONFIG_MEDIA_TUNER_TDA18212)
  DEPENDS += +kmod-regmap
endef

define KernelPackage/media-tuner-tda18212/description
 NXP TDA18212 silicon tuner driver.
endef

$(eval $(call KernelPackage,media-tuner-tda18212))


define KernelPackage/media-tuner-tda18218
  TITLE := NXP TDA18218 silicon tuner
  $(call MediaTuner,tda18218,CONFIG_MEDIA_TUNER_TDA18218)
endef

define KernelPackage/media-tuner-tda18218/description
 NXP TDA18218 silicon tuner driver.
endef

$(eval $(call KernelPackage,media-tuner-tda18218))


define KernelPackage/media-tuner-tda18271
  TITLE := NXP TDA18271 silicon tuner
  $(call MediaTuner,tda18271,CONFIG_MEDIA_TUNER_TDA18271)
endef

define KernelPackage/media-tuner-tda18271/description
 A silicon tuner module. Say Y when you want to support this tuner.
endef

$(eval $(call KernelPackage,media-tuner-tda18271))


define KernelPackage/media-tuner-tda827x
  TITLE := Philips TDA827X silicon tuner
  $(call MediaTuner,tda827x,CONFIG_MEDIA_TUNER_TDA827X)
endef

define KernelPackage/media-tuner-tda827x/description
 A DVB-T silicon tuner module. Say Y when you want to support this tuner.
endef

$(eval $(call KernelPackage,media-tuner-tda827x))


define KernelPackage/media-tuner-tda8290
  TITLE := TDA 8290/8295 + 8275(a)/18271 tuner combo
  DEPENDS := +kmod-media-tuner-tda827x +kmod-media-tuner-tda18271
  $(call MediaTuner,tda8290,CONFIG_MEDIA_TUNER_TDA8290)
endef

define KernelPackage/media-tuner-tda8290/description
 Say Y here to include support for Philips TDA8290+8275(a) tuner.
endef

$(eval $(call KernelPackage,media-tuner-tda8290))


define KernelPackage/media-tuner-tda9887
  TITLE := TDA 9885/6/7 analog IF demodulator
  $(call MediaTuner,tda9887,CONFIG_MEDIA_TUNER_TDA9887)
endef

define KernelPackage/media-tuner-tda9887/description
 Say Y here to include support for Philips TDA9885/6/7
 analog IF demodulator.
endef

$(eval $(call KernelPackage,media-tuner-tda9887))


define KernelPackage/media-tuner-tea5761
  TITLE := TEA 5761 radio tuner
  $(call MediaTuner,tea5761,CONFIG_MEDIA_TUNER_TEA5761)
endef

define KernelPackage/media-tuner-tea5761/description
 Say Y here to include support for the Philips TEA5761 radio tuner.
endef

$(eval $(call KernelPackage,media-tuner-tea5761))


define KernelPackage/media-tuner-tea5767
  TITLE := TEA 5767 radio tuner
  $(call MediaTuner,tea5767,CONFIG_MEDIA_TUNER_TEA5767)
endef

define KernelPackage/media-tuner-tea5767/description
 Say Y here to include support for the Philips TEA5767 radio tuner.
endef

$(eval $(call KernelPackage,media-tuner-tea5767))


define KernelPackage/media-tuner-tua9001
  TITLE := Infineon TUA 9001 silicon tuner
  $(call MediaTuner,tua9001,CONFIG_MEDIA_TUNER_TUA9001)
DEPENDS += +kmod-regmap
endef

define KernelPackage/media-tuner-tua9001/description
 Infineon TUA 9001 silicon tuner driver.
endef

$(eval $(call KernelPackage,media-tuner-tua9001))


define KernelPackage/media-tuner-xc2028
  TITLE := XCeive xc2028/xc3028 tuners
  $(call MediaTuner,tuner-xc2028,CONFIG_MEDIA_TUNER_XC2028)
endef

define KernelPackage/media-tuner-xc2028/description
 Support for the xc2028/xc3028 tuners.
endef

$(eval $(call KernelPackage,media-tuner-xc2028))


define KernelPackage/media-tuner-xc4000
  TITLE := Xceive XC4000 silicon tuner
  $(call MediaTuner,xc4000,CONFIG_MEDIA_TUNER_XC4000)
endef

define KernelPackage/media-tuner-xc4000/description
 A driver for the silicon tuner XC4000 from Xceive.
endef

$(eval $(call KernelPackage,media-tuner-xc4000))


define KernelPackage/media-tuner-xc5000
  TITLE := Xceive XC5000 silicon tuner
  $(call MediaTuner,xc5000,CONFIG_MEDIA_TUNER_XC5000)
endef

define KernelPackage/media-tuner-xc5000/description
 A driver for the silicon tuner XC5000 from Xceive.
 This device is only used inside a SiP called together with a
 demodulator for now.
endef

$(eval $(call KernelPackage,media-tuner-xc5000))

