define KernelPackage/firedtv
  SUBMENU := $(LINUXTV_MENU)
  TITLE := FireDTV and FloppyDTV
  KCONFIG := CONFIG_DVB_FIREDTV
  FILES := $(PKG_BUILD_DIR)/v4l/firedtv.ko
  AUTOLOAD := $(call AutoProbe,firedtv)
  DEPENDS := +kmod-dvb-core +kmod-firewire
endef
$(eval $(call KernelPackage,firedtv))
