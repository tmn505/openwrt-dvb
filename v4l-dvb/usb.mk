define KernelPackage/dvb-usb
  SUBMENU := $(DVB_MENU)
  TITLE := Support for various USB DVB devices
  V4L_KCONFIG := \
	CONFIG_DVB_USB \
	CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y \
	CONFIG_MEDIA_USB_SUPPORT=y
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb)
  DEPENDS := +kmod-dvb-core +kmod-i2c-core +kmod-rc-core +kmod-usb-core
endef

define KernelPackage/dvb-usb/description
 By enabling this you will be able to choose the various supported
 USB1.1 and USB2.0 DVB devices.

 Almost every USB device needs a firmware.

 For a complete list of supported USB devices see the LinuxTV DVB Wiki:
 <http://www.linuxtv.org/wiki/index.php/DVB_USB>
endef

$(eval $(call KernelPackage,dvb-usb))

define AddDepends/dvb-usb
  SUBMENU := $(DVB_MENU)
  DEPENDS += +kmod-dvb-usb $1
endef


define KernelPackage/dvb-usb-v2
  SUBMENU := $(DVB_MENU)
  TITLE := Support for various USB DVB devices v2
  V4L_KCONFIG := CONFIG_DVB_USB_V2
  FILES := $(PKG_BUILD_DIR)/v4l/dvb_usb_v2.ko
  AUTOLOAD := $(call AutoProbe,dvb_usb_v2)
  DEPENDS := +kmod-dvb-core +kmod-i2c-core +kmod-rc-core +kmod-usb-core
endef

define KernelPackage/dvb-usb-v2/description
 By enabling this you will be able to choose the various supported
 USB1.1 and USB2.0 DVB devices.

 Almost every USB device needs a firmware.

 For a complete list of supported USB devices see the LinuxTV DVB Wiki:
 <http://www.linuxtv.org/wiki/index.php/DVB_USB>
endef

$(eval $(call KernelPackage,dvb-usb-v2))

define AddDepends/dvb-usb-v2
  SUBMENU := $(DVB_MENU)
  DEPENDS += +kmod-dvb-usb-v2 $1
endef


define KernelPackage/b2c2-flexcop-usb
  SUBMENU := $(DVB_MENU)
  TITLE := Technisat/B2C2 Air/Sky/Cable2PC USB
  V4L_KCONFIG := CONFIG_DVB_B2C2_FLEXCOP_USB
  FILES := $(PKG_BUILD_DIR)/v4l/b2c2-flexcop-usb.ko
  AUTOLOAD := $(call AutoProbe,b2c2-flexcop-usb)
  DEPENDS := +kmod-i2c-core +kmod-b2c2-flexcop +kmod-usb-core
endef

define KernelPackage/b2c2-flexcop-usb/description
 Support for the Air/Sky/Cable2PC USB1.1 box (DVB/ATSC) by Technisat/B2C2.
endef

$(eval $(call KernelPackage,b2c2-flexcop-usb))


define KernelPackage/dvb-as102
  SUBMENU := $(DVB_MENU)
  TITLE := Abilis AS102 DVB receiver
  V4L_KCONFIG := CONFIG_DVB_AS102
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-as102.ko
  AUTOLOAD := $(call AutoProbe,dvb-as102)
  DEPENDS := +kmod-dvb-core +kmod-i2c-core +kmod-input-core +kmod-usb-core
endef

define KernelPackage/dvb-as102/description
 Support for the Abilis AS102 based DVB-T USB2.0 receivers.
endef

$(eval $(call KernelPackage,dvb-as102))


define KernelPackage/dvb-usb-a800
  TITLE := AVerMedia AverTV DVB-T USB 2.0 (A800)
  V4L_KCONFIG := CONFIG_DVB_USB_A800
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-a800.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-a800)
  $(call AddDepends/dvb-usb,+kmod-dvb-dib3000mc +kmod-dvb-usb-dibusb-mc-common)
endef

define KernelPackage/dvb-usb-a800/description
 Say Y here to support the AVerMedia AverTV DVB-T USB 2.0 (A800) receiver.
endef

$(eval $(call KernelPackage,dvb-usb-a800))


define KernelPackage/dvb-usb-af9015
  TITLE := Afatech AF9015 DVB-T USB2.0 support
  V4L_KCONFIG := CONFIG_DVB_USB_AF9015
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-af9015.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-af9015)
  $(call AddDepends/dvb-usb-v2,+kmod-dvb-af9013)
endef

define KernelPackage/dvb-usb-af9015/description
 Support for the Afatech AF9015 based DVB-T USB2.0 receiver.
endef

$(eval $(call KernelPackage,dvb-usb-af9015))


define KernelPackage/dvb-usb-af9035
  TITLE := Afatech AF9035 DVB-T USB2.0 support
  V4L_KCONFIG := CONFIG_DVB_USB_AF9035
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-af9035.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-af9035)
  $(call AddDepends/dvb-usb-v2,+kmod-dvb-af9033)
endef

define KernelPackage/dvb-usb-af9035/description
 Say Y here to support the Afatech AF9035 based DVB USB receiver.
endef

$(eval $(call KernelPackage,dvb-usb-af9035))


define KernelPackage/dvb-usb-anysee
  TITLE := Anysee DVB-T/C USB2.0 support
  V4L_KCONFIG := CONFIG_DVB_USB_ANYSEE
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-anysee.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-anysee)
  $(call AddDepends/dvb-usb-v2)
endef

define KernelPackage/dvb-usb-anysee/description
 Anysee DVB-T/C USB2.0 support
endef

$(eval $(call KernelPackage,dvb-usb-anysee))


define KernelPackage/dvb-usb-az6007
  TITLE := AzureWave 6007 and clones DVB-T/C USB2.0 support
  V4L_KCONFIG := CONFIG_DVB_USB_AZ6007
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-az6007.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-az6007)
  $(call AddDepends/dvb-usb-v2,+kmod-cypress-firmware)
endef

define KernelPackage/dvb-usb-az6007/description
 Say Y here to support the AZ6007 receivers like Terratec H7.
endef

$(eval $(call KernelPackage,dvb-usb-az6007))


define KernelPackage/dvb-usb-dvbsky
  TITLE := DVBSky USB support
  V4L_KCONFIG := CONFIG_DVB_USB_DVBSKY
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dvbsky.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dvbsky)
  $(call AddDepends/dvb-usb-v2,+kmod-dvb-si2168 +kmod-dvb-m88ds3103)
endef

define KernelPackage/dvb-usb-dvbsky/description
 Say Y here to support the USB receivers from DVBSky.
endef

$(eval $(call KernelPackage,dvb-usb-dvbsky))


define KernelPackage/dvb-usb-dib0700
  TITLE := DiBcom DiB0700 USB DVB devices
  V4L_KCONFIG := CONFIG_DVB_USB_DIB0700
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dib0700.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dib0700)
  DEPENDS :=  \
	+kmod-dvb-dib3000mc \
	+kmod-dvb-dib7000m \
	+kmod-dvb-dib9000 \
	+kmod-dvb-tuner-dib0070 \
	+kmod-dvb-tuner-dib0090 \
	+dib0700-firmware
  $(call AddDepends/dvb-usb)
endef

define KernelPackage/dvb-usb-dib0700/description
 Support for USB2.0/1.1 DVB receivers based on the DiB0700 USB bridge. The
 USB bridge is also present in devices having the DiB7700 DVB-T-USB
 silicon. This chip can be found in devices offered by Hauppauge,
 Avermedia and other big and small companies.

 For an up-to-date list of devices supported by this driver, have a look
 on the LinuxTV Wiki at www.linuxtv.org.

 Say Y if you own such a device and want to use it. You should build it as
 a module.
endef

$(eval $(call KernelPackage,dvb-usb-dib0700))


define KernelPackage/dvb-usb-dibusb-common
  TITLE := Common library for DiBcom USB drivers
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dibusb-common.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dibusb-common)
  $(call AddDepends/dvb-usb,+kmod-dvb-dib3000mc)
endef

$(eval $(call KernelPackage,dvb-usb-dibusb-common))


define KernelPackage/dvb-usb-dibusb-mc-common
  TITLE := Common library for DiBcom USB drivers
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dibusb-mc-common.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dibusb-mc-common)
  $(call AddDepends/dvb-usb,+kmod-dvb-usb-dibusb-common)
endef

$(eval $(call KernelPackage,dvb-usb-dibusb-mc-common))


define KernelPackage/dvb-usb-dibusb-mc
  TITLE := DiBcom USB DVB-T devices (DiB3000M-C/P based)
  V4L_KCONFIG := CONFIG_DVB_USB_DIBUSB_MC
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dibusb-mc.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dibusb-mc)
  $(call AddDepends/dvb-usb,+kmod-dvb-dib3000mc +kmod-dvb-usb-dibusb-mc-common)
endef

define KernelPackage/dvb-usb-dibusb-mc/description
 Support for USB2.0 DVB-T receivers based on reference designs made by
 DiBcom (<http://www.dibcom.fr>) equipped with a DiB3000M-C/P demodulator.

 For an up-to-date list of devices supported by this driver, have a look
 on the Linux-DVB Wiki at www.linuxtv.org.

 Say Y if you own such a device and want to use it. You should build it as
 a module.
endef

$(eval $(call KernelPackage,dvb-usb-dibusb-mc))


define KernelPackage/dvb-usb-dibusb-mb
  TITLE := DiBcom USB DVB-T devices (DiB3000M-B based)
  V4L_KCONFIG :=  \
	CONFIG_DVB_USB_DIBUSB_MB_FAULTY=y \
	CONFIG_DVB_USB_DIBUSB_MB
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-dibusb-mb.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-dibusb-mb)
  $(call AddDepends/dvb-usb,+kmod-dvb-dib3000mb +kmod-dvb-usb-dibusb-common)
endef

define KernelPackage/dvb-usb-dibusb-mb/description
 Support for USB 1.1 and 2.0 DVB-T receivers based on reference designs made by
 DiBcom (<http://www.dibcom.fr>) equipped with a DiB3000M-B demodulator.

 For an up-to-date list of devices supported by this driver, have a look
 on the Linux-DVB Wiki at www.linuxtv.org.

 Say Y if you own such a device and want to use it. You should build it as
 a module.
endef

$(eval $(call KernelPackage,dvb-usb-dibusb-mb))


define KernelPackage/dvb-usb-rtl28xxu
  TITLE := Realtek RTL28xxU DVB USB support
  V4L_KCONFIG := CONFIG_DVB_USB_RTL28XXU
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-rtl28xxu.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-rtl28xxu)
  $(call AddDepends/dvb-usb-v2,+kmod-dvb-rtl2830 +kmod-dvb-rtl2832)
endef

define KernelPackage/dvb-usb-rtl28xxu/description
 Realtek RTL28xxU DVB USB support
endef

$(eval $(call KernelPackage,dvb-usb-rtl28xxu))


define KernelPackage/dvb-usb-ttusb2
  TITLE := Pinnacle 400e DVB-S USB2.0 support
  V4L_KCONFIG := CONFIG_DVB_USB_TTUSB2
  FILES := $(PKG_BUILD_DIR)/v4l/dvb-usb-ttusb2.ko
  AUTOLOAD := $(call AutoProbe,dvb-usb-ttusb2)
  $(call AddDepends/dvb-usb)
endef

define KernelPackage/dvb-usb-ttusb2/description
 Say Y here to support the Pinnacle 400e DVB-S USB2.0 receiver and
 the TechnoTrend CT-3650 CI DVB-C/T USB2.0 receiver. The
 firmware protocol used by this module is similar to the one used by the
 old ttusb-driver - that's why the module is called dvb-usb-ttusb2.
endef

$(eval $(call KernelPackage,dvb-usb-ttusb2))
