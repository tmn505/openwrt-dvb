TUNER_MENU:=Media tuners

define MediaTuner
  SUBMENU := $(TUNER_MENU)
  V4L_KCONFIG := \
	CONFIG_MEDIA_SUPPORT=m \
	CONFIG_MEDIA_DIGITAL_TV_SUPPORT=m \
	$2
  DEPENDS := +kmod-i2c-core
  FILES := $(PKG_BUILD_DIR)/v4l/$1.ko
  AUTOLOAD := $(call AutoProbe,$1)
endef


define KernelPackage/media-tuner-av201x
  TITLE := Airoha Technology AV201x
  $(call MediaTuner,av201x,CONFIG_MEDIA_TUNER_AV201X)
  DEPENDS += @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,media-tuner-av201x))


define KernelPackage/media-tuner-e4000
  TITLE := Elonics E4000
  $(call MediaTuner,e4000,CONFIG_MEDIA_TUNER_E4000)
  DEPENDS += +kmod-regmap +kmod-v4l2-core
endef
$(eval $(call KernelPackage,media-tuner-e4000))


define KernelPackage/media-tuner-fc0011
  TITLE := Fitipower FC0011
  $(call MediaTuner,fc0011,CONFIG_MEDIA_TUNER_FC0011)
endef
$(eval $(call KernelPackage,media-tuner-fc0011))


define KernelPackage/media-tuner-fc0012
  TITLE := Fitipower FC0012
  $(call MediaTuner,fc0012,CONFIG_MEDIA_TUNER_FC0012)
endef
$(eval $(call KernelPackage,media-tuner-fc0012))


define KernelPackage/media-tuner-fc0013
  TITLE := Fitipower FC0013
  $(call MediaTuner,fc0013,CONFIG_MEDIA_TUNER_FC0013)
endef
$(eval $(call KernelPackage,media-tuner-fc0013))


define KernelPackage/media-tuner-fc2580
  TITLE := FCI FC2580
  $(call MediaTuner,fc2580,CONFIG_MEDIA_TUNER_FC2580)
  DEPENDS += +kmod-regmap +kmod-v4l2-core
endef
$(eval $(call KernelPackage,media-tuner-fc2580))


define KernelPackage/media-tuner-it913x
  TITLE := ITE Tech IT913x
  $(call MediaTuner,it913x,CONFIG_MEDIA_TUNER_IT913X)
  DEPENDS += +kmod-regmap
endef
$(eval $(call KernelPackage,media-tuner-it913x))


define KernelPackage/media-tuner-m88rs6000t
  TITLE := Montage M88RS6000
  $(call MediaTuner,m88rs6000t,MEDIA_TUNER_M88RS6000T)
  DEPENDS += +kmod-regmap
endef
$(eval $(call KernelPackage,media-tuner-m88rs6000t))


define KernelPackage/media-tuner-max2165
  TITLE := Maxim MAX2165
  $(call MediaTuner,max2165,CONFIG_MEDIA_TUNER_MAX2165)
endef
$(eval $(call KernelPackage,media-tuner-max2165))


define KernelPackage/media-tuner-mc44s803
  TITLE := Freescale MC44S803
  $(call MediaTuner,mc44s803,CONFIG_MEDIA_TUNER_MC44S803)
endef
$(eval $(call KernelPackage,media-tuner-mc44s803))


define KernelPackage/media-tuner-msi001
  TITLE := Mirics MSi001
  $(call MediaTuner,msi001,CONFIG_MEDIA_TUNER_MSI001)
  DEPENDS += +kmod-v4l2-core
endef
$(eval $(call KernelPackage,media-tuner-msi001))


define KernelPackage/media-tuner-mt2060
  TITLE := Microtune MT2060
  $(call MediaTuner,mt2060,CONFIG_MEDIA_TUNER_MT2060)
endef
$(eval $(call KernelPackage,media-tuner-mt2060))


define KernelPackage/media-tuner-mt2063
  TITLE := Microtune MT2063
  $(call MediaTuner,mt2063,CONFIG_MEDIA_TUNER_MT2063)
endef
$(eval $(call KernelPackage,media-tuner-mt2063))


define KernelPackage/media-tuner-mt20xx
  TITLE := Microtune 2032/2050
  $(call MediaTuner,mt20xx,CONFIG_MEDIA_TUNER_MT20XX)
endef
$(eval $(call KernelPackage,media-tuner-mt20xx))


define KernelPackage/media-tuner-mt2131
  TITLE := Microtune MT2131
  $(call MediaTuner,mt2131,CONFIG_MEDIA_TUNER_MT2131)
endef
$(eval $(call KernelPackage,media-tuner-mt2131))


define KernelPackage/media-tuner-mt2266
  TITLE := Microtune MT2266
  $(call MediaTuner,mt2266,CONFIG_MEDIA_TUNER_MT2266)
endef
$(eval $(call KernelPackage,media-tuner-mt2266))


define KernelPackage/media-tuner-mxl301rf
  TITLE := MaxLinear MxL301RF
  $(call MediaTuner,mxl301rf,CONFIG_MEDIA_TUNER_MXL301RF)
endef
$(eval $(call KernelPackage,media-tuner-mxl301rf))


define KernelPackage/media-tuner-mxl603
  TITLE := MaxLinear MxL603
  $(call MediaTuner,mxl603,CONFIG_MEDIA_TUNER_MXL603)
  DEPENDS += @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,media-tuner-mxl603))


define KernelPackage/media-tuner-mxl5005s
  TITLE := MaxLinear MxL5005S
  $(call MediaTuner,mxl5005s,CONFIG_MEDIA_TUNER_MXL5005S)
endef
$(eval $(call KernelPackage,media-tuner-mxl5005s))


define KernelPackage/media-tuner-mxl5007t
  TITLE := MaxLinear MxL5007T
  $(call MediaTuner,mxl5007t,CONFIG_MEDIA_TUNER_MXL5007T)
endef
$(eval $(call KernelPackage,media-tuner-mxl5007t))


define KernelPackage/media-tuner-qm1d1b0004
  TITLE := Sharp QM1D1B0004
  $(call MediaTuner,qm1d1b0004,CONFIG_MEDIA_TUNER_QM1D1B0004)
endef
$(eval $(call KernelPackage,media-tuner-qm1d1b0004))


define KernelPackage/media-tuner-qm1d1c0042
  TITLE := Sharp QM1D1C0042
  $(call MediaTuner,qm1d1c0042,CONFIG_MEDIA_TUNER_QM1D1C0042)
endef
$(eval $(call KernelPackage,media-tuner-qm1d1c0042))


define KernelPackage/media-tuner-qt1010
  TITLE := Quantek QT1010
  $(call MediaTuner,qt1010,CONFIG_MEDIA_TUNER_QT1010)
endef
$(eval $(call KernelPackage,media-tuner-qt1010))


define KernelPackage/media-tuner-r820t
  TITLE := Rafael Micro R820T
  $(call MediaTuner,r820t,CONFIG_MEDIA_TUNER_R820T)
endef
$(eval $(call KernelPackage,media-tuner-r820t))


define KernelPackage/media-tuner-r848
  TITLE := Rafael Micro R848
  $(call MediaTuner,r848,CONFIG_MEDIA_TUNER_R848)
  DEPENDS += @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,media-tuner-r848))


define KernelPackage/media-tuner-si2157
  TITLE := Silicon Labs Si2157
  $(call MediaTuner,si2157,CONFIG_MEDIA_TUNER_SI2157)
  DEPENDS += +kmod-media +kmod-regmap
endef
$(eval $(call KernelPackage,media-tuner-si2157))


define KernelPackage/media-tuner-simple
  SUBMENU := $(TUNER_MENU)
  TITLE := Simple tuner support
  V4L_KCONFIG :=  \
	CONFIG_MEDIA_SUPPORT=m \
	CONFIG_MEDIA_TUNER_SIMPLE
  DEPENDS := +kmod-i2c-core
  FILES :=  \
	$(PKG_BUILD_DIR)/v4l/tuner-simple.ko \
	$(PKG_BUILD_DIR)/v4l/tuner-types.ko
  AUTOLOAD := $(call AutoProbe,tuner-simple tuner-types)
endef
$(eval $(call KernelPackage,media-tuner-simple))


define KernelPackage/media-tuner-stv6120
  TITLE := STMicroelectronics STV6120
  $(call MediaTuner,stv6120,CONFIG_MEDIA_TUNER_STV6120)
  DEPENDS += @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,media-tuner-stv6120))


define KernelPackage/media-tuner-tda18212
  TITLE := NXP TDA18212
  $(call MediaTuner,tda18212,CONFIG_MEDIA_TUNER_TDA18212)
  DEPENDS += +kmod-regmap
endef
$(eval $(call KernelPackage,media-tuner-tda18212))


define KernelPackage/media-tuner-tda18218
  TITLE := NXP TDA18218
  $(call MediaTuner,tda18218,CONFIG_MEDIA_TUNER_TDA18218)
endef
$(eval $(call KernelPackage,media-tuner-tda18218))


define KernelPackage/media-tuner-tda18250
  TITLE := NXP TDA18250
  $(call MediaTuner,tda18250,CONFIG_MEDIA_TUNER_TDA18250)
  DEPENDS += +kmod-regmap
endef
$(eval $(call KernelPackage,media-tuner-tda18250))


define KernelPackage/media-tuner-tda18271
  TITLE := NXP TDA18271
  $(call MediaTuner,tda18271,CONFIG_MEDIA_TUNER_TDA18271)
endef
$(eval $(call KernelPackage,media-tuner-tda18271))


define KernelPackage/media-tuner-tda18273
  TITLE := NXP TDA18273
  $(call MediaTuner,tda18273,CONFIG_MEDIA_TUNER_TDA18273)
  DEPENDS += @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,media-tuner-tda18273))


define KernelPackage/media-tuner-tda827x
  TITLE := Philips TDA827X
  $(call MediaTuner,tda827x,CONFIG_MEDIA_TUNER_TDA827X)
endef
$(eval $(call KernelPackage,media-tuner-tda827x))


define KernelPackage/media-tuner-tda8290
  TITLE := Philips TDA 8290/8295 + 8275(a)/18271
  $(call MediaTuner,tda8290,CONFIG_MEDIA_TUNER_TDA8290)
endef
$(eval $(call KernelPackage,media-tuner-tda8290))


define KernelPackage/media-tuner-tda9887
  TITLE := Philips TDA 9885/6/7
  $(call MediaTuner,tda9887,CONFIG_MEDIA_TUNER_TDA9887)
endef
$(eval $(call KernelPackage,media-tuner-tda9887))


define KernelPackage/media-tuner-tea5761
  TITLE := Philips TEA5761
  $(call MediaTuner,tea5761,CONFIG_MEDIA_TUNER_TEA5761)
endef
$(eval $(call KernelPackage,media-tuner-tea5761))


define KernelPackage/media-tuner-tea5767
  TITLE := Philips TEA5767
  $(call MediaTuner,tea5767,CONFIG_MEDIA_TUNER_TEA5767)
endef
$(eval $(call KernelPackage,media-tuner-tea5767))


define KernelPackage/media-tuner-tua9001
  TITLE := Infineon TUA 9001
  $(call MediaTuner,tua9001,CONFIG_MEDIA_TUNER_TUA9001)
  DEPENDS += +kmod-regmap
endef
$(eval $(call KernelPackage,media-tuner-tua9001))


define KernelPackage/media-tuner-xc2028
  TITLE := XCeive xc2028/xc3028
  $(call MediaTuner,tuner-xc2028,CONFIG_MEDIA_TUNER_XC2028)
endef
$(eval $(call KernelPackage,media-tuner-xc2028))


define KernelPackage/media-tuner-xc4000
  TITLE := Xceive XC4000
  $(call MediaTuner,xc4000,CONFIG_MEDIA_TUNER_XC4000)
endef
$(eval $(call KernelPackage,media-tuner-xc4000))


define KernelPackage/media-tuner-xc5000
  TITLE := Xceive XC5000
  $(call MediaTuner,xc5000,CONFIG_MEDIA_TUNER_XC5000)
endef
$(eval $(call KernelPackage,media-tuner-xc5000))
