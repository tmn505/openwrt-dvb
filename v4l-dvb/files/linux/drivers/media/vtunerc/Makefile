#
# Makefile for the vtunerc device driver
#

vtunerc-objs = vtunerc_main.o vtunerc_ctrldev.o vtunerc_proxyfe.o

obj-$(CONFIG_DVB_VTUNERC) += vtunerc.o

ccflags-y += -Idrivers/media/vtunerc
ccflags-y += -DVTUNERC_MAX_ADAPTERS=16
