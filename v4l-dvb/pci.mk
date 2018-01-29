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
  V4L_KCONFIG := \
	CONFIG_DVB_BUDGET \
	CONFIG_DVB_BUDGET_CORE \
	CONFIG_TTPCI_EEPROM
  FILES := \
	$(PKG_BUILD_DIR)/v4l/budget.ko \
	$(PKG_BUILD_DIR)/v4l/budget-core.ko \
	$(PKG_BUILD_DIR)/v4l/ttpci-eeprom.ko
  AUTOLOAD := $(call AutoProbe,budget budget-core ttpci-eeprom)
  $(call AddDepends/dvb-pci,+kmod-saa7146)
endef

define KernelPackage/budget/description
 Support for simple SAA7146 based DVB cards (so called Budget-
 or Nova-PCI cards) without onboard MPEG2 decoder, and without
 analog inputs or an onboard Common Interface connector.
endef

$(eval $(call KernelPackage,budget))


define KernelPackage/budget-ci
  TITLE := Budget SAA7146 PCI DVB cards with CI slot
  V4L_KCONFIG := CONFIG_DVB_BUDGET_CI
  FILES := $(PKG_BUILD_DIR)/v4l/budget-ci.ko
  AUTOLOAD := $(call AutoProbe,budget-ci)
  $(call AddDepends/dvb-pci,+kmod-budget +kmod-rc-core)
endef

define KernelPackage/budget-ci/description
 Support for simple SAA7146 based DVB cards
 (so called Budget- or Nova-PCI cards) without onboard
 MPEG2 decoder, but with onboard Common Interface connector.
endef

$(eval $(call KernelPackage,budget-ci))


define KernelPackage/ngene
  TITLE := Micronas nGene bridge
  V4L_KCONFIG := CONFIG_DVB_NGENE
  FILES := $(PKG_BUILD_DIR)/v4l/ngene.ko
  AUTOLOAD := $(call AutoProbe,ngene)
  $(call AddDepends/dvb-pci,+kmod-cxd2099 +ngene-firmware)
endef

define KernelPackage/ngene/description
 Support for Micronas PCI express cards with nGene bridge.
endef

$(eval $(call KernelPackage,ngene))

