ifeq ($(CONFIG_V4L_SRC_TBSDTV),y)
include ./origin/tbsdtv.mk
endif
ifeq ($(CONFIG_V4L_SRC_LINUXTV),y)
include ./origin/linuxtv.mk
endif
