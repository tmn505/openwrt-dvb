define DvbFrontend
  SUBMENU := $(DVB_MENU)
  V4L_KCONFIG := $2
  DEPENDS := +kmod-i2c-core
  FILES := $(PKG_BUILD_DIR)/v4l/$1.ko
  AUTOLOAD := $(call AutoProbe,$1)
endef


define KernelPackage/dvb-a8293
  TITLE := Allegro A8293
  $(call DvbFrontend,a8293,CONFIG_DVB_A8293)
endef
$(eval $(call KernelPackage,dvb-a8293))


define KernelPackage/dvb-af9013
  TITLE := Afatech AF9013
  $(call DvbFrontend,af9013,CONFIG_DVB_AF9013)
  DEPENDS += @LINUX_4_7
endef
$(eval $(call KernelPackage,dvb-af9013))


define KernelPackage/dvb-af9033
  TITLE := Afatech AF9033
  $(call DvbFrontend,af9033,CONFIG_DVB_AF9033)
  DEPENDS += +kmod-dvb-core +kmod-regmap
endef
$(eval $(call KernelPackage,dvb-af9033))


define KernelPackage/dvb-as102-fe
  TITLE := Abilis AS102 FE
  $(call DvbFrontend,as102_fe,CONFIG_DVB_AS102_FE)
endef
$(eval $(call KernelPackage,dvb-as102-fe))


define KernelPackage/dvb-ascot2e
  TITLE := Sony Ascot2E
  $(call DvbFrontend,ascot2e,CONFIG_DVB_ASCOT2E)
endef
$(eval $(call KernelPackage,dvb-ascot2e))


define KernelPackage/dvb-atbm8830
  TITLE := AltoBeam ATBM8830/8831
  $(call DvbFrontend,atbm8830,CONFIG_DVB_ATBM8830)
endef
$(eval $(call KernelPackage,dvb-atbm8830))


define KernelPackage/dvb-au8522-common
  TITLE := Auvitek AU8522
  $(call DvbFrontend,au8522_common,CONFIG_DVB_AU8522)
endef
$(eval $(call KernelPackage,dvb-au8522-common))


define KernelPackage/dvb-au8522-decoder
  SUBMENU := $(DVB_MENU)
  TITLE := Auvitek AU8522 ATV
  V4L_KCONFIG := CONFIG_DVB_AU8522_DTV
  DEPENDS := +kmod-dvb-au8522-common +kmod-v4l2-core
  FILES := $(PKG_BUILD_DIR)/v4l/au8522_decoder.ko
  AUTOLOAD := $(call AutoProbe,au8522_decoder)
endef
$(eval $(call KernelPackage,dvb-au8522-decoder))


define KernelPackage/dvb-au8522-dig
  SUBMENU := $(DVB_MENU)
  TITLE := Auvitek AU8522 DTV
  V4L_KCONFIG := CONFIG_DVB_AU8522_DTV
  DEPENDS := +kmod-dvb-au8522-common
  FILES := $(PKG_BUILD_DIR)/v4l/au8522_dig.ko
  AUTOLOAD := $(call AutoProbe,au8522_dig)
endef
$(eval $(call KernelPackage,dvb-au8522-dig))


define KernelPackage/dvb-avl6882
  TITLE := Availink AVL6882
  $(call DvbFrontend,avl6882,CONFIG_DVB_AVL6882)
  DEPENDS += @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,dvb-avl6882))


define KernelPackage/dvb-bcm3510
  TITLE := Broadcom BCM3510
  $(call DvbFrontend,bcm3510,CONFIG_DVB_BCM3510)
endef
$(eval $(call KernelPackage,dvb-bcm3510))


define KernelPackage/dvb-cx22700
  TITLE := Conexant CX22700
  $(call DvbFrontend,cx22700,CONFIG_DVB_CX22700)
endef
$(eval $(call KernelPackage,dvb-cx22700))


define KernelPackage/dvb-cx22702
  TITLE := Conexant CX22702
  $(call DvbFrontend,cx22702,CONFIG_DVB_CX22702)
endef
$(eval $(call KernelPackage,dvb-cx22702))


define KernelPackage/dvb-cx24110
  TITLE := Conexant CX24110
  $(call DvbFrontend,cx24110,CONFIG_DVB_CX24110)
endef
$(eval $(call KernelPackage,dvb-cx24110))


define KernelPackage/dvb-cx24113
  TITLE := Conexant CX24113
  $(call DvbFrontend,cx24113,CONFIG_DVB_CX24113)
endef
$(eval $(call KernelPackage,dvb-cx24113))


define KernelPackage/dvb-cx24116
  TITLE := Conexant CX24116
  $(call DvbFrontend,cx24116,CONFIG_DVB_CX24116)
endef
$(eval $(call KernelPackage,dvb-cx24116))


define KernelPackage/dvb-cx24117
  TITLE := Conexant CX24117
  $(call DvbFrontend,cx24117,CONFIG_DVB_CX24117)
endef
$(eval $(call KernelPackage,dvb-cx24117))


define KernelPackage/dvb-cx24120
  TITLE := Conexant CX24120
  $(call DvbFrontend,cx24120,CONFIG_DVB_CX24120)
endef
$(eval $(call KernelPackage,dvb-cx24120))


define KernelPackage/dvb-cx24123
  TITLE := Conexant CX24123
  $(call DvbFrontend,cx24123,CONFIG_DVB_CX24123)
endef
$(eval $(call KernelPackage,dvb-cx24123))


define KernelPackage/dvb-cxd2099
  TITLE := Sony CXD2099AR
  $(call DvbFrontend,cxd2099,CONFIG_DVB_CXD2099)
  DEPENDS += +kmod-regmap
endef
$(eval $(call KernelPackage,dvb-cxd2099))


define KernelPackage/dvb-cxd2820r
  TITLE := Sony CXD2820R
  $(call DvbFrontend,cxd2820r,CONFIG_DVB_CXD2820R)
  DEPENDS += +kmod-dvb-core +kmod-regmap
endef
$(eval $(call KernelPackage,dvb-cxd2820r))


define KernelPackage/dvb-cxd2841er
  TITLE := Sony CXD2841ER
  $(call DvbFrontend,cxd2841er,CONFIG_DVB_CXD2841ER)
  DEPENDS += +kmod-dvb-core
endef
$(eval $(call KernelPackage,dvb-cxd2841er))


define KernelPackage/dvb-cxd2880
  TITLE := Sony CXD2880
  $(call DvbFrontend,cxd2880,CONFIG_DVB_CXD2880)
  DEPENDS += +kmod-dvb-core
endef
$(eval $(call KernelPackage,dvb-cxd2880))


define KernelPackage/dvb-dib0070
  TITLE := DiBcom DiB0070
  $(call DvbFrontend,dib0070,CONFIG_DVB_TUNER_DIB0070)
endef
$(eval $(call KernelPackage,dvb-dib0070))


define KernelPackage/dvb-dib0090
  TITLE := DiBcom DiB0090
  $(call DvbFrontend,dib0090,CONFIG_DVB_TUNER_DIB0090)
endef
$(eval $(call KernelPackage,dvb-dib0090))


define KernelPackage/dvb-dib3000mb
  TITLE := DiBcom 3000M-B
  $(call DvbFrontend,dib3000mb,CONFIG_DVB_DIB3000MB)
endef
$(eval $(call KernelPackage,dvb-dib3000mb))


define KernelPackage/dvb-dib3000mc
  TITLE := DiBcom 3000P/M-C
  $(call DvbFrontend,dib3000mc,CONFIG_DVB_DIB3000MC)
  DEPENDS += +kmod-dvb-dibx000-common
endef
$(eval $(call KernelPackage,dvb-dib3000mc))


define KernelPackage/dvb-dib7000m
  TITLE := DiBcom 7000MA/MB/PA/PB/MC
  $(call DvbFrontend,dib7000m,CONFIG_DVB_DIB7000M)
  DEPENDS += +kmod-dvb-dibx000-common
endef
$(eval $(call KernelPackage,dvb-dib7000m))


define KernelPackage/dvb-dib7000p
  TITLE := DiBcom 7000PC
  $(call DvbFrontend,dib7000p,CONFIG_DVB_DIB7000P)
  DEPENDS += +kmod-dvb-core +kmod-dvb-dibx000-common
endef
$(eval $(call KernelPackage,dvb-dib7000p))


define KernelPackage/dvb-dib8000
  TITLE := DiBcom 8000MB/MC
  $(call DvbFrontend,dib8000,CONFIG_DVB_DIB8000)
  DEPENDS += +kmod-dvb-core +kmod-dvb-dibx000-common
endef
$(eval $(call KernelPackage,dvb-dib8000))


define KernelPackage/dvb-dib9000
  TITLE := DiBcom 9000
  $(call DvbFrontend,dib9000,CONFIG_DVB_DIB9000)
  DEPENDS += +kmod-dvb-core +kmod-dvb-dibx000-common
endef
$(eval $(call KernelPackage,dvb-dib9000))


define KernelPackage/dvb-dibx000-common
  SUBMENU := $(DVB_MENU)
  TITLE := Common library for DiBX000 drivers
  FILES := $(PKG_BUILD_DIR)/v4l/dibx000_common.ko
  AUTOLOAD := $(call AutoProbe,dibx000_common)
  DEPENDS := +kmod-i2c-core
endef
$(eval $(call KernelPackage,dvb-dibx000-common))


define KernelPackage/dvb-drx39xyj
  TITLE := Micronas DRX-J
  $(call DvbFrontend,drx39xyj,CONFIG_DVB_DRX39XYJ)
endef
$(eval $(call KernelPackage,dvb-drx39xyj))


define KernelPackage/dvb-drxd
  TITLE := Micronas DRXD
  $(call DvbFrontend,drxd,CONFIG_DVB_DRXD)
endef
$(eval $(call KernelPackage,dvb-drxd))


define KernelPackage/dvb-drxk
  TITLE := Micronas DRXK
  $(call DvbFrontend,drxk,CONFIG_DVB_DRXK)
  DEPENDS += +kmod-dvb-core
endef
$(eval $(call KernelPackage,dvb-drxk))


define KernelPackage/dvb-ds3000
  TITLE := Montage Tehnology DS3000
  $(call DvbFrontend,ds3000,CONFIG_DVB_DS3000)
endef
$(eval $(call KernelPackage,dvb-ds3000))


define KernelPackage/dvb-ec100
  TITLE := E3C EC100
  $(call DvbFrontend,ec100,CONFIG_DVB_EC100)
endef
$(eval $(call KernelPackage,dvb-ec100))


define KernelPackage/dvb-gp8psk-fe
  TITLE := Frontend Driver for Genpix DVB-S
  $(call DvbFrontend,gp8psk-fe,CONFIG_DVB_GP8PSK_FE)
endef
$(eval $(call KernelPackage,dvb-gp8psk-fe))


define KernelPackage/dvb-gx1503
  TITLE := National Chip GX1503b
  $(call DvbFrontend,gx1503,CONFIG_DVB_GX1503)
  DEPENDS += +kmod-i2c-mux +kmod-regmap @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,dvb-gx1503))


define KernelPackage/dvb-helene
  TITLE := Sony HELENE (CXD2858ER)
  $(call DvbFrontend,helene,CONFIG_DVB_HELENE)
endef
$(eval $(call KernelPackage,dvb-helene))


define KernelPackage/dvb-horus3a
  TITLE := Sony Horus3A
  $(call DvbFrontend,horus3a,CONFIG_DVB_HORUS3A)
endef
$(eval $(call KernelPackage,dvb-horus3a))


define KernelPackage/dvb-isl6405
  TITLE := Intersil ISL6405
  $(call DvbFrontend,isl6405,CONFIG_DVB_ISL6405)
endef
$(eval $(call KernelPackage,dvb-isl6405))


define KernelPackage/dvb-isl6421
  TITLE := Intersil ISL6421
  $(call DvbFrontend,isl6421,CONFIG_DVB_ISL6421)
endef
$(eval $(call KernelPackage,dvb-isl6421))


define KernelPackage/dvb-isl6422
  TITLE := Intersil ISL6422[B]
  $(call DvbFrontend,isl6422,CONFIG_DVB_ISL6422)
  DEPENDS += @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,dvb-isl6422))


define KernelPackage/dvb-isl6423
  TITLE := Intersil ISL6423
  $(call DvbFrontend,isl6423,CONFIG_DVB_ISL6423)
endef
$(eval $(call KernelPackage,dvb-isl6423))


define KernelPackage/dvb-itd1000
  TITLE := Integrant ITD1000
  $(call DvbFrontend,itd1000,CONFIG_DVB_ITD1000)
endef
$(eval $(call KernelPackage,dvb-itd1000))


define KernelPackage/dvb-ix2505v
  TITLE := Sharp IX2505V
  $(call DvbFrontend,ix2505v,CONFIG_DVB_IX2505V)
endef
$(eval $(call KernelPackage,dvb-ix2505v))


define KernelPackage/dvb-l64781
  TITLE := LSI L64781
  $(call DvbFrontend,l64781,CONFIG_DVB_L64781)
endef
$(eval $(call KernelPackage,dvb-l64781))


define KernelPackage/dvb-lg2160
  TITLE := LG Electronics LG216x
  $(call DvbFrontend,lg2160,CONFIG_DVB_LG2160)
endef
$(eval $(call KernelPackage,dvb-lg2160))


define KernelPackage/dvb-lgs8gl5
  TITLE := Legend Silicon LGS-8GL5
  $(call DvbFrontend,lgs8gl5,CONFIG_DVB_LGS8GL5)
endef
$(eval $(call KernelPackage,dvb-lgs8gl5))


define KernelPackage/dvb-lgs8gxx
  TITLE := Legend Silicon LGS8913/LGS8GL5/LGS8GXX
  $(call DvbFrontend,lgs8gxx,CONFIG_DVB_LGS8GXX)
endef
$(eval $(call KernelPackage,dvb-lgs8gxx))


define KernelPackage/dvb-lgdt3305
  TITLE := LG Electronics LGDT3304/LGDT3305
  $(call DvbFrontend,lgdt3305,CONFIG_DVB_LGDT3305)
  DEPENDS += +kmod-dvb-core
endef
$(eval $(call KernelPackage,dvb-lgdt3305))


define KernelPackage/dvb-lgdt3306a
  TITLE := LG Electronics LGDT3306A
  $(call DvbFrontend,lgdt3306a,CONFIG_DVB_LGDT3306A)
  DEPENDS += +kmod-i2c-mux
endef
$(eval $(call KernelPackage,dvb-lgdt3306a))


define KernelPackage/dvb-lgdt330x
  TITLE := LG Electronics LGDT3302/LGDT3303
  $(call DvbFrontend,lgdt330x,CONFIG_DVB_LGDT330X)
  DEPENDS += +kmod-dvb-core
endef
$(eval $(call KernelPackage,dvb-lgdt330x))


define KernelPackage/dvb-lnbh25
  TITLE := STMicroelectronics LNBH25
  $(call DvbFrontend,lnbh25,CONFIG_DVB_LNBH25)
endef
$(eval $(call KernelPackage,dvb-lnbh25))


define KernelPackage/dvb-lnbp21
  TITLE := STMicroelectronics LNBP21/LNBH24
  $(call DvbFrontend,lnbp21,CONFIG_DVB_LNBP21)
endef
$(eval $(call KernelPackage,dvb-lnbp21))


define KernelPackage/dvb-lnbp22
  TITLE := STMicroelectronics LNBP22
  $(call DvbFrontend,lnbp22,CONFIG_DVB_LNBP22)
endef
$(eval $(call KernelPackage,dvb-lnbp22))


define KernelPackage/dvb-m88ds3103
  TITLE := Montage Technology M88DS3103
  $(call DvbFrontend,m88ds3103,CONFIG_DVB_M88DS3103)
  DEPENDS += +kmod-dvb-core +kmod-i2c-mux +kmod-regmap
endef
$(eval $(call KernelPackage,dvb-m88ds3103))


define KernelPackage/dvb-m88rs2000
  TITLE := Montage Technology M88RS2000
  $(call DvbFrontend,m88rs2000,CONFIG_DVB_M88RS2000)
endef
$(eval $(call KernelPackage,dvb-m88rs2000))


define KernelPackage/dvb-mb86a16
  TITLE := Fujitsu MB86A16
  $(call DvbFrontend,mb86a16,CONFIG_DVB_MB86A16)
endef
$(eval $(call KernelPackage,dvb-mb86a16))


define KernelPackage/dvb-mb86a20s
  TITLE := Fujitsu MB86A20S
  $(call DvbFrontend,mb86a20s,CONFIG_DVB_MB86A20S)
endef
$(eval $(call KernelPackage,dvb-mb86a20s))


define KernelPackage/dvb-mn88436
  TITLE := Panasonic MN88436
  $(call DvbFrontend,mn88436,CONFIG_DVB_MN88436)
  DEPENDS += +kmod-regmap @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,dvb-mn88436))


define KernelPackage/dvb-mn88443x
  TITLE := Panasonic/Socionext MN88443x
  $(call DvbFrontend,mn88443x,CONFIG_DVB_MN88443X)
  DEPENDS += @LINUX_4_9 +kmod-dvb-core +kmod-regmap
endef
$(eval $(call KernelPackage,dvb-mn88443x))


define KernelPackage/dvb-mn88472
  TITLE := Panasonic MN88472
  $(call DvbFrontend,mn88472,CONFIG_DVB_MN88472)
  DEPENDS += +kmod-dvb-core +kmod-regmap
endef
$(eval $(call KernelPackage,dvb-mn88472))


define KernelPackage/dvb-mn88473
  TITLE := Panasonic MN88473
  $(call DvbFrontend,mn88473,CONFIG_DVB_MN88473)
  DEPENDS += +kmod-dvb-core +kmod-regmap
endef
$(eval $(call KernelPackage,dvb-mn88473))


define KernelPackage/dvb-mt312
  TITLE := Zarlink VP310/MT312/ZL10313
  $(call DvbFrontend,mt312,CONFIG_DVB_MT312)
endef
$(eval $(call KernelPackage,dvb-mt312))


define KernelPackage/dvb-mt352
  TITLE := Zarlink MT352
  $(call DvbFrontend,mt352,CONFIG_DVB_MT352)
endef
$(eval $(call KernelPackage,dvb-mt352))


define KernelPackage/dvb-mtv23x
  TITLE := RAONTECH mtv23x
  $(call DvbFrontend,mtv23x,CONFIG_DVB_MTV23X)
  DEPENDS += +kmod-regmap @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,dvb-mtv23x))


define KernelPackage/dvb-mxl58x
  TITLE := MaxLinear MxL58x
  $(call DvbFrontend,mxl58x,CONFIG_DVB_MXL58X)
  DEPENDS += @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,dvb-mxl58x))


define KernelPackage/dvb-mxl5xx
  TITLE := MaxLinear MxL5xx
  $(call DvbFrontend,mxl5xx,CONFIG_DVB_MXL5XX)
endef
$(eval $(call KernelPackage,dvb-mxl5xx))


define KernelPackage/dvb-nxt200x
  TITLE := NxtWave Communications NXT2002/NXT2004
  $(call DvbFrontend,nxt200x,CONFIG_DVB_NXT200X)
endef
$(eval $(call KernelPackage,dvb-nxt200x))


define KernelPackage/dvb-nxt6000
  TITLE := NxtWave Communications NXT6000
  $(call DvbFrontend,nxt6000,CONFIG_DVB_NXT6000)
endef
$(eval $(call KernelPackage,dvb-nxt6000))


define KernelPackage/dvb-or51132
  TITLE := Oren OR51132
  $(call DvbFrontend,or51132,CONFIG_DVB_OR51132)
  DEPENDS += +kmod-dvb-core
endef
$(eval $(call KernelPackage,dvb-or51132))


define KernelPackage/dvb-or51211
  TITLE := Oren OR51211
  $(call DvbFrontend,or51211,CONFIG_DVB_OR51211)
  DEPENDS += +kmod-dvb-core
endef
$(eval $(call KernelPackage,dvb-or51211))


define KernelPackage/dvb-pll
  TITLE := Generic I2C PLL based tuners
  $(call DvbFrontend,dvb-pll,CONFIG_DVB_PLL)
endef
$(eval $(call KernelPackage,dvb-pll))


define KernelPackage/dvb-rtl2830
  TITLE := Realtek RTL2830
  $(call DvbFrontend,rtl2830,CONFIG_DVB_RTL2830)
  DEPENDS += +kmod-dvb-core +kmod-i2c-mux +kmod-regmap
endef
$(eval $(call KernelPackage,dvb-rtl2830))


define KernelPackage/dvb-rtl2832
  TITLE := Realtek RTL2832
  $(call DvbFrontend,rtl2832,CONFIG_DVB_RTL2832)
  DEPENDS += +kmod-dvb-core +kmod-i2c-mux +kmod-regmap
endef
$(eval $(call KernelPackage,dvb-rtl2832))


define KernelPackage/dvb-rtl2832-sdr
  TITLE := Realtek RTL2832 SDR
  $(call DvbFrontend,rtl2832_sdr,CONFIG_DVB_RTL2832_SDR)
  DEPENDS += +kmod-regmap +kmod-usb-core +kmod-videobuf2-v4l2 +kmod-videobuf2-vmalloc
endef
$(eval $(call KernelPackage,dvb-rtl2832-sdr))


define KernelPackage/dvb-s5h1409
  TITLE := Samsung S5H1409
  $(call DvbFrontend,s5h1409,CONFIG_DVB_S5H1409)
endef
$(eval $(call KernelPackage,dvb-s5h1409))


define KernelPackage/dvb-s5h1411
  TITLE := Samsung S5H1411
  $(call DvbFrontend,s5h1411,CONFIG_DVB_S5H1411)
endef
$(eval $(call KernelPackage,dvb-s5h1411))


define KernelPackage/dvb-s5h1420
  TITLE := Samsung S5H1420
  $(call DvbFrontend,s5h1420,CONFIG_DVB_S5H1420)
endef
$(eval $(call KernelPackage,dvb-s5h1420))


define KernelPackage/dvb-s5h1432
  TITLE := Samsung S5H1432
  $(call DvbFrontend,s5h1432,CONFIG_DVB_S5H1432)
endef
$(eval $(call KernelPackage,dvb-s5h1432))


define KernelPackage/dvb-s921
  TITLE := Sharp S921
  $(call DvbFrontend,s921,CONFIG_DVB_S921)
endef
$(eval $(call KernelPackage,dvb-s921))


define KernelPackage/dvb-si2165
  TITLE := Silicon Labs Si2165
  $(call DvbFrontend,si2165,CONFIG_DVB_SI2165)
  DEPENDS += +kmod-dvb-core +kmod-regmap
endef
$(eval $(call KernelPackage,dvb-si2165))


define KernelPackage/dvb-si2168
  TITLE := Silicon Labs Si2168
  $(call DvbFrontend,si2168,CONFIG_DVB_SI2168)
  DEPENDS += +kmod-i2c-mux
endef
$(eval $(call KernelPackage,dvb-si2168))


define KernelPackage/dvb-si2183
  TITLE := Silicon Labs Si2183
  $(call DvbFrontend,si2183,CONFIG_DVB_SI2183)
  DEPENDS += +kmod-i2c-mux @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,dvb-si2183))


define KernelPackage/dvb-si21xx
  TITLE := Silicon Labs Si21XX
  $(call DvbFrontend,si21xx,CONFIG_DVB_SI21XX)
endef
$(eval $(call KernelPackage,dvb-si21xx))


define KernelPackage/dvb-sp2
  TITLE := CIMaX SP2/SP2HF
  $(call DvbFrontend,sp2,CONFIG_DVB_SP2)
  DEPENDS += +kmod-dvb-core
endef
$(eval $(call KernelPackage,dvb-sp2))


define KernelPackage/dvb-sp8870
  TITLE := Spase sp8870
  $(call DvbFrontend,sp8870,CONFIG_DVB_SP8870)
endef
$(eval $(call KernelPackage,dvb-sp8870))


define KernelPackage/dvb-sp887x
  TITLE := Spase sp887x
  $(call DvbFrontend,sp887x,CONFIG_DVB_SP887X)
endef
$(eval $(call KernelPackage,dvb-sp887x))


define KernelPackage/dvb-stb0899
  TITLE := STMicroelectronics STB0899
  $(call DvbFrontend,stb0899,CONFIG_DVB_STB0899)
endef
$(eval $(call KernelPackage,dvb-stb0899))


define KernelPackage/dvb-stb6000
  TITLE := STMicroelectronics STB6000
  $(call DvbFrontend,stb6000,CONFIG_DVB_STB6000)
endef
$(eval $(call KernelPackage,dvb-stb6000))


define KernelPackage/dvb-stb6100
  TITLE := STMicroelectronics STB6100
  $(call DvbFrontend,stb6100,CONFIG_DVB_STB6100)
endef
$(eval $(call KernelPackage,dvb-stb6100))


define KernelPackage/dvb-stv0288
  TITLE := STMicroelectronics STV0288
  $(call DvbFrontend,stv0288,CONFIG_DVB_STV0288)
endef
$(eval $(call KernelPackage,dvb-stv0288))


define KernelPackage/dvb-stv0297
  TITLE := STMicroelectronics STV0297
  $(call DvbFrontend,stv0297,CONFIG_DVB_STV0297)
endef
$(eval $(call KernelPackage,dvb-stv0297))


define KernelPackage/dvb-stv0299
  TITLE := STMicroelectronics STV0299
  $(call DvbFrontend,stv0299,CONFIG_DVB_STV0299)
  DEPENDS += +kmod-dvb-core
endef
$(eval $(call KernelPackage,dvb-stv0299))


define KernelPackage/dvb-stv0367
  TITLE := STMicroelectronics STV0367
  $(call DvbFrontend,stv0367,CONFIG_DVB_STV0367)
  DEPENDS += +kmod-dvb-core
endef
$(eval $(call KernelPackage,dvb-stv0367))


define KernelPackage/dvb-stv0900
  TITLE := STMicroelectronics STV0900
  $(call DvbFrontend,stv0900,CONFIG_DVB_STV0900)
endef
$(eval $(call KernelPackage,dvb-stv0900))


define KernelPackage/dvb-stv090x
  TITLE := STMicroelectronics STV0900/STV0903(A/B)
  $(call DvbFrontend,stv090x,CONFIG_DVB_STV090x)
endef
$(eval $(call KernelPackage,dvb-stv090x))


define KernelPackage/dvb-stv0910
  TITLE := STMicroelectronics STV0910
  $(call DvbFrontend,stv0910,CONFIG_DVB_STV0910)
endef
$(eval $(call KernelPackage,dvb-stv0910))


define KernelPackage/dvb-stv091x
  TITLE := STMicroelectronics STV091x
  $(call DvbFrontend,stv091x,CONFIG_DVB_STV091X)
  DEPENDS += @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,dvb-stv091x))


define KernelPackage/dvb-stv6110
  TITLE := STMicroelectronics STV6110
  $(call DvbFrontend,stv6110,CONFIG_DVB_STV6110)
endef
$(eval $(call KernelPackage,dvb-stv6110))


define KernelPackage/dvb-stv6110x
  TITLE := STMicroelectronics STV6110/(A)
  $(call DvbFrontend,stv6110x,CONFIG_DVB_STV6110x)
endef
$(eval $(call KernelPackage,dvb-stv6110x))


define KernelPackage/dvb-stv6111
  TITLE := STMicroelectronics STV6111
  $(call DvbFrontend,stv6111,CONFIG_DVB_STV6111)
endef
$(eval $(call KernelPackage,dvb-stv6111))


define KernelPackage/dvb-tas2101
  TITLE := Tmax TAS2101
  $(call DvbFrontend,tas2101,CONFIG_DVB_TAS2101)
  DEPENDS += +kmod-i2c-mux @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,dvb-tas2101))


define KernelPackage/dvb-tas2971
  TITLE := Tmax TAS2971
  $(call DvbFrontend,tas2971,CONFIG_DVB_TAS2971)
  DEPENDS += +kmod-i2c-mux @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,dvb-tas2971))


define KernelPackage/dvb-tbs-priv
  TITLE := TBS private virtual demodulator
  $(call DvbFrontend,tbs_priv,CONFIG_DVB_TBSPRIV)
  DEPENDS += @V4L_SRC_TBSDTV
endef
$(eval $(call KernelPackage,dvb-tbs-priv))


define KernelPackage/dvb-tc90522
  TITLE := Toshiba TC90522
  $(call DvbFrontend,tc90522,CONFIG_DVB_TC90522)
  DEPENDS += +kmod-dvb-core
endef
$(eval $(call KernelPackage,dvb-tc90522))


define KernelPackage/dvb-tda10021
  TITLE := Philips TDA10021
  $(call DvbFrontend,tda10021,CONFIG_DVB_TDA10021)
endef
$(eval $(call KernelPackage,dvb-tda10021))


define KernelPackage/dvb-tda10023
  TITLE := Philips TDA10023
  $(call DvbFrontend,tda10023,CONFIG_DVB_TDA10023)
endef
$(eval $(call KernelPackage,dvb-tda10023))


define KernelPackage/dvb-tda10048
  TITLE := Philips TDA10048HN
  $(call DvbFrontend,tda10048,CONFIG_DVB_TDA10048)
endef
$(eval $(call KernelPackage,dvb-tda10048))


define KernelPackage/dvb-tda1004x
  TITLE := Philips TDA10045H/TDA10046H
  $(call DvbFrontend,tda1004x,CONFIG_DVB_TDA1004X)
endef
$(eval $(call KernelPackage,dvb-tda1004x))


define KernelPackage/dvb-tda10071
  TITLE := NXP TDA10071
  $(call DvbFrontend,tda10071,CONFIG_DVB_TDA10071)
  DEPENDS += +kmod-regmap
endef
$(eval $(call KernelPackage,dvb-tda10071))


define KernelPackage/dvb-tda10086
  TITLE := Philips TDA10086
  $(call DvbFrontend,tda10086,CONFIG_DVB_TDA10086)
endef
$(eval $(call KernelPackage,dvb-tda10086))


define KernelPackage/dvb-tda18271c2dd
  TITLE := NXP TDA18271C2
  $(call DvbFrontend,tda18271c2dd,CONFIG_DVB_TDA18271C2DD)
endef
$(eval $(call KernelPackage,dvb-tda18271c2dd))


define KernelPackage/dvb-tda665x
  TITLE := Philips TDA6650/TDA6651
  $(call DvbFrontend,tda665x,CONFIG_DVB_TDA665x)
endef
$(eval $(call KernelPackage,dvb-tda665x))


define KernelPackage/dvb-tda8083
  TITLE := Philips TDA8083
  $(call DvbFrontend,tda8083,CONFIG_DVB_TDA8083)
endef
$(eval $(call KernelPackage,dvb-tda8083))


define KernelPackage/dvb-tda8261
  TITLE := Philips TDA8261
  $(call DvbFrontend,tda8261,CONFIG_DVB_TDA8261)
endef
$(eval $(call KernelPackage,dvb-tda8261))


define KernelPackage/dvb-tda826x
  TITLE := Philips TDA826X
  $(call DvbFrontend,tda826x,CONFIG_DVB_TDA826X)
endef
$(eval $(call KernelPackage,dvb-tda826x))


define KernelPackage/dvb-ts2020
  TITLE := Montage Tehnology TS2020
  $(call DvbFrontend,ts2020,CONFIG_DVB_TS2020)
  DEPENDS += +kmod-regmap
endef
$(eval $(call KernelPackage,dvb-ts2020))


define KernelPackage/dvb-tua6100
  TITLE := Infineon TUA6100
  $(call DvbFrontend,tua6100,CONFIG_DVB_TUA6100)
endef
$(eval $(call KernelPackage,dvb-tua6100))


define KernelPackage/dvb-ves1820
  TITLE := VLSI VES1820
  $(call DvbFrontend,ves1820,CONFIG_DVB_VES1820)
endef
$(eval $(call KernelPackage,dvb-ves1820))


define KernelPackage/dvb-ves1x93
  TITLE := VLSI VES1893/VES1993
  $(call DvbFrontend,ves1x93,CONFIG_DVB_VES1X93)
endef
$(eval $(call KernelPackage,dvb-ves1x93))


define KernelPackage/dvb-zd1301-demod
  TITLE := ZyDAS ZD1301
  $(call DvbFrontend,zd1301_demod,CONFIG_DVB_ZD1301_DEMOD)
endef
$(eval $(call KernelPackage,dvb-zd1301-demod))


define KernelPackage/dvb-zl10036
  TITLE := Zarlink ZL10036
  $(call DvbFrontend,zl10036,CONFIG_DVB_ZL10036)
endef
$(eval $(call KernelPackage,dvb-zl10036))


define KernelPackage/dvb-zl10039
  TITLE := Zarlink ZL10039
  $(call DvbFrontend,zl10039,CONFIG_DVB_ZL10039)
endef
$(eval $(call KernelPackage,dvb-zl10039))


define KernelPackage/dvb-zl10353
  TITLE := Zarlink ZL10353
  $(call DvbFrontend,zl10353,CONFIG_DVB_ZL10353)
endef
$(eval $(call KernelPackage,dvb-zl10353))
