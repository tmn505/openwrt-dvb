PKG_NAME := v4l-dvb-linuxtv

PKG_SOURCE_PROTO := git
PKG_SOURCE_URL := git://linuxtv.org/media_build.git
PKG_SOURCE_VERSION := 0fe857b86addf382f6fd383948bd7736a3201403
PKG_SOURCE_DATE := 2022-05-24

V4L_SOURCE_URL := git://linuxtv.org/media_tree.git
V4L_SOURCE_VERSION := 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
V4L_REPO_NAME := linux-media-linuxtv
V4L_SOURCE_FILE := $(V4L_REPO_NAME)-$(PKG_SOURCE_DATE)-$(shell printf '%.8s' $(V4L_SOURCE_VERSION)).tar.bz2

PATCH_DIR := patches-linuxtv
