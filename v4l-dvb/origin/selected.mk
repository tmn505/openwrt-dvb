ifeq ($(CONFIG_PACKAGE_kmod-media_tbsdtv),y)
include ./origin/tbsdtv.mk
endif
ifeq ($(CONFIG_PACKAGE_kmod-media_linuxtv),y)
include ./origin/linuxtv.mk
endif
