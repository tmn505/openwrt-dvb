define KernelPackage/dvb-core
  SUBMENU := $(DVB_MENU)
  TITLE := DVB core support
  V4L_KCONFIG := \
	CONFIG_DVB_CORE \
	CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=n \
	CONFIG_DVB_DYNAMIC_MINORS=n \
	CONFIG_DVB_MAX_ADAPTERS=16 \
	CONFIG_DVB_NET=y \
	CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-core.ko
  AUTOLOAD := $(call AutoProbe,dvb-core)
  DEPENDS += +kmod-mc +kmod-videobuf2-vmalloc
endef

define KernelPackage/dvb-core/description
 Kernel modules for DVB support.
endef

$(eval $(call KernelPackage,dvb-core))


define KernelPackage/rc-core
  SUBMENU := $(DVB_MENU)
  TITLE := Remote Controller support
  V4L_KCONFIG := \
	CONFIG_MEDIA_RC_SUPPORT=y \
	CONFIG_RC_CORE
  FILES := $(PKG_BUILD_DIR)/v4l/rc-core.ko
  AUTOLOAD := $(call AutoProbe,rc-core)
  DEPENDS := +kmod-mc +kmod-input-core
endef

define KernelPackage/rc-core/description
 Enable support for Remote Controllers on Linux. This is
 needed in order to support several video capture adapters,
 standalone IR receivers/transmitters, and RF receivers.

 Enable this option if you have a video capture board even
 if you don't need IR, as otherwise, you may not be able to
 compile the driver for your adapter.
endef

$(eval $(call KernelPackage,rc-core))


define KernelPackage/videodev
  SUBMENU := $(DVB_MENU)
  TITLE := Device registrar for Video4Linux drivers v2
  V4L_KCONFIG := CONFIG_VIDEO_DEV=y
  FILES := $(PKG_BUILD_DIR)/v4l/videodev.ko
  AUTOLOAD := $(call AutoProbe,videodev)
  DEPENDS := +kmod-i2c-core +kmod-mc
  CONFLICTS := kmod-video-core
endef

$(eval $(call KernelPackage,videodev))
