PKG_NAME := v4l-dvb-tbsdtv

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := https://github.com/tbsdtv/media_build.git
PKG_SOURCE_VERSION := 4735369fca22122cbc4dffd16c36026747563b0b
PKG_SOURCE_DATE := 2018-10-16

V4L_SOURCE_URL := https://github.com/tbsdtv/linux_media.git
V4L_SOURCE_VERSION := 23087976705d594febef88e9160c3eb76abb2d48
V4L_REPO_NAME := linux-media-tbsdtv
V4L_SOURCE_FILE := $(V4L_REPO_NAME)-$(PKG_SOURCE_DATE)-$(shell printf '%.8s' $(V4L_SOURCE_VERSION)).tar.bz2

PATCH_DIR := patches-tbsdtv
