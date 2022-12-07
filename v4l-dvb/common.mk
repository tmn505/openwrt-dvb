define KernelPackage/b2c2-flexcop
  SUBMENU := $(LINUXTV_MENU)
  TITLE := B2C2 Flexcop receiver chip
  KCONFIG := CONFIG_DVB_B2C2_FLEXCOP
  FILES := $(PKG_BUILD_DIR)/v4l/b2c2-flexcop.ko
  AUTOLOAD := $(call AutoProbe,b2c2-flexcop)
  DEPENDS := +kmod-dvb-core +kmod-dvb-fe-bcm3510 +kmod-dvb-fe-cx24113 +kmod-dvb-fe-cx24120 \
	+kmod-dvb-fe-cx24123 +kmod-dvb-fe-isl6421 +kmod-dvb-fe-itd1000 +kmod-dvb-fe-lgdt330x \
	+kmod-dvb-fe-mt312 +kmod-dvb-fe-mt352 +kmod-dvb-fe-nxt200x +kmod-dvb-fe-s5h1420 \
	+kmod-dvb-fe-stv0297 +kmod-dvb-fe-stv0299 +kmod-dvb-pll +kmod-media-tuner-simple
endef

define KernelPackage/b2c2-flexcop/description
 B2C2 FlexcopII/II(b)/III digital TV receiver chip.
endef
$(eval $(call KernelPackage,b2c2-flexcop))


define KernelPackage/cx2341x
  SUBMENU := $(LINUXTV_MENU)
  TITLE := cx23415/6/8 driver
  KCONFIG := CONFIG_VIDEO_CX2341X
  FILES := $(PKG_BUILD_DIR)/v4l/cx2341x.ko
  AUTOLOAD := $(call AutoProbe,cx2341x)
  DEPENDS := +kmod-videodev
endef

define KernelPackage/cx2341x/description
 Common routines for Conexant cx23415/6/8 drivers.
endef
$(eval $(call KernelPackage,cx2341x))


define KernelPackage/cypress-firmware
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Cypress firmware helper routines
  KCONFIG := CONFIG_CYPRESS_FIRMWARE
  FILES := $(PKG_BUILD_DIR)/v4l/cypress_firmware.ko
  AUTOLOAD := $(call AutoProbe,cypress-firmware)
  DEPENDS := +kmod-usb-core
endef

define KernelPackage/cypress-firmware/description
 Helper module for Cypress firmware download.
endef
$(eval $(call KernelPackage,cypress-firmware))


define KernelPackage/saa7146
  SUBMENU := $(LINUXTV_MENU)
  TITLE := NXP/Philips SAA7146
  KCONFIG := CONFIG_VIDEO_SAA7146
  FILES := $(PKG_BUILD_DIR)/v4l/saa7146.ko
  AUTOLOAD := $(call AutoProbe,saa7146)
  DEPENDS := @PCI_SUPPORT
endef

define KernelPackage/saa7146/description
 NXP/Philips SAA7146 multimedia bridge to PCI bus.
endef
$(eval $(call KernelPackage,saa7146))


define KernelPackage/saa7146-vv
  SUBMENU := $(LINUXTV_MENU)
  TITLE := video4linux driver for SAA7146-based hardware
  KCONFIG := CONFIG_VIDEO_SAA7146_VV
  FILES := $(PKG_BUILD_DIR)/v4l/saa7146_vv.ko
  AUTOLOAD := $(call AutoProbe,saa7146_vv)
  DEPENDS := +kmod-saa7146 +kmod-videobuf +kmod-videodev
endef
$(eval $(call KernelPackage,saa7146-vv))


define KernelPackage/smsmdtv
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Siano Mobile Silicon Digital TV device
  KCONFIG := CONFIG_SMS_SIANO_MDTV
  FILES := $(PKG_BUILD_DIR)/v4l/smsmdtv.ko
  AUTOLOAD := $(call AutoProbe,smsmdtv)
  DEPENDS := +kmod-dvb-core +kmod-rc-core
endef
$(eval $(call KernelPackage,smsmdtv))


define KernelPackage/ttpci-eeprom
  SUBMENU := $(LINUXTV_MENU)
  TITLE := TechnoTrend eeprom helper
  KCONFIG := CONFIG_TTPCI_EEPROM
  FILES := $(PKG_BUILD_DIR)/v4l/ttpci-eeprom.ko
  AUTOLOAD := $(call AutoProbe,ttpci-eeprom)
  DEPENDS := +kmod-i2c-core
endef

define KernelPackage/ttpci-eeprom/description
 Decode dvb_net MAC address from EEPROM of PCI DVB cards made by Siemens, Technotrend, Hauppauge.
endef
$(eval $(call KernelPackage,ttpci-eeprom))


define KernelPackage/tveeprom
  SUBMENU := $(LINUXTV_MENU)
  TITLE := TV card eeprom decoder
  KCONFIG := CONFIG_VIDEO_TVEEPROM
  FILES := $(PKG_BUILD_DIR)/v4l/tveeprom.ko
  AUTOLOAD := $(call AutoProbe,tveeprom)
  DEPENDS := +kmod-i2c-core
endef

define KernelPackage/tveeprom/description
 Eeprom decoder for tvcard configuration eeproms.
endef
$(eval $(call KernelPackage,tveeprom))


define KernelPackage/videobuf2-common
  SUBMENU := $(LINUXTV_MENU)
  TITLE := videobuf2 common lib
  KCONFIG := CONFIG_VIDEOBUF2_CORE
  FILES := $(PKG_BUILD_DIR)/v4l/videobuf2-common.ko
  AUTOLOAD := $(call AutoProbe,videobuf2-common)
  DEPENDS := +kmod-dma-buf +kmod-videodev
  CONFLICTS := kmod-video-videobuf2
endef
$(eval $(call KernelPackage,videobuf2-common))


define KernelPackage/videobuf2-dma-sg
  SUBMENU := $(LINUXTV_MENU)
  TITLE := videobuf2 dma-sg lib
  KCONFIG := CONFIG_VIDEOBUF2_DMA_SG
  FILES := $(PKG_BUILD_DIR)/v4l/videobuf2-dma-sg.ko
  AUTOLOAD := $(call AutoProbe,videobuf2-dma-sg)
  DEPENDS := +kmod-videobuf2-memops
  CONFLICTS := kmod-video-videobuf2
endef
$(eval $(call KernelPackage,videobuf2-dma-sg))


define KernelPackage/videobuf2-dvb
  SUBMENU := $(LINUXTV_MENU)
  TITLE := videobuf2 dvb lib
  KCONFIG := CONFIG_VIDEOBUF2_DVB
  FILES := $(PKG_BUILD_DIR)/v4l/videobuf2-dvb.ko
  AUTOLOAD := $(call AutoProbe,videobuf2-dvb)
  DEPENDS := +kmod-dvb-core
  CONFLICTS := kmod-video-videobuf2
endef
$(eval $(call KernelPackage,videobuf2-dvb))


define KernelPackage/videobuf2-memops
  SUBMENU := $(LINUXTV_MENU)
  TITLE := videobuf2 memops lib
  KCONFIG := CONFIG_VIDEOBUF2_MEMOPS
  FILES := $(PKG_BUILD_DIR)/v4l/videobuf2-memops.ko
  AUTOLOAD := $(call AutoProbe,videobuf2-memops)
  DEPENDS := +kmod-videobuf2-common
  CONFLICTS := kmod-video-videobuf2
endef
$(eval $(call KernelPackage,videobuf2-memops))


define KernelPackage/videobuf2-v4l2
  SUBMENU := $(LINUXTV_MENU)
  TITLE := videobuf2 v4l2 lib
  KCONFIG := CONFIG_VIDEOBUF2_V4L2
  FILES := $(PKG_BUILD_DIR)/v4l/videobuf2-v4l2.ko
  AUTOLOAD := $(call AutoProbe,videobuf2-v4l2)
  DEPENDS := +kmod-videobuf2-common
  CONFLICTS := kmod-video-videobuf2
endef
$(eval $(call KernelPackage,videobuf2-v4l2))


define KernelPackage/videobuf2-vmalloc
  SUBMENU := $(LINUXTV_MENU)
  TITLE := videobuf2 vmalloc lib
  KCONFIG := CONFIG_VIDEOBUF2_VMALLOC
  FILES := $(PKG_BUILD_DIR)/v4l/videobuf2-vmalloc.ko
  AUTOLOAD := $(call AutoProbe,videobuf2-vmalloc)
  DEPENDS := +kmod-videobuf2-memops
  CONFLICTS := kmod-video-videobuf2
endef
$(eval $(call KernelPackage,videobuf2-vmalloc))


define KernelPackage/videobuf
  SUBMENU := $(LINUXTV_MENU)
  TITLE := videobuf lib
  KCONFIG := \
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
