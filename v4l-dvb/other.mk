define KernelPackage/firedtv
  SUBMENU := $(LINUXTV_MENU)
  TITLE := FireDTV and FloppyDTV
  KCONFIG := CONFIG_DVB_FIREDTV
  FILES := $(PKG_BUILD_DIR)/v4l/firedtv.ko
  AUTOLOAD := $(call AutoProbe,firedtv)
  DEPENDS := +kmod-dvb-core +kmod-firewire
endef
$(eval $(call KernelPackage,firedtv))


define KernelPackage/vtunerc
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Virtual DVB adapter
  KCONFIG := CONFIG_DVB_VTUNERC
  FILES := $(PKG_BUILD_DIR)/v4l/vtunerc.ko
  DEPENDS := +kmod-dvb-core
  DEFAULT := n
endef
$(eval $(call KernelPackage,vtunerc))
