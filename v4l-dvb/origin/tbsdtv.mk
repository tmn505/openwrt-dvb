PKG_NAME := v4l-dvb-tbsdtv

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/tbsdtv/media_build.git
PKG_SOURCE_VERSION := 9a225f4da01944fd34e1f9cf113da0d0d6f40820
PKG_SOURCE_DATE := 2022-07-17

V4L_SOURCE_URL := https://github.com/tbsdtv/linux_media.git
V4L_SOURCE_VERSION := cdad29708d49a0174f4ae7fb6008fa51e31031a5
V4L_REPO_NAME := linux-media-tbsdtv
V4L_SOURCE_FILE := $(V4L_REPO_NAME)-$(PKG_SOURCE_DATE)-$(shell printf '%.8s' $(V4L_SOURCE_VERSION)).tar.bz2

PATCH_DIR := patches-tbsdtv
