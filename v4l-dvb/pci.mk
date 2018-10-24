define AddDepends/dvb-pci
  SUBMENU := $(DVB_MENU)
  DEPENDS := @PCI_SUPPORT +kmod-dvb-core +kmod-i2c-core $1
endef


define KernelPackage/b2c2-flexcop-pci
  TITLE := Technisat/B2C2 Air/Sky/Cable2PC PCI
  V4L_KCONFIG := CONFIG_DVB_B2C2_FLEXCOP_PCI
  FILES := $(PKG_BUILD_DIR)/v4l/b2c2-flexcop-pci.ko
  AUTOLOAD := $(call AutoProbe,b2c2-flexcop-pci)
  $(call AddDepends/dvb-pci,+kmod-b2c2-flexcop)
endef

define KernelPackage/b2c2-flexcop-pci/description
 Support for the Air/Sky/CableStar2 PCI card (DVB/ATSC) by Technisat/B2C2.
endef

$(eval $(call KernelPackage,b2c2-flexcop-pci))

define KernelPackage/budget
  TITLE := Budget SAA7146 PCI DVB cards
  V4L_KCONFIG := CONFIG_DVB_BUDGET
  FILES := $(PKG_BUILD_DIR)/v4l/budget.ko
  AUTOLOAD := $(call AutoProbe,budget)
  $(call AddDepends/dvb-pci,+kmod-budget-core)
endef

define KernelPackage/budget/description
 Support for simple SAA7146 based DVB cards (so called Budget-
 or Nova-PCI cards) without onboard MPEG2 decoder, and without
 analog inputs or an onboard Common Interface connector.
endef

$(eval $(call KernelPackage,budget))


define KernelPackage/budget-av
  TITLE := Budget cards with analog video inputs
  V4L_KCONFIG := CONFIG_DVB_BUDGET_AV
  FILES := $(PKG_BUILD_DIR)/v4l/budget-av.ko
  AUTOLOAD := $(call AutoProbe,budget-av)
  $(call AddDepends/dvb-pci,+kmod-budget-core +kmod-saa7146-vv)
endef

define KernelPackage/budget-av/description
 Support for simple SAA7146 based DVB cards
 (so called Budget- or Nova-PCI cards) without onboard
 MPEG2 decoder, but with one or more analog video inputs.
endef

$(eval $(call KernelPackage,budget-av))


define KernelPackage/budget-ci
  TITLE := Budget SAA7146 PCI DVB cards with CI slot
  V4L_KCONFIG := CONFIG_DVB_BUDGET_CI
  FILES := $(PKG_BUILD_DIR)/v4l/budget-ci.ko
  AUTOLOAD := $(call AutoProbe,budget-ci)
  $(call AddDepends/dvb-pci,+kmod-budget-core +kmod-rc-core)
endef

define KernelPackage/budget-ci/description
 Support for simple SAA7146 based DVB cards
 (so called Budget- or Nova-PCI cards) without onboard
 MPEG2 decoder, but with onboard Common Interface connector.
endef

$(eval $(call KernelPackage,budget-ci))


define KernelPackage/budget-core
  TITLE := SAA7146 DVB cards (aka Budget, Nova-PCI)
  V4L_KCONFIG := CONFIG_DVB_BUDGET_CORE
  FILES := $(PKG_BUILD_DIR)/v4l/budget-core.ko
  AUTOLOAD := $(call AutoProbe,budget-core)
  $(call AddDepends/dvb-pci,+kmod-saa7146 +kmod-ttpci-eeprom)
endef

define KernelPackage/budget-core/description
 Support for simple SAA7146 based DVB cards
 (so called Budget- or Nova-PCI cards) without onboard
 MPEG2 decoder.
endef

$(eval $(call KernelPackage,budget-core))


define KernelPackage/budget-patch
  TITLE := AV7110 cards with Budget Patch
  V4L_KCONFIG := CONFIG_DVB_BUDGET_PATCH
  FILES := $(PKG_BUILD_DIR)/v4l/budget-patch.ko
  AUTOLOAD := $(call AutoProbe,budget-patch)
  $(call AddDepends/dvb-pci,+kmod-budget-core +kmod-dvb-ttpci)
endef

define KernelPackage/budget-patch/description
 Support for Budget Patch (full TS) modification on
 SAA7146+AV7110 based cards (DVB-S cards). This
 driver doesn't use onboard MPEG2 decoder. The
 card is driven in Budget-only mode. Card is
 required to have loaded firmware to tune properly.
 Firmware can be loaded by insertion and removal of
 standard AV7110 driver prior to loading this
 driver.
endef

$(eval $(call KernelPackage,budget-patch))


define KernelPackage/cx18
  TITLE := Conexant cx23418 MPEG encoder support
  V4L_KCONFIG := CONFIG_VIDEO_CX18
  FILES := $(PKG_BUILD_DIR)/v4l/cx18.ko
  AUTOLOAD := $(call AutoProbe,cx18)
  $(call AddDepends/dvb-pci,+kmod-cx2341x +kmod-i2c-algo-bit +kmod-tveeprom +kmod-videobuf)
endef

define KernelPackage/cx18/description
 This is a video4linux driver for Conexant cx23418 based
 PCI combo video recorder devices.
 This is used in devices such as the Hauppauge HVR-1600 cards.
endef

$(eval $(call KernelPackage,cx18))


define KernelPackage/cx23885
  TITLE := Conexant cx23885 (2388x successor) support
  V4L_KCONFIG := CONFIG_VIDEO_CX23885 CONFIG_MEDIA_ALTERA_CI
  FILES := \
	$(PKG_BUILD_DIR)/v4l/cx23885.ko \
	$(PKG_BUILD_DIR)/v4l/altera-ci.ko \
	$(PKG_BUILD_DIR)/v4l/altera-stapl.ko
  AUTOLOAD := $(call AutoProbe,cx23885 altera-ci altera-stapl)
  $(call AddDepends/dvb-pci,+kmod-cx2341x +kmod-dvb-m88ds3103 +kmod-media-tuner-tda18271 +kmod-rc-core +kmod-sound-core +kmod-tveeprom +kmod-videobuf2-dma-sg  +kmod-videobuf2-dvb +kmod-videobuf2-v4l2)
endef

define KernelPackage/cx23885/description
 This is a video4linux driver for Conexant 23885 based TV cards.
endef

$(eval $(call KernelPackage,cx23885))


define KernelPackage/cx25821
  TITLE := Conexant cx25821 support
  V4L_KCONFIG := CONFIG_VIDEO_CX25821
  FILES := $(PKG_BUILD_DIR)/v4l/cx25821.ko
  AUTOLOAD := $(call AutoProbe,cx25821)
  $(call AddDepends/dvb-pci,+kmod-videobuf2-dma-sg +kmod-videobuf2-v4l2)
endef

define KernelPackage/cx25821/description
 This is a video4linux driver for Conexant 25821 based TV cards.
endef

$(eval $(call KernelPackage,cx25821))


define KernelPackage/cx88-dvb
  TITLE := Conexant 2388x (bt878 successor) support
  V4L_KCONFIG := \
	CONFIG_VIDEO_CX88 \
	CONFIG_VIDEO_CX88_DVB \
	CONFIG_VIDEO_CX88_ENABLE_VP3054 \
	CONFIG_VIDEO_CX88_VP3054
  FILES := \
	$(PKG_BUILD_DIR)/v4l/cx88xx.ko \
	$(PKG_BUILD_DIR)/v4l/cx8800.ko \
	$(PKG_BUILD_DIR)/v4l/cx8802.ko \
	$(PKG_BUILD_DIR)/v4l/cx88-dvb.ko \
	$(PKG_BUILD_DIR)/v4l/cx88-vp3054-i2c.ko
  AUTOLOAD := $(call AutoProbe,cx88-dvb)
  $(call AddDepends/dvb-pci,+kmod-dvb-tas2101 +kmod-i2c-algo-bit +kmod-rc-core +kmod-tveeprom +kmod-v4l2-core +kmod-videobuf2-dma-sg +kmod-videobuf2-dvb +kmod-videobuf2-v4l2)
endef

define KernelPackage/cx88-dvb/description
 This adds support for DVB/ATSC cards based on the Conexant 2388x chip.
endef

$(eval $(call KernelPackage,cx88-dvb))


define KernelPackage/ddbridge
  TITLE := Digital Devices bridge support
  V4L_KCONFIG := CONFIG_DVB_DDBRIDGE CONFIG_DVB_DDBRIDGE_MSIENABLE
  FILES := $(PKG_BUILD_DIR)/v4l/ddbridge.ko
  AUTOLOAD := $(call AutoProbe,ddbridge)
  $(call AddDepends/dvb-pci)
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


define KernelPackage/dvb-ttpci
  TITLE := AV7110 cards
  V4L_KCONFIG := CONFIG_DVB_AV7110
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-ttpci.ko
  AUTOLOAD := $(call AutoProbe,dvb-ttpci)
  $(call AddDepends/dvb-pci,+kmod-input-core +kmod-saa7146-vv +kmod-ttpci-eeprom)
endef

define KernelPackage/dvb-ttpci/description
 Support for SAA7146 and AV7110 based DVB cards as produced
 by Fujitsu-Siemens, Technotrend, Hauppauge and others.
 This driver only supports the fullfeatured cards with onboard MPEG2 decoder.
endef

$(eval $(call KernelPackage,dvb-ttpci))


define KernelPackage/mantis
  TITLE := Mantis/Hopper PCI bridge based devices
  V4L_KCONFIG := CONFIG_MANTIS_CORE CONFIG_DVB_MANTIS CONFIG_DVB_HOPPER
  FILES := \
	$(PKG_BUILD_DIR)/v4l/mantis_core.ko \
	$(PKG_BUILD_DIR)/v4l/mantis.ko \
	$(PKG_BUILD_DIR)/v4l/hopper.ko
  AUTOLOAD := $(call AutoProbe,mantis hopper)
  $(call AddDepends/dvb-pci,+kmod-rc-core)
endef

define KernelPackage/mantis/description
 Support for PCI cards based on the Mantis and Hopper PCi bridge.
endef

$(eval $(call KernelPackage,mantis))


define KernelPackage/netup-unidvb
  TITLE := NetUP Universal DVB card support
  V4L_KCONFIG := CONFIG_DVB_NETUP_UNIDVB
  FILES := $(PKG_BUILD_DIR)/v4l/netup-unidvb.ko
  AUTOLOAD := $(call AutoProbe,netup-unidvb)
  $(call AddDepends/dvb-pci,+kmod-videobuf2-dvb +kmod-videobuf2-v4l2)
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
  V4L_KCONFIG := CONFIG_DVB_NGENE
  FILES := $(PKG_BUILD_DIR)/v4l/ngene.ko
  AUTOLOAD := $(call AutoProbe,ngene)
  $(call AddDepends/dvb-pci)
endef

define KernelPackage/ngene/description
 Support for Micronas PCI express cards with nGene bridge.
endef

$(eval $(call KernelPackage,ngene))


define KernelPackage/pluto2
  TITLE := Pluto2 cards
  V4L_KCONFIG := CONFIG_DVB_PLUTO2
  FILES := $(PKG_BUILD_DIR)/v4l/pluto2.ko
  AUTOLOAD := $(call AutoProbe,pluto2)
  $(call AddDepends/dvb-pci,+kmod-dvb-tda1004x +kmod-i2c-algo-bit)
endef

define KernelPackage/pluto2/description
 Support for PCI cards based on the Pluto2 FPGA like the Satelco
 Easywatch Mobile Terrestrial DVB-T Receiver.
endef

$(eval $(call KernelPackage,pluto2))


define KernelPackage/saa7134-dvb
  TITLE := DVB/ATSC Support for Philips SAA7134 based TV cards
  V4L_KCONFIG := CONFIG_VIDEO_SAA7134 CONFIG_VIDEO_SAA7134_DVB
  FILES := $(PKG_BUILD_DIR)/v4l/saa7134.ko $(PKG_BUILD_DIR)/v4l/saa7134-dvb.ko
  AUTOLOAD := $(call AutoProbe,saa7134-dvb)
  $(call AddDepends/dvb-pci,+kmod-rc-core +kmod-tveeprom +kmod-v4l2-core +kmod-videobuf2-dma-sg +kmod-videobuf2-dvb +kmod-videobuf2-v4l2)
endef

define KernelPackage/saa7134-dvb/description
 This is a video4linux driver for Philips SAA713x based TV cards.
endef

$(eval $(call KernelPackage,saa7134-dvb))


define KernelPackage/saa7164
  TITLE := NXP SAA7164 support
  V4L_KCONFIG := CONFIG_VIDEO_SAA7164
  FILES := $(PKG_BUILD_DIR)/v4l/saa7164.ko
  AUTOLOAD := $(call AutoProbe,saa7164)
  $(call AddDepends/dvb-pci,+kmod-tveeprom +kmod-v4l2-core)
endef

define KernelPackage/saa7164/description
 This is a video4linux driver for NXP SAA7164 based TV cards.
endef

$(eval $(call KernelPackage,saa7164))


define KernelPackage/saa716x-core
  TITLE := SAA7160/1/2 PCI Express bridge based devices
  V4L_KCONFIG := CONFIG_SAA716X_SUPPORT CONFIG_SAA716X_CORE
  FILES := $(PKG_BUILD_DIR)/v4l/saa716x_core.ko
  AUTOLOAD := $(call AutoProbe,saa716x_core)
  $(call AddDepends/dvb-pci)
endef

define KernelPackage/saa716x-core/description
 This is a video4linux driver for NXP SAA7160/1/2 based TV cards.
endef

$(eval $(call KernelPackage,saa716x-core))


define KernelPackage/saa716x-hybrid
  SUBMENU := $(DVB_MENU)
  TITLE := SAA7160/1/2 based Hybrid PCIe cards (DVB + Analog)
  V4L_KCONFIG := CONFIG_DVB_SAA716X_HYBRID
  FILES := $(PKG_BUILD_DIR)/v4l/saa716x_hybrid.ko
  AUTOLOAD := $(call AutoProbe,saa716x_hybrid)
  DEPENDS := +kmod-saa716x-core
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
  SUBMENU := $(DVB_MENU)
  TITLE := SAA7160/1/2 based Budget PCIe cards (DVB only)
  V4L_KCONFIG := CONFIG_DVB_SAA716X
  FILES := $(PKG_BUILD_DIR)/v4l/saa716x_tbs-dvb.ko
  AUTOLOAD := $(call AutoProbe,saa716x_tbs-dvb)
  DEPENDS := +kmod-dvb-cx24117 +kmod-dvb-tas2101 +kmod-i2c-algo-bit +kmod-saa716x-core
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
  V4L_KCONFIG := CONFIG_DVB_SMIPCIE
  FILES := $(PKG_BUILD_DIR)/v4l/smipcie.ko
  AUTOLOAD := $(call AutoProbe,smipcie)
  $(call AddDepends/dvb-pci,+kmod-i2c-algo-bit +kmod-rc-core)
endef

define KernelPackage/smipcie/description
 Support for cards with SMI PCIe bridge:
  - DVBSky S950 V3
  - DVBSky S952 V3
  - DVBSky T9580 V3
endef

$(eval $(call KernelPackage,smipcie))


define KernelPackage/tbs-pcie-dvb
  TITLE := TBS PCIe DVB cards
  V4L_KCONFIG := CONFIG_TBS_PCIE_DVB
  FILES := $(PKG_BUILD_DIR)/v4l/tbs_pcie-dvb.ko
  AUTOLOAD := $(call AutoProbe,tbs_pcie-dvb)
  $(call AddDepends/dvb-pci,+kmod-sound-core +kmod-videobuf2-dma-sg +kmod-videobuf2-v4l2)
endef

define KernelPackage/tbs-pcie-dvb/description
 Support for TBS PCIe DVB cards.
endef

$(eval $(call KernelPackage,tbs-pcie-dvb))


define KernelPackage/tbsecp3
  TITLE := TBS ECP3 FPGA based cards
  V4L_KCONFIG := CONFIG_DVB_TBSECP3
  FILES := $(PKG_BUILD_DIR)/v4l/tbsecp3.ko
  AUTOLOAD := $(call AutoProbe,tbsecp3)
  $(call AddDepends/dvb-pci,+kmod-dvb-tas2101)
endef

define KernelPackage/tbsecp3/description
 Support for cards with TBS ECP3 FPGA based PCIe bridge.
endef

$(eval $(call KernelPackage,tbsecp3))
