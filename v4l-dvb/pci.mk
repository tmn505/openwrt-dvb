define DvbPci
  SUBMENU := $(LINUXTV_MENU)
  DEPENDS := @PCI_SUPPORT +kmod-dvb-core +kmod-i2c-core $(1)
endef


define KernelPackage/b2c2-flexcop-pci
  TITLE := Technisat/B2C2 Air/Sky/Cable2PC PCI
  KCONFIG := CONFIG_DVB_B2C2_FLEXCOP_PCI
  FILES := $(PKG_BUILD_DIR)/v4l/b2c2-flexcop-pci.ko
  AUTOLOAD := $(call AutoProbe,b2c2-flexcop-pci)
  $(call DvbPci,+kmod-b2c2-flexcop)
endef

define KernelPackage/b2c2-flexcop-pci/description
 Support for the Air/Sky/CableStar2 PCI card (DVB/ATSC) by Technisat/B2C2.
endef
$(eval $(call KernelPackage,b2c2-flexcop-pci))


define KernelPackage/budget
  TITLE := Budget SAA7146 PCI DVB cards
  KCONFIG := CONFIG_DVB_BUDGET
  FILES := $(PKG_BUILD_DIR)/v4l/budget.ko
  AUTOLOAD := $(call AutoProbe,budget)
  $(call DvbPci,+kmod-budget-core +kmod-dvb-fe-isl6423 +kmod-dvb-fe-l64781 +kmod-dvb-fe-lnbp21 \
	+kmod-dvb-fe-s5h1420 +kmod-dvb-fe-stv0299 +kmod-dvb-fe-stv090x +kmod-dvb-fe-stv6110x \
	+kmod-dvb-fe-tda1004x +kmod-dvb-fe-tda10086 +kmod-dvb-fe-tda8083 +kmod-dvb-fe-tda826x \
	+kmod-dvb-fe-ves1820 +kmod-dvb-fe-ves1x93)
endef

define KernelPackage/budget/description
 Support for simple SAA7146 based DVB cards (so called Budget-
 or Nova-PCI cards) without onboard MPEG2 decoder, and without
 analog inputs or an onboard Common Interface connector.
endef
$(eval $(call KernelPackage,budget))


define KernelPackage/budget-av
  TITLE := Budget cards with analog video inputs
  KCONFIG := CONFIG_DVB_BUDGET_AV
  FILES := $(PKG_BUILD_DIR)/v4l/budget-av.ko
  AUTOLOAD := $(call AutoProbe,budget-av)
  $(call DvbPci,+kmod-budget-core +kmod-saa7146-vv +kmod-dvb-fe-stb0899 +kmod-dvb-fe-stv0299 \
	+kmod-dvb-fe-tda10021 +kmod-dvb-fe-tda10023 +kmod-dvb-fe-tda1004x +kmod-dvb-fe-tda8261 \
	+kmod-dvb-fe-tua6100 +kmod-dvb-pll)
endef

define KernelPackage/budget-av/description
 Support for simple SAA7146 based DVB cards
 (so called Budget- or Nova-PCI cards) without onboard
 MPEG2 decoder, but with one or more analog video inputs.
endef
$(eval $(call KernelPackage,budget-av))


define KernelPackage/budget-ci
  TITLE := Budget SAA7146 PCI DVB cards with CI slot
  KCONFIG := CONFIG_DVB_BUDGET_CI
  FILES := $(PKG_BUILD_DIR)/v4l/budget-ci.ko
  AUTOLOAD := $(call AutoProbe,budget-ci)
  $(call DvbPci,+kmod-budget-core +kmod-dvb-fe-lnbp21 +kmod-dvb-fe-stb0899 +kmod-dvb-fe-stb6000 \
	+kmod-dvb-fe-stb6100 +kmod-dvb-fe-stv0288 +kmod-dvb-fe-stv0297 +kmod-dvb-fe-stv0299 \
	+kmod-dvb-fe-tda10023 +kmod-dvb-fe-tda1004x +kmod-media-tuner-tda827x +kmod-rc-core)
endef

define KernelPackage/budget-ci/description
 Support for simple SAA7146 based DVB cards
 (so called Budget- or Nova-PCI cards) without onboard
 MPEG2 decoder, but with onboard Common Interface connector.
endef
$(eval $(call KernelPackage,budget-ci))


define KernelPackage/budget-core
  TITLE := SAA7146 DVB cards (aka Budget, Nova-PCI)
  KCONFIG := CONFIG_DVB_BUDGET_CORE
  FILES := $(PKG_BUILD_DIR)/v4l/budget-core.ko
  AUTOLOAD := $(call AutoProbe,budget-core)
  $(call DvbPci,+kmod-saa7146 +kmod-ttpci-eeprom)
endef

define KernelPackage/budget-core/description
 Support for simple SAA7146 based DVB cards
 (so called Budget- or Nova-PCI cards) without onboard
 MPEG2 decoder.
endef
$(eval $(call KernelPackage,budget-core))


define KernelPackage/cx18
  TITLE := Conexant cx23418 MPEG encoder support
  KCONFIG := CONFIG_VIDEO_CX18
  FILES := $(PKG_BUILD_DIR)/v4l/cx18.ko
  AUTOLOAD := $(call AutoProbe,cx18)
  $(call DvbPci,+kmod-cx2341x +kmod-dvb-fe-mt352 +kmod-dvb-fe-s5h1409 +kmod-dvb-fe-s5h1411 \
	+kmod-dvb-fe-zl10353 +kmod-i2c-algo-bit +kmod-media-tuner-mxl5005s \
	+kmod-media-tuner-tda18271 +kmod-media-tuner-xc2028 +kmod-tveeprom +kmod-videobuf)
endef

define KernelPackage/cx18/description
 This is a video4linux driver for Conexant cx23418 based
 PCI combo video recorder devices.
 This is used in devices such as the Hauppauge HVR-1600 cards.
endef
$(eval $(call KernelPackage,cx18))


define KernelPackage/cx23885
  TITLE := Conexant cx23885 (2388x successor) support
  KCONFIG := CONFIG_VIDEO_CX23885 CONFIG_MEDIA_ALTERA_CI=n
  FILES := $(PKG_BUILD_DIR)/v4l/cx23885.ko
  AUTOLOAD := $(call AutoProbe,cx23885)
  $(call DvbPci,+kmod-cx2341x +kmod-dvb-fe-atbm8830 +kmod-dvb-fe-cx24116 +kmod-dvb-fe-cx24117 \
	+kmod-dvb-fe-dib0070 +kmod-dvb-fe-dib7000p +kmod-dvb-fe-drxk +kmod-dvb-fe-ds3000 \
	+kmod-dvb-fe-lgdt3305 +kmod-dvb-fe-lgdt3306a +kmod-dvb-fe-lgdt330x +kmod-dvb-fe-lgs8gxx \
	+kmod-dvb-fe-lnbp21 +kmod-dvb-fe-m88ds3103 +kmod-dvb-fe-mb86a20s +kmod-dvb-fe-s5h1409 \
	+kmod-dvb-fe-s5h1411 +kmod-dvb-fe-stb6100 +kmod-dvb-fe-stv0367 +kmod-dvb-fe-stv0900 \
	+kmod-dvb-fe-stv090x +kmod-dvb-fe-stv6110 +kmod-dvb-fe-tda10048 +kmod-dvb-fe-ts2020 \
	+kmod-dvb-fe-zl10353 +kmod-media-tuner-max2165 +kmod-media-tuner-mt2063 \
	+kmod-media-tuner-mt2131 +kmod-media-tuner-tda18271 +kmod-media-tuner-tda8290 \
	+kmod-media-tuner-simple +kmod-media-tuner-xc2028 +kmod-media-tuner-xc4000 \
	+kmod-media-tuner-xc5000 +kmod-rc-core +kmod-sound-core +kmod-tveeprom \
	+kmod-videobuf2-dma-sg +kmod-videobuf2-dvb +kmod-videobuf2-v4l2)
endef

define KernelPackage/cx23885/description
 This is a video4linux driver for Conexant 23885 based TV cards.
endef
$(eval $(call KernelPackage,cx23885))


define KernelPackage/cx25821
  TITLE := Conexant cx25821 support
  KCONFIG := CONFIG_VIDEO_CX25821
  FILES := $(PKG_BUILD_DIR)/v4l/cx25821.ko
  AUTOLOAD := $(call AutoProbe,cx25821)
  $(call DvbPci,+kmod-videobuf2-dma-sg +kmod-videobuf2-v4l2)
endef

define KernelPackage/cx25821/description
 This is a video4linux driver for Conexant 25821 based TV cards.
endef
$(eval $(call KernelPackage,cx25821))


define KernelPackage/cx88-dvb
  TITLE := Conexant 2388x (bt878 successor) support
  KCONFIG := \
	CONFIG_VIDEO_CX88 \
	CONFIG_VIDEO_CX88_DVB \
	CONFIG_VIDEO_CX88_ENABLE_VP3054 \
	CONFIG_VIDEO_CX88_VP3054 \
	CONFIG_VIDEO_CX88_MPEG \
	CONFIG_VIDEO_CX88_ALSA=n \
	CONFIG_VIDEO_CX88_BLACKBIRD=n
  FILES := \
	$(PKG_BUILD_DIR)/v4l/cx88xx.ko \
	$(PKG_BUILD_DIR)/v4l/cx8800.ko \
	$(PKG_BUILD_DIR)/v4l/cx8802.ko \
	$(PKG_BUILD_DIR)/v4l/cx88-dvb.ko \
	$(PKG_BUILD_DIR)/v4l/cx88-vp3054-i2c.ko
  AUTOLOAD := $(call AutoProbe,cx88-dvb)
  $(call DvbPci, +kmod-dvb-fe-cx22702 +kmod-dvb-fe-cx24116 +kmod-dvb-fe-cx24123 +kmod-dvb-fe-ds3000 \
	+kmod-dvb-fe-isl6421 +kmod-dvb-fe-lgdt330x +kmod-dvb-fe-mb86a16 +kmod-dvb-fe-mt352 \
	+kmod-dvb-fe-nxt200x +kmod-dvb-fe-or51132 +kmod-dvb-fe-s5h1409 +kmod-dvb-fe-s5h1411 \
	+kmod-dvb-fe-stb6000 +kmod-dvb-fe-stb6100 +kmod-dvb-fe-stv0288 +kmod-dvb-fe-stv0299 \
	+kmod-dvb-fe-stv090x +kmod-dvb-fe-tas2101 +kmod-dvb-fe-ts2020 +kmod-dvb-fe-zl10353 \
	+kmod-dvb-pll +kmod-i2c-algo-bit +kmod-media-tuner-tda9887 +kmod-media-tuner-simple \
	+kmod-media-tuner-xc2028 +kmod-media-tuner-xc4000 +kmod-media-tuner-xc5000 +kmod-rc-core \
	+kmod-tveeprom +kmod-videobuf2-dma-sg +kmod-videobuf2-dvb +kmod-videobuf2-v4l2 \
	+kmod-media-tuner-av201x)
endef

define KernelPackage/cx88-dvb/description
 This adds support for DVB/ATSC cards based on the Conexant 2388x chip.
endef
$(eval $(call KernelPackage,cx88-dvb))


define KernelPackage/ddbridge
  TITLE := Digital Devices bridge support
  KCONFIG := CONFIG_DVB_DDBRIDGE CONFIG_DVB_DDBRIDGE_MSIENABLE
  FILES := \
	$(PKG_BUILD_DIR)/v4l/ddbridge.ko \
	$(PKG_BUILD_DIR)/v4l/ddbridge-dummy-fe.ko
  AUTOLOAD := $(call AutoProbe,ddbridge)
  $(call DvbPci,+kmod-dvb-fe-cxd2841er +kmod-dvb-fe-drxk +kmod-dvb-fe-lnbh25 +kmod-dvb-fe-lnbp21 \
	+kmod-dvb-fe-mxl5xx +kmod-dvb-fe-stv0367 +kmod-dvb-fe-stv090x +kmod-dvb-fe-stv0910 \
	+kmod-dvb-fe-stv6110x +kmod-dvb-fe-stv6111 +kmod-dvb-fe-tda18271c2dd)
endef

define KernelPackage/ddbridge/description
 Support for cards with the Digital Devices PCI express bridge:
  - Octopus PCIe Bridge
  - Octopus mini PCIe Bridge
  - Octopus LE
  - DuoFlex S2 Octopus
  - DuoFlex CT Octopus
  - cineS2(v6)
  - CineCTv6 and DuoFlex CT (STV0367-based)
  - CineCTv7 and DuoFlex CT2/C2T2/C2T2I (Sony CXD28xx-based)
  - MaxA8 series
  - CineS2 V7/V7A and DuoFlex S2 V4 (ST STV0910-based)
  - Max S4/8
endef
$(eval $(call KernelPackage,ddbridge))


define KernelPackage/mantis
  TITLE := Mantis/Hopper PCI bridge based devices
  KCONFIG := CONFIG_MANTIS_CORE CONFIG_DVB_MANTIS CONFIG_DVB_HOPPER
  FILES := \
	$(PKG_BUILD_DIR)/v4l/mantis_core.ko \
	$(PKG_BUILD_DIR)/v4l/mantis.ko \
	$(PKG_BUILD_DIR)/v4l/hopper.ko
  AUTOLOAD := $(call AutoProbe,mantis hopper)
  $(call DvbPci,+kmod-dvb-fe-lnbp21 +kmod-dvb-fe-mb86a16 +kmod-dvb-fe-stb0899 +kmod-dvb-fe-stb6100 \
	+kmod-dvb-fe-stv0299 +kmod-dvb-fe-tda10021 +kmod-dvb-fe-tda10023 +kmod-dvb-fe-tda665x \
	+kmod-dvb-fe-zl10353 +kmod-rc-core)
endef

define KernelPackage/mantis/description
 Support for PCI cards based on the Mantis and Hopper PCi bridge.
endef
$(eval $(call KernelPackage,mantis))


define KernelPackage/netup-unidvb
  TITLE := NetUP Universal DVB card support
  KCONFIG := CONFIG_DVB_NETUP_UNIDVB
  FILES := $(PKG_BUILD_DIR)/v4l/netup-unidvb.ko
  AUTOLOAD := $(call AutoProbe,netup-unidvb)
  $(call DvbPci,+kmod-dvb-fe-ascot2e +kmod-dvb-fe-cxd2841er +kmod-dvb-fe-helene +kmod-dvb-fe-horus3a \
	+kmod-dvb-fe-lnbh25 +kmod-videobuf2-dvb +kmod-videobuf2-v4l2)
endef

define KernelPackage/netup-unidvb/description
 Support for NetUP PCI express Universal DVB card.
 Card can receive two independent streams in following standards:
 DVB-S/S2, T/T2, C/C2
 Two CI slots available for CAM modules.
endef
$(eval $(call KernelPackage,netup-unidvb))


define KernelPackage/ngene
  TITLE := Micronas nGene bridge
  KCONFIG := CONFIG_DVB_NGENE
  FILES := $(PKG_BUILD_DIR)/v4l/ngene.ko
  AUTOLOAD := $(call AutoProbe,ngene)
  $(call DvbPci,+kmod-dvb-fe-cxd2841er +kmod-dvb-fe-drxd +kmod-dvb-fe-drxk +kmod-dvb-fe-lgdt330x \
	+kmod-dvb-fe-lnbh25 +kmod-dvb-fe-lnbp21 +kmod-dvb-fe-stv0367 +kmod-dvb-fe-stv090x \
	+kmod-dvb-fe-stv0910 +kmod-dvb-fe-stv6110x +kmod-dvb-fe-stv6111 +kmod-dvb-fe-tda18271c2dd \
	+kmod-dvb-pll +kmod-media-tuner-mt2131)
endef

define KernelPackage/ngene/description
 Support for Micronas PCI express cards with nGene bridge.
endef
$(eval $(call KernelPackage,ngene))


define KernelPackage/pluto2
  TITLE := Pluto2 cards
  KCONFIG := CONFIG_DVB_PLUTO2
  FILES := $(PKG_BUILD_DIR)/v4l/pluto2.ko
  AUTOLOAD := $(call AutoProbe,pluto2)
  $(call DvbPci,+kmod-dvb-fe-tda1004x +kmod-i2c-algo-bit)
endef

define KernelPackage/pluto2/description
 Support for PCI cards based on the Pluto2 FPGA like the Satelco
 Easywatch Mobile Terrestrial DVB-T Receiver.
endef
$(eval $(call KernelPackage,pluto2))


define KernelPackage/saa7134-dvb
  TITLE := DVB/ATSC Support for Philips SAA7134 based TV cards
  KCONFIG := CONFIG_VIDEO_SAA7134 CONFIG_VIDEO_SAA7134_DVB
  FILES := $(PKG_BUILD_DIR)/v4l/saa7134.ko $(PKG_BUILD_DIR)/v4l/saa7134-dvb.ko
  AUTOLOAD := $(call AutoProbe,saa7134-dvb)
  $(call DvbPci,+kmod-dvb-fe-isl6405 +kmod-dvb-fe-isl6421 +kmod-dvb-fe-lgdt3305 +kmod-dvb-fe-lgs8gxx \
	+kmod-dvb-fe-lnbp21 +kmod-dvb-fe-mb86a20s +kmod-dvb-fe-mt312 +kmod-dvb-fe-mt352 \
	+kmod-dvb-fe-nxt200x +kmod-media-tuner-qt1010 +kmod-dvb-fe-s5h1411 +kmod-dvb-fe-tda10048 \
	+kmod-dvb-fe-tda1004x +kmod-dvb-fe-tda10086 +kmod-dvb-fe-tda826x +kmod-dvb-fe-zl10036 \
	+kmod-dvb-fe-zl10039 +kmod-dvb-fe-zl10353 +kmod-dvb-pll +kmod-media-tuner-tda18271 \
	+kmod-media-tuner-tda827x +kmod-media-tuner-tda8290 +kmod-media-tuner-simple \
	+kmod-media-tuner-xc2028 +kmod-media-tuner-xc5000 +kmod-rc-core +kmod-tveeprom \
	+kmod-videobuf2-dma-sg +kmod-videobuf2-dvb +kmod-videobuf2-v4l2)
endef

define KernelPackage/saa7134-dvb/description
 This is a video4linux driver for Philips SAA713x based TV cards.
endef
$(eval $(call KernelPackage,saa7134-dvb))


define KernelPackage/saa7164
  TITLE := NXP SAA7164 support
  KCONFIG := CONFIG_VIDEO_SAA7164
  FILES := $(PKG_BUILD_DIR)/v4l/saa7164.ko
  AUTOLOAD := $(call AutoProbe,saa7164)
  $(call DvbPci,+kmod-dvb-fe-lgdt3306a +kmod-dvb-fe-s5h1411 +kmod-dvb-fe-tda10048 \
	+kmod-media-tuner-tda18271 +kmod-tveeprom)
endef

define KernelPackage/saa7164/description
 This is a video4linux driver for NXP SAA7164 based TV cards.
endef
$(eval $(call KernelPackage,saa7164))


define KernelPackage/saa716x-core
  TITLE := SAA7160/1/2 PCI Express bridge based devices
  KCONFIG := CONFIG_SAA716X_SUPPORT CONFIG_SAA716X_CORE
  FILES := $(PKG_BUILD_DIR)/v4l/saa716x_core.ko
  AUTOLOAD := $(call AutoProbe,saa716x_core)
  $(call DvbPci,@V4L_SRC_TBSDTV)
endef

define KernelPackage/saa716x-core/description
 This is a video4linux driver for NXP SAA7160/1/2 based TV cards.
endef
$(eval $(call KernelPackage,saa716x-core))


define KernelPackage/saa716x-hybrid
  SUBMENU := $(LINUXTV_MENU)
  TITLE := SAA7160/1/2 based Hybrid PCIe cards (DVB + Analog)
  KCONFIG := CONFIG_DVB_SAA716X_HYBRID
  FILES := $(PKG_BUILD_DIR)/v4l/saa716x_hybrid.ko
  AUTOLOAD := $(call AutoProbe,saa716x_hybrid)
  DEPENDS := @V4L_SRC_TBSDTV +kmod-dvb-fe-tda1004x +kmod-media-tuner-tda827x +kmod-saa716x-core
endef

define KernelPackage/saa716x-hybrid/description
 Support for the SAA7160/1/2 based Hybrid PCIe DVB cards
 Currently supported devices are:
  * Avermedia H-788 (DVB-T)
  * Avermedia HC-82 (DVB-T)
  * NXP Reference (Atlantis) (DVB-T x2)
  * NXP Reference (Nemo) (DVB-T)
  * Twinhan/Azurewave VP-6090 (DVB-S x2, DVB-T x2)
endef
$(eval $(call KernelPackage,saa716x-hybrid))


define KernelPackage/saa716x-tbs-dvb
  SUBMENU := $(LINUXTV_MENU)
  TITLE := SAA7160/1/2 based Budget PCIe cards (DVB only)
  KCONFIG := CONFIG_DVB_SAA716X_TBS
  FILES := $(PKG_BUILD_DIR)/v4l/saa716x_tbs-dvb.ko
  AUTOLOAD := $(call AutoProbe,saa716x_tbs-dvb)
  DEPENDS := @V4L_SRC_TBSDTV +kmod-dvb-fe-cx24117 +kmod-dvb-fe-tas2101 +kmod-dvb-fe-cxd2820r \
	+kmod-dvb-fe-isl6422 +kmod-dvb-fe-mb86a16 +kmod-dvb-fe-stb6100 +kmod-dvb-fe-stv090x \
	+kmod-dvb-fe-stv091x +kmod-dvb-fe-stv6110x +kmod-i2c-algo-bit +kmod-media-tuner-av201x \
	+kmod-media-tuner-stv6120 +kmod-saa716x-core
endef

define KernelPackage/saa716x-tbs-dvb/description
 Support for the SAA7160/1/2 based Budget PCIe DVB cards
 Currently supported devices are:
  * KNC1 Dual S2 (DVB-S, DVB-S/S2)
  * Twinhan/Azurewave VP-1028 (DVB-S)
  * Twinhan/Azurewave VP-3071 (DVB-T x2)
  * Twinhan/Azurewave VP-6002 (DVB-S)
endef
$(eval $(call KernelPackage,saa716x-tbs-dvb))


define KernelPackage/smipcie
  TITLE := SMI PCIe DVBSky cards
  KCONFIG := CONFIG_DVB_SMIPCIE
  FILES := $(PKG_BUILD_DIR)/v4l/smipcie.ko
  AUTOLOAD := $(call AutoProbe,smipcie)
  $(call DvbPci,+kmod-dvb-fe-m88ds3103 +kmod-i2c-algo-bit +kmod-rc-core)
endef

define KernelPackage/smipcie/description
 Support for cards with SMI PCIe bridge:
  - DVBSky S950 V3
  - DVBSky S952 V3
  - DVBSky T9580 V3
endef
$(eval $(call KernelPackage,smipcie))


define KernelPackage/tbs-pcie-dvb
  TITLE := TBS PCIe capture cards
  KCONFIG := CONFIG_TBS_PCIE_DVB
  FILES := $(PKG_BUILD_DIR)/v4l/tbs_pcie-dvb.ko
  AUTOLOAD := $(call AutoProbe,tbs_pcie-dvb)
  $(call DvbPci,@V4L_SRC_TBSDTV +kmod-sound-core +kmod-videobuf2-dma-sg +kmod-videobuf2-v4l2)
endef

define KernelPackage/tbs-pcie-dvb/description
 Support for TBS PCIe DVB cards.
endef
$(eval $(call KernelPackage,tbs-pcie-dvb))


define KernelPackage/tbsecp3
  TITLE := TBS ECP3 FPGA based cards
  KCONFIG := CONFIG_DVB_TBSECP3
  FILES := $(PKG_BUILD_DIR)/v4l/tbsecp3.ko
  AUTOLOAD := $(call AutoProbe,tbsecp3)
  $(call DvbPci,@V4L_SRC_TBSDTV +kmod-dvb-fe-gx1133 +kmod-dvb-fe-mn88436 +kmod-dvb-fe-mxl58x \
	+kmod-dvb-fe-stv091x +kmod-dvb-fe-tas2101 +kmod-dvb-fe-tas2971 +kmod-media-tuner-av201x \
	+kmod-media-tuner-stv6120)
endef

define KernelPackage/tbsecp3/description
 Support for cards with TBS ECP3 FPGA based PCIe bridge.
endef
$(eval $(call KernelPackage,tbsecp3))
