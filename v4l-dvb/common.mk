define KernelPackage/b2c2-flexcop
  SUBMENU := $(DVB_MENU)
  TITLE := B2C2 Flexcop receiver chip
  V4L_KCONFIG := CONFIG_DVB_B2C2_FLEXCOP
  FILES := $(PKG_BUILD_DIR)/v4l/b2c2-flexcop.ko
  AUTOLOAD := $(call AutoProbe,b2c2-flexcop)
  DEPENDS := +kmod-dvb-core +kmod-dvb-cx24113 +kmod-dvb-cx24123 +kmod-dvb-s5h1420
endef

define KernelPackage/b2c2-flexcop/description
 B2C2 FlexcopII/II(b)/III digital TV receiver chip.
endef

$(eval $(call KernelPackage,b2c2-flexcop))


define KernelPackage/cxd2099
  SUBMENU := $(DVB_MENU)
  TITLE := SONY CXD2099AR Common Interface driver
  V4L_KCONFIG := CONFIG_DVB_CXD2099
  FILES := $(PKG_BUILD_DIR)/v4l/cxd2099.ko
  AUTOLOAD := $(call AutoProbe,cxd2099)
endef

define KernelPackage/cxd2099/description
 Support for the CI module found on cards based on
  - Micronas ngene PCIe bridge: cineS2 etc.
  - Digital Devices PCIe bridge: Octopus series.
endef

$(eval $(call KernelPackage,cxd2099))


define KernelPackage/cypress-firmware
  SUBMENU := $(DVB_MENU)
  TITLE := Cypress firmware helper routines
  V4L_KCONFIG := CONFIG_CYPRESS_FIRMWARE
  FILES := $(PKG_BUILD_DIR)/v4l/cypress_firmware.ko
  AUTOLOAD := $(call AutoProbe,cypress-firmware)
  DEPENDS := +kmod-usb-core
endef

define KernelPackage/cypress-firmware/description
 Helper module for Cypress firmware download.
endef

$(eval $(call KernelPackage,cypress-firmware))


define KernelPackage/saa7146
  SUBMENU := $(DVB_MENU)
  TITLE := NXP/Philips SAA7146
  V4L_KCONFIG := CONFIG_VIDEO_SAA7146
  FILES := $(PKG_BUILD_DIR)/v4l/saa7146.ko
  AUTOLOAD := $(call AutoProbe,saa7146)
endef

define KernelPackage/saa7146/description
 NXP/Philips SAA7146 multimedia bridge to PCI bus.
endef

$(eval $(call KernelPackage,saa7146))


define KernelPackage/tveeprom
  SUBMENU := $(DVB_MENU)
  TITLE := TV card eeprom decoder
  V4L_KCONFIG := CONFIG_VIDEO_TVEEPROM
  FILES := $(PKG_BUILD_DIR)/v4l/tveeprom.ko
  AUTOLOAD := $(call AutoProbe,tveeprom)
  DEPENDS := +kmod-i2c-core
endef

define KernelPackage/tveeprom/description
 Eeprom decoder for tvcard configuration eeproms.
endef

$(eval $(call KernelPackage,tveeprom))
