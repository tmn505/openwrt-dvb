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


define KernelPackage/cx2341x
  SUBMENU := $(DVB_MENU)
  TITLE := cx23415/6/8 driver
  V4L_KCONFIG := CONFIG_DVB_CX2341X
  FILES := $(PKG_BUILD_DIR)/v4l/cx2341x.ko
  AUTOLOAD := $(call AutoProbe,cx2341x)
  DEPENDS := +kmod-videodev
endef

define KernelPackage/cx2341x/description
 Common routines for Conexant cx23415/6/8 drivers.
endef
$(eval $(call KernelPackage,cx2341x))


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
  DEPENDS := @PCI_SUPPORT
endef

define KernelPackage/saa7146/description
 NXP/Philips SAA7146 multimedia bridge to PCI bus.
endef
$(eval $(call KernelPackage,saa7146))


define KernelPackage/saa7146-vv
  SUBMENU := $(DVB_MENU)
  TITLE := video4linux driver for SAA7146-based hardware
  V4L_KCONFIG := CONFIG_VIDEO_SAA7146_VV
  FILES := $(PKG_BUILD_DIR)/v4l/saa7146_vv.ko
  AUTOLOAD := $(call AutoProbe,saa7146_vv)
  DEPENDS := +kmod-saa7146 +kmod-videobuf +kmod-videodev
endef
$(eval $(call KernelPackage,saa7146-vv))


define KernelPackage/smsmdtv
  SUBMENU := $(DVB_MENU)
  TITLE := Siano Mobile Silicon Digital TV device
  V4L_KCONFIG := CONFIG_SMS_SIANO_MDTV
  FILES := $(PKG_BUILD_DIR)/v4l/smsmdtv.ko
  AUTOLOAD := $(call AutoProbe,smsmdtv)
  DEPENDS := +kmod-dvb-core +kmod-rc-core
endef
$(eval $(call KernelPackage,smsmdtv))


define KernelPackage/ttpci-eeprom
  SUBMENU := $(DVB_MENU)
  TITLE := TechnoTrend eeprom helper
  V4L_KCONFIG := CONFIG_TTPCI_EEPROM
  FILES := $(PKG_BUILD_DIR)/v4l/ttpci-eeprom.ko
  AUTOLOAD := $(call AutoProbe,ttpci-eeprom)
  DEPENDS := +kmod-i2c-core
endef

define KernelPackage/ttpci-eeprom/description
 Decode dvb_net MAC address from EEPROM of PCI DVB cards made by Siemens, Technotrend, Hauppauge.
endef
$(eval $(call KernelPackage,ttpci-eeprom))


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


define KernelPackage/videobuf2-common
  SUBMENU := $(DVB_MENU)
  TITLE := videobuf2 common lib
  V4L_KCONFIG := CONFIG_VIDEOBUF2_CORE
  FILES := $(PKG_BUILD_DIR)/v4l/videobuf2-common.ko
  AUTOLOAD := $(call AutoProbe,videobuf2-common)
  DEPENDS := +kmod-dma-buf +kmod-videodev
  CONFLICTS := kmod-video-videobuf2
endef
$(eval $(call KernelPackage,videobuf2-common))


define KernelPackage/videobuf2-dma-sg
  SUBMENU := $(DVB_MENU)
  TITLE := videobuf2 dma-sg lib
  V4L_KCONFIG := CONFIG_VIDEOBUF2_DMA_SG
  FILES := $(PKG_BUILD_DIR)/v4l/videobuf2-dma-sg.ko
  AUTOLOAD := $(call AutoProbe,videobuf2-dma-sg)
  DEPENDS := +kmod-videobuf2-memops
  CONFLICTS := kmod-video-videobuf2
endef
$(eval $(call KernelPackage,videobuf2-dma-sg))


define KernelPackage/videobuf2-dvb
  SUBMENU := $(DVB_MENU)
  TITLE := videobuf2 dvb lib
  V4L_KCONFIG := CONFIG_VIDEOBUF2_DVB
  FILES := $(PKG_BUILD_DIR)/v4l/videobuf2-dvb.ko
  AUTOLOAD := $(call AutoProbe,videobuf2-dvb)
  DEPENDS := +kmod-dvb-core
  CONFLICTS := kmod-video-videobuf2
endef
$(eval $(call KernelPackage,videobuf2-dvb))


define KernelPackage/videobuf2-memops
  SUBMENU := $(DVB_MENU)
  TITLE := videobuf2 memops lib
  V4L_KCONFIG := CONFIG_VIDEOBUF2_MEMOPS
  FILES := $(PKG_BUILD_DIR)/v4l/videobuf2-memops.ko
  AUTOLOAD := $(call AutoProbe,videobuf2-memops)
  DEPENDS := +kmod-videobuf2-common
  CONFLICTS := kmod-video-videobuf2
endef
$(eval $(call KernelPackage,videobuf2-memops))


define KernelPackage/videobuf2-v4l2
  SUBMENU := $(DVB_MENU)
  TITLE := videobuf2 v4l2 lib
  V4L_KCONFIG := CONFIG_VIDEOBUF2_V4L2
  FILES := $(PKG_BUILD_DIR)/v4l/videobuf2-v4l2.ko
  AUTOLOAD := $(call AutoProbe,videobuf2-v4l2)
  DEPENDS := +kmod-videobuf2-common
  CONFLICTS := kmod-video-videobuf2
endef
$(eval $(call KernelPackage,videobuf2-v4l2))


define KernelPackage/videobuf2-vmalloc
  SUBMENU := $(DVB_MENU)
  TITLE := videobuf2 vmalloc lib
  V4L_KCONFIG := CONFIG_VIDEOBUF2_VMALLOC
  FILES := $(PKG_BUILD_DIR)/v4l/videobuf2-vmalloc.ko
  AUTOLOAD := $(call AutoProbe,videobuf2-vmalloc)
  DEPENDS := +kmod-videobuf2-memops
  CONFLICTS := kmod-video-videobuf2
endef
$(eval $(call KernelPackage,videobuf2-vmalloc))


define KernelPackage/videobuf
  SUBMENU := $(DVB_MENU)
  TITLE := videobuf lib
  V4L_KCONFIG := \
	CONFIG_VIDEOBUF_DMA_SG \
	CONFIG_VIDEOBUF_GEN \
	CONFIG_VIDEOBUF_VMALLOC
  FILES := \
	$(PKG_BUILD_DIR)/v4l/videobuf-core.ko \
	$(PKG_BUILD_DIR)/v4l/videobuf-dma-sg.ko \
	$(PKG_BUILD_DIR)/v4l/videobuf-vmalloc.ko
  AUTOLOAD := $(call AutoProbe,videobuf-core videobuf-vmalloc)
  CONFLICTS := kmod-video-videobuf2
endef

define KernelPackage/videobuf/description
 Helper module to manage video4linux buffers.
endef
$(eval $(call KernelPackage,videobuf))
