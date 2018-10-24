define KernelPackage/firedtv
  SUBMENU := $(DVB_MENU)
  TITLE := FireDTV and FloppyDTV
  V4L_KCONFIG := CONFIG_DVB_FIREDTV
  FILES := $(PKG_BUILD_DIR)/v4l/firedtv.ko
  AUTOLOAD := $(call AutoProbe,firedtv)
  DEPENDS := +kmod-dvb-core +kmod-firewire
endef

$(eval $(call KernelPackage,firedtv))


define KernelPackage/vtunerc
  SUBMENU := $(DVB_MENU)
  TITLE := Virtual DVB adapter
  V4L_KCONFIG := CONFIG_DVB_VTUNERC
  FILES := $(PKG_BUILD_DIR)/v4l/vtunerc.ko
  DEPENDS := +kmod-dvb-core
endef

$(eval $(call KernelPackage,vtunerc))
