define DvbFE
  SUBMENU := $(LINUXTV_MENU)
  KCONFIG := $(2)
  FILES := $(PKG_BUILD_DIR)/v4l/$(1).ko
  AUTOLOAD := $(call AutoProbe,$(1))
  DEPENDS := +kmod-i2c-core $(3)
endef


define KernelPackage/dvb-fe-a8293
  TITLE := Allegro A8293
  $(call DvbFE,a8293,CONFIG_DVB_A8293)
endef
$(eval $(call KernelPackage,dvb-fe-a8293))


define KernelPackage/dvb-fe-af9013
  TITLE := Afatech AF9013
  $(call DvbFE,af9013,CONFIG_DVB_AF9013,+kmod-dvb-core +kmod-i2c-mux +kmod-regmap-core)
endef
$(eval $(call KernelPackage,dvb-fe-af9013))


define KernelPackage/dvb-fe-af9033
  TITLE := Afatech AF9033
  $(call DvbFE,af9033,CONFIG_DVB_AF9033,+kmod-dvb-core +kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-af9033))


define KernelPackage/dvb-fe-ascot2e
  TITLE := Sony Ascot2E
  $(call DvbFE,ascot2e,CONFIG_DVB_ASCOT2E)
endef
$(eval $(call KernelPackage,dvb-fe-ascot2e))


define KernelPackage/dvb-fe-atbm8830
  TITLE := AltoBeam ATBM8830/8831
  $(call DvbFE,atbm8830,CONFIG_DVB_ATBM8830)
endef
$(eval $(call KernelPackage,dvb-fe-atbm8830))


define KernelPackage/dvb-fe-au8522
  SUBMENU := $(LINUXTV_MENU)
  TITLE := Auvitek AU8522 ATV/DTV
  KCONFIG := \
	CONFIG_DVB_AU8522 \
	CONFIG_DVB_AU8522_DTV \
	CONFIG_DVB_AU8522_V4L
  FILES := \
	$(PKG_BUILD_DIR)/v4l/au8522_common.ko \
	$(PKG_BUILD_DIR)/v4l/au8522_decoder.ko \
	$(PKG_BUILD_DIR)/v4l/au8522_dig.ko
  AUTOLOAD := $(call AutoProbe,au8522_decoder au8522_dig)
  DEPENDS := +kmod-i2c-core +kmod-videodev
endef
$(eval $(call KernelPackage,dvb-fe-au8522))


define KernelPackage/dvb-fe-avl6882
  TITLE := Availink AVL6882
  $(call DvbFE,avl6882,CONFIG_DVB_AVL6882,@V4L_SRC_TBSDTV)
endef
$(eval $(call KernelPackage,dvb-fe-avl6882))


define KernelPackage/dvb-fe-bcm3510
  TITLE := Broadcom BCM3510
  $(call DvbFE,bcm3510,CONFIG_DVB_BCM3510)
endef
$(eval $(call KernelPackage,dvb-fe-bcm3510))


define KernelPackage/dvb-fe-cx22700
  TITLE := Conexant CX22700
  $(call DvbFE,cx22700,CONFIG_DVB_CX22700)
endef
$(eval $(call KernelPackage,dvb-fe-cx22700))


define KernelPackage/dvb-fe-cx22702
  TITLE := Conexant CX22702
  $(call DvbFE,cx22702,CONFIG_DVB_CX22702)
endef
$(eval $(call KernelPackage,dvb-fe-cx22702))


define KernelPackage/dvb-fe-cx24110
  TITLE := Conexant CX24110
  $(call DvbFE,cx24110,CONFIG_DVB_CX24110)
endef
$(eval $(call KernelPackage,dvb-fe-cx24110))


define KernelPackage/dvb-fe-cx24113
  TITLE := Conexant CX24113
  $(call DvbFE,cx24113,CONFIG_DVB_TUNER_CX24113)
endef
$(eval $(call KernelPackage,dvb-fe-cx24113))


define KernelPackage/dvb-fe-cx24116
  TITLE := Conexant CX24116
  $(call DvbFE,cx24116,CONFIG_DVB_CX24116)
endef
$(eval $(call KernelPackage,dvb-fe-cx24116))


define KernelPackage/dvb-fe-cx24117
  TITLE := Conexant CX24117
  $(call DvbFE,cx24117,CONFIG_DVB_CX24117)
endef
$(eval $(call KernelPackage,dvb-fe-cx24117))


define KernelPackage/dvb-fe-cx24120
  TITLE := Conexant CX24120
  $(call DvbFE,cx24120,CONFIG_DVB_CX24120)
endef
$(eval $(call KernelPackage,dvb-fe-cx24120))


define KernelPackage/dvb-fe-cx24123
  TITLE := Conexant CX24123
  $(call DvbFE,cx24123,CONFIG_DVB_CX24123)
endef
$(eval $(call KernelPackage,dvb-fe-cx24123))


define KernelPackage/dvb-fe-cxd2099
  TITLE := Sony CXD2099AR
  $(call DvbFE,cxd2099,CONFIG_DVB_CXD2099,+kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-cxd2099))


define KernelPackage/dvb-fe-cxd2820r
  TITLE := Sony CXD2820R
  $(call DvbFE,cxd2820r,CONFIG_DVB_CXD2820R,+kmod-dvb-core +kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-cxd2820r))


define KernelPackage/dvb-fe-cxd2841er
  TITLE := Sony CXD2841ER
  $(call DvbFE,cxd2841er,CONFIG_DVB_CXD2841ER,+kmod-dvb-core)
endef
$(eval $(call KernelPackage,dvb-fe-cxd2841er))


define KernelPackage/dvb-fe-cxd2880
  TITLE := Sony CXD2880
  $(call DvbFE,cxd2880,CONFIG_DVB_CXD2880,+kmod-dvb-core)
endef
$(eval $(call KernelPackage,dvb-fe-cxd2880))


define KernelPackage/dvb-fe-dib0070
  TITLE := DiBcom DiB0070
  $(call DvbFE,dib0070,CONFIG_DVB_TUNER_DIB0070)
endef
$(eval $(call KernelPackage,dvb-fe-dib0070))


define KernelPackage/dvb-fe-dib0090
  TITLE := DiBcom DiB0090
  $(call DvbFE,dib0090,CONFIG_DVB_TUNER_DIB0090)
endef
$(eval $(call KernelPackage,dvb-fe-dib0090))


define KernelPackage/dvb-fe-dib3000mb
  TITLE := DiBcom 3000M-B
  $(call DvbFE,dib3000mb,CONFIG_DVB_DIB3000MB)
endef
$(eval $(call KernelPackage,dvb-fe-dib3000mb))


define KernelPackage/dvb-fe-dib3000mc
  TITLE := DiBcom 3000P/M-C
  $(call DvbFE,dib3000mc,CONFIG_DVB_DIB3000MC,+kmod-dvb-fe-dibx000-common)
endef
$(eval $(call KernelPackage,dvb-fe-dib3000mc))


define KernelPackage/dvb-fe-dib7000m
  TITLE := DiBcom 7000MA/MB/PA/PB/MC
  $(call DvbFE,dib7000m,CONFIG_DVB_DIB7000M,+kmod-dvb-fe-dibx000-common)
endef
$(eval $(call KernelPackage,dvb-fe-dib7000m))


define KernelPackage/dvb-fe-dib7000p
  TITLE := DiBcom 7000PC
  $(call DvbFE,dib7000p,CONFIG_DVB_DIB7000P,+kmod-dvb-core +kmod-dvb-fe-dibx000-common)
endef
$(eval $(call KernelPackage,dvb-fe-dib7000p))


define KernelPackage/dvb-fe-dib8000
  TITLE := DiBcom 8000MB/MC
  $(call DvbFE,dib8000,CONFIG_DVB_DIB8000,+kmod-dvb-core +kmod-dvb-fe-dibx000-common)
endef
$(eval $(call KernelPackage,dvb-fe-dib8000))


define KernelPackage/dvb-fe-dib9000
  TITLE := DiBcom 9000
  $(call DvbFE,dib9000,CONFIG_DVB_DIB9000,+kmod-dvb-core +kmod-dvb-fe-dibx000-common)
endef
$(eval $(call KernelPackage,dvb-fe-dib9000))


define KernelPackage/dvb-fe-dibx000-common
  TITLE := Common library for DiBX000 drivers
  $(call DvbFE,dibx000_common,,+kmod-i2c-core)
endef
$(eval $(call KernelPackage,dvb-fe-dibx000-common))


define KernelPackage/dvb-fe-drx39xyj
  TITLE := Micronas DRX-J
  $(call DvbFE,drx39xyj,CONFIG_DVB_DRX39XYJ)
endef
$(eval $(call KernelPackage,dvb-fe-drx39xyj))


define KernelPackage/dvb-fe-drxd
  TITLE := Micronas DRXD
  $(call DvbFE,drxd,CONFIG_DVB_DRXD)
endef
$(eval $(call KernelPackage,dvb-fe-drxd))


define KernelPackage/dvb-fe-drxk
  TITLE := Micronas DRXK
  $(call DvbFE,drxk,CONFIG_DVB_DRXK,+kmod-dvb-core)
endef
$(eval $(call KernelPackage,dvb-fe-drxk))


define KernelPackage/dvb-fe-ds3000
  TITLE := Montage Tehnology DS3000
  $(call DvbFE,ds3000,CONFIG_DVB_DS3000)
endef
$(eval $(call KernelPackage,dvb-fe-ds3000))


define KernelPackage/dvb-fe-ec100
  TITLE := E3C EC100
  $(call DvbFE,ec100,CONFIG_DVB_EC100)
endef
$(eval $(call KernelPackage,dvb-fe-ec100))


define KernelPackage/dvb-fe-gx1133
  TITLE := National Chip GX1133
  $(call DvbFE,gx1133,CONFIG_DVB_GX1133,@V4L_SRC_TBSDTV +kmod-i2c-mux)
endef
$(eval $(call KernelPackage,dvb-fe-gx1133))


define KernelPackage/dvb-fe-gx1503
  TITLE := National Chip GX1503b
  $(call DvbFE,gx1503,CONFIG_DVB_GX1503,@V4L_SRC_TBSDTV +kmod-i2c-mux +kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-gx1503))


define KernelPackage/dvb-fe-helene
  TITLE := Sony HELENE (CXD2858ER)
  $(call DvbFE,helene,CONFIG_DVB_HELENE)
endef
$(eval $(call KernelPackage,dvb-fe-helene))


define KernelPackage/dvb-fe-horus3a
  TITLE := Sony Horus3A
  $(call DvbFE,horus3a,CONFIG_DVB_HORUS3A)
endef
$(eval $(call KernelPackage,dvb-fe-horus3a))


define KernelPackage/dvb-fe-isl6405
  TITLE := Intersil ISL6405
  $(call DvbFE,isl6405,CONFIG_DVB_ISL6405)
endef
$(eval $(call KernelPackage,dvb-fe-isl6405))


define KernelPackage/dvb-fe-isl6421
  TITLE := Intersil ISL6421
  $(call DvbFE,isl6421,CONFIG_DVB_ISL6421)
endef
$(eval $(call KernelPackage,dvb-fe-isl6421))


define KernelPackage/dvb-fe-isl6422
  TITLE := Intersil ISL6422[B]
  $(call DvbFE,isl6422,CONFIG_DVB_ISL6422,@V4L_SRC_TBSDTV)
endef
$(eval $(call KernelPackage,dvb-fe-isl6422))


define KernelPackage/dvb-fe-isl6423
  TITLE := Intersil ISL6423
  $(call DvbFE,isl6423,CONFIG_DVB_ISL6423)
endef
$(eval $(call KernelPackage,dvb-fe-isl6423))


define KernelPackage/dvb-fe-itd1000
  TITLE := Integrant ITD1000
  $(call DvbFE,itd1000,CONFIG_DVB_TUNER_ITD1000)
endef
$(eval $(call KernelPackage,dvb-fe-itd1000))


define KernelPackage/dvb-fe-ix2505v
  TITLE := Sharp IX2505V
  $(call DvbFE,ix2505v,CONFIG_DVB_IX2505V)
endef
$(eval $(call KernelPackage,dvb-fe-ix2505v))


define KernelPackage/dvb-fe-l64781
  TITLE := LSI L64781
  $(call DvbFE,l64781,CONFIG_DVB_L64781)
endef
$(eval $(call KernelPackage,dvb-fe-l64781))


define KernelPackage/dvb-fe-lg2160
  TITLE := LG Electronics LG216x
  $(call DvbFE,lg2160,CONFIG_DVB_LG2160)
endef
$(eval $(call KernelPackage,dvb-fe-lg2160))


define KernelPackage/dvb-fe-lgs8gl5
  TITLE := Legend Silicon LGS-8GL5
  $(call DvbFE,lgs8gl5,CONFIG_DVB_LGS8GL5)
endef
$(eval $(call KernelPackage,dvb-fe-lgs8gl5))


define KernelPackage/dvb-fe-lgs8gxx
  TITLE := Legend Silicon LGS8913/LGS8GL5/LGS8GXX
  $(call DvbFE,lgs8gxx,CONFIG_DVB_LGS8GXX)
endef
$(eval $(call KernelPackage,dvb-fe-lgs8gxx))


define KernelPackage/dvb-fe-lgdt3305
  TITLE := LG Electronics LGDT3304/LGDT3305
  $(call DvbFE,lgdt3305,CONFIG_DVB_LGDT3305,+kmod-dvb-core)
endef
$(eval $(call KernelPackage,dvb-fe-lgdt3305))


define KernelPackage/dvb-fe-lgdt3306a
  TITLE := LG Electronics LGDT3306A
  $(call DvbFE,lgdt3306a,CONFIG_DVB_LGDT3306A,+kmod-i2c-mux)
endef
$(eval $(call KernelPackage,dvb-fe-lgdt3306a))


define KernelPackage/dvb-fe-lgdt330x
  TITLE := LG Electronics LGDT3302/LGDT3303
  $(call DvbFE,lgdt330x,CONFIG_DVB_LGDT330X,+kmod-dvb-core)
endef
$(eval $(call KernelPackage,dvb-fe-lgdt330x))


define KernelPackage/dvb-fe-lnbh25
  TITLE := STMicroelectronics LNBH25
  $(call DvbFE,lnbh25,CONFIG_DVB_LNBH25)
endef
$(eval $(call KernelPackage,dvb-fe-lnbh25))


define KernelPackage/dvb-fe-lnbp21
  TITLE := STMicroelectronics LNBP21/LNBH24
  $(call DvbFE,lnbp21,CONFIG_DVB_LNBP21)
endef
$(eval $(call KernelPackage,dvb-fe-lnbp21))


define KernelPackage/dvb-fe-lnbp22
  TITLE := STMicroelectronics LNBP22
  $(call DvbFE,lnbp22,CONFIG_DVB_LNBP22)
endef
$(eval $(call KernelPackage,dvb-fe-lnbp22))


define KernelPackage/dvb-fe-m88ds3103
  TITLE := Montage Technology M88DS3103
  $(call DvbFE,m88ds3103,CONFIG_DVB_M88DS3103,+kmod-dvb-core +kmod-i2c-mux +kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-m88ds3103))


define KernelPackage/dvb-fe-m88rs2000
  TITLE := Montage Technology M88RS2000
  $(call DvbFE,m88rs2000,CONFIG_DVB_M88RS2000)
endef
$(eval $(call KernelPackage,dvb-fe-m88rs2000))


define KernelPackage/dvb-fe-m88rs6060
  TITLE := Montage Technology M88RS6060
  $(call DvbFE,m88rs6060,CONFIG_DVB_M88RS6060,@V4L_SRC_TBSDTV +kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-m88rs6060))


define KernelPackage/dvb-fe-mb86a16
  TITLE := Fujitsu MB86A16
  $(call DvbFE,mb86a16,CONFIG_DVB_MB86A16)
endef
$(eval $(call KernelPackage,dvb-fe-mb86a16))


define KernelPackage/dvb-fe-mb86a20s
  TITLE := Fujitsu MB86A20S
  $(call DvbFE,mb86a20s,CONFIG_DVB_MB86A20S)
endef
$(eval $(call KernelPackage,dvb-fe-mb86a20s))


define KernelPackage/dvb-fe-mn88436
  TITLE := Panasonic MN88436
  $(call DvbFE,mn88436,CONFIG_DVB_MN88436,@V4L_SRC_TBSDTV)
endef
$(eval $(call KernelPackage,dvb-fe-mn88436))


define KernelPackage/dvb-fe-mn88443x
  TITLE := Panasonic/Socionext MN88443x
  $(call DvbFE,mn88443x,CONFIG_DVB_MN88443X,+kmod-dvb-core +kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-mn88443x))


define KernelPackage/dvb-fe-mn88472
  TITLE := Panasonic MN88472
  $(call DvbFE,mn88472,CONFIG_DVB_MN88472,+kmod-dvb-core +kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-mn88472))


define KernelPackage/dvb-fe-mn88473
  TITLE := Panasonic MN88473
  $(call DvbFE,mn88473,CONFIG_DVB_MN88473,+kmod-dvb-core +kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-mn88473))


define KernelPackage/dvb-fe-mt312
  TITLE := Zarlink VP310/MT312/ZL10313
  $(call DvbFE,mt312,CONFIG_DVB_MT312)
endef
$(eval $(call KernelPackage,dvb-fe-mt312))


define KernelPackage/dvb-fe-mt352
  TITLE := Zarlink MT352
  $(call DvbFE,mt352,CONFIG_DVB_MT352)
endef
$(eval $(call KernelPackage,dvb-fe-mt352))


define KernelPackage/dvb-fe-mtv23x
  TITLE := RAONTECH mtv23x
  $(call DvbFE,mtv23x,CONFIG_DVB_MTV23X,@V4L_SRC_TBSDTV +kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-mtv23x))


define KernelPackage/dvb-fe-mxl58x
  TITLE := MaxLinear MxL58x
  $(call DvbFE,mxl58x,CONFIG_DVB_MXL58X,@V4L_SRC_TBSDTV)
endef
$(eval $(call KernelPackage,dvb-fe-mxl58x))


define KernelPackage/dvb-fe-mxl5xx
  TITLE := MaxLinear MxL5xx
  $(call DvbFE,mxl5xx,CONFIG_DVB_MXL5XX)
endef
$(eval $(call KernelPackage,dvb-fe-mxl5xx))


define KernelPackage/dvb-fe-nxt200x
  TITLE := NxtWave Communications NXT2002/NXT2004
  $(call DvbFE,nxt200x,CONFIG_DVB_NXT200X)
endef
$(eval $(call KernelPackage,dvb-fe-nxt200x))


define KernelPackage/dvb-fe-nxt6000
  TITLE := NxtWave Communications NXT6000
  $(call DvbFE,nxt6000,CONFIG_DVB_NXT6000)
endef
$(eval $(call KernelPackage,dvb-fe-nxt6000))


define KernelPackage/dvb-fe-or51132
  TITLE := Oren OR51132
  $(call DvbFE,or51132,CONFIG_DVB_OR51132,+kmod-dvb-core)
endef
$(eval $(call KernelPackage,dvb-fe-or51132))


define KernelPackage/dvb-fe-or51211
  TITLE := Oren OR51211
  $(call DvbFE,or51211,CONFIG_DVB_OR51211,+kmod-dvb-core)
endef
$(eval $(call KernelPackage,dvb-fe-or51211))


define KernelPackage/dvb-fe-rtl2830
  TITLE := Realtek RTL2830
  $(call DvbFE,rtl2830,CONFIG_DVB_RTL2830,+kmod-dvb-core +kmod-i2c-mux +kmod-regmap-core)
endef
$(eval $(call KernelPackage,dvb-fe-rtl2830))


define KernelPackage/dvb-fe-rtl2832
  TITLE := Realtek RTL2832
  $(call DvbFE,rtl2832,CONFIG_DVB_RTL2832,+kmod-dvb-core +kmod-i2c-mux +kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-rtl2832))


define KernelPackage/dvb-fe-rtl2832-sdr
  TITLE := Realtek RTL2832 SDR
  $(call DvbFE,rtl2832_sdr,CONFIG_DVB_RTL2832_SDR,+kmod-regmap-core +kmod-usb-core +kmod-videobuf2-v4l2 +kmod-videobuf2-vmalloc)
endef
$(eval $(call KernelPackage,dvb-fe-rtl2832-sdr))


define KernelPackage/dvb-fe-s5h1409
  TITLE := Samsung S5H1409
  $(call DvbFE,s5h1409,CONFIG_DVB_S5H1409)
endef
$(eval $(call KernelPackage,dvb-fe-s5h1409))


define KernelPackage/dvb-fe-s5h1411
  TITLE := Samsung S5H1411
  $(call DvbFE,s5h1411,CONFIG_DVB_S5H1411)
endef
$(eval $(call KernelPackage,dvb-fe-s5h1411))


define KernelPackage/dvb-fe-s5h1420
  TITLE := Samsung S5H1420
  $(call DvbFE,s5h1420,CONFIG_DVB_S5H1420)
endef
$(eval $(call KernelPackage,dvb-fe-s5h1420))


define KernelPackage/dvb-fe-s5h1432
  TITLE := Samsung S5H1432
  $(call DvbFE,s5h1432,CONFIG_DVB_S5H1432)
endef
$(eval $(call KernelPackage,dvb-fe-s5h1432))


define KernelPackage/dvb-fe-s921
  TITLE := Sharp S921
  $(call DvbFE,s921,CONFIG_DVB_S921)
endef
$(eval $(call KernelPackage,dvb-fe-s921))


define KernelPackage/dvb-fe-si2165
  TITLE := Silicon Labs Si2165
  $(call DvbFE,si2165,CONFIG_DVB_SI2165,+kmod-dvb-core +kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-si2165))


define KernelPackage/dvb-fe-si2168
  TITLE := Silicon Labs Si2168
  $(call DvbFE,si2168,CONFIG_DVB_SI2168,+kmod-i2c-mux)
endef
$(eval $(call KernelPackage,dvb-fe-si2168))


define KernelPackage/dvb-fe-si2183
  TITLE := Silicon Labs Si2183
  $(call DvbFE,si2183,CONFIG_DVB_SI2183,@V4L_SRC_TBSDTV +kmod-i2c-mux)
endef
$(eval $(call KernelPackage,dvb-fe-si2183))


define KernelPackage/dvb-fe-si21xx
  TITLE := Silicon Labs Si21XX
  $(call DvbFE,si21xx,CONFIG_DVB_SI21XX)
endef
$(eval $(call KernelPackage,dvb-fe-si21xx))


define KernelPackage/dvb-fe-sp2
  TITLE := CIMaX SP2/SP2HF
  $(call DvbFE,sp2,CONFIG_DVB_SP2,+kmod-dvb-core)
endef
$(eval $(call KernelPackage,dvb-fe-sp2))


define KernelPackage/dvb-fe-sp887x
  TITLE := Spase sp887x
  $(call DvbFE,sp887x,CONFIG_DVB_SP887X)
endef
$(eval $(call KernelPackage,dvb-fe-sp887x))


define KernelPackage/dvb-fe-stb0899
  TITLE := STMicroelectronics STB0899
  $(call DvbFE,stb0899,CONFIG_DVB_STB0899)
endef
$(eval $(call KernelPackage,dvb-fe-stb0899))


define KernelPackage/dvb-fe-stb6000
  TITLE := STMicroelectronics STB6000
  $(call DvbFE,stb6000,CONFIG_DVB_STB6000)
endef
$(eval $(call KernelPackage,dvb-fe-stb6000))


define KernelPackage/dvb-fe-stb6100
  TITLE := STMicroelectronics STB6100
  $(call DvbFE,stb6100,CONFIG_DVB_STB6100)
endef
$(eval $(call KernelPackage,dvb-fe-stb6100))


define KernelPackage/dvb-fe-stv0288
  TITLE := STMicroelectronics STV0288
  $(call DvbFE,stv0288,CONFIG_DVB_STV0288)
endef
$(eval $(call KernelPackage,dvb-fe-stv0288))


define KernelPackage/dvb-fe-stv0297
  TITLE := STMicroelectronics STV0297
  $(call DvbFE,stv0297,CONFIG_DVB_STV0297)
endef
$(eval $(call KernelPackage,dvb-fe-stv0297))


define KernelPackage/dvb-fe-stv0299
  TITLE := STMicroelectronics STV0299
  $(call DvbFE,stv0299,CONFIG_DVB_STV0299,+kmod-dvb-core)
endef
$(eval $(call KernelPackage,dvb-fe-stv0299))


define KernelPackage/dvb-fe-stv0367
  TITLE := STMicroelectronics STV0367
  $(call DvbFE,stv0367,CONFIG_DVB_STV0367,+kmod-dvb-core)
endef
$(eval $(call KernelPackage,dvb-fe-stv0367))


define KernelPackage/dvb-fe-stv0900
  TITLE := STMicroelectronics STV0900
  $(call DvbFE,stv0900,CONFIG_DVB_STV0900)
endef
$(eval $(call KernelPackage,dvb-fe-stv0900))


define KernelPackage/dvb-fe-stv090x
  TITLE := STMicroelectronics STV0900/STV0903(A/B)
  $(call DvbFE,stv090x,CONFIG_DVB_STV090x)
endef
$(eval $(call KernelPackage,dvb-fe-stv090x))


define KernelPackage/dvb-fe-stv0910
  TITLE := STMicroelectronics STV0910
  $(call DvbFE,stv0910,CONFIG_DVB_STV0910)
endef
$(eval $(call KernelPackage,dvb-fe-stv0910))


define KernelPackage/dvb-fe-stv091x
  TITLE := STMicroelectronics STV091x
  $(call DvbFE,stv091x,CONFIG_DVB_STV091X,@V4L_SRC_TBSDTV)
endef
$(eval $(call KernelPackage,dvb-fe-stv091x))


define KernelPackage/dvb-fe-stv6110
  TITLE := STMicroelectronics STV6110
  $(call DvbFE,stv6110,CONFIG_DVB_STV6110)
endef
$(eval $(call KernelPackage,dvb-fe-stv6110))


define KernelPackage/dvb-fe-stv6110x
  TITLE := STMicroelectronics STV6110/(A)
  $(call DvbFE,stv6110x,CONFIG_DVB_STV6110x)
endef
$(eval $(call KernelPackage,dvb-fe-stv6110x))


define KernelPackage/dvb-fe-stv6111
  TITLE := STMicroelectronics STV6111
  $(call DvbFE,stv6111,CONFIG_DVB_STV6111)
endef
$(eval $(call KernelPackage,dvb-fe-stv6111))


define KernelPackage/dvb-fe-tas2101
  TITLE := Tmax TAS2101
  $(call DvbFE,tas2101,CONFIG_DVB_TAS2101,@V4L_SRC_TBSDTV +kmod-i2c-mux)
endef
$(eval $(call KernelPackage,dvb-fe-tas2101))


define KernelPackage/dvb-fe-tas2971
  TITLE := Tmax TAS2971
  $(call DvbFE,tas2971,CONFIG_DVB_TAS2971,@V4L_SRC_TBSDTV +kmod-i2c-mux)
endef
$(eval $(call KernelPackage,dvb-fe-tas2971))


define KernelPackage/dvb-fe-tbs-priv
  TITLE := TBS private virtual demodulator
  $(call DvbFE,tbs_priv,CONFIG_DVB_TBSPRIV,@V4L_SRC_TBSDTV)
endef
$(eval $(call KernelPackage,dvb-fe-tbs-priv))


define KernelPackage/dvb-fe-tc90522
  TITLE := Toshiba TC90522
  $(call DvbFE,tc90522,CONFIG_DVB_TC90522,+kmod-dvb-core)
endef
$(eval $(call KernelPackage,dvb-fe-tc90522))


define KernelPackage/dvb-fe-tda10021
  TITLE := Philips TDA10021
  $(call DvbFE,tda10021,CONFIG_DVB_TDA10021)
endef
$(eval $(call KernelPackage,dvb-fe-tda10021))


define KernelPackage/dvb-fe-tda10023
  TITLE := Philips TDA10023
  $(call DvbFE,tda10023,CONFIG_DVB_TDA10023)
endef
$(eval $(call KernelPackage,dvb-fe-tda10023))


define KernelPackage/dvb-fe-tda10048
  TITLE := Philips TDA10048HN
  $(call DvbFE,tda10048,CONFIG_DVB_TDA10048)
endef
$(eval $(call KernelPackage,dvb-fe-tda10048))


define KernelPackage/dvb-fe-tda1004x
  TITLE := Philips TDA10045H/TDA10046H
  $(call DvbFE,tda1004x,CONFIG_DVB_TDA1004X)
endef
$(eval $(call KernelPackage,dvb-fe-tda1004x))


define KernelPackage/dvb-fe-tda10071
  TITLE := NXP TDA10071
  $(call DvbFE,tda10071,CONFIG_DVB_TDA10071,+kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-tda10071))


define KernelPackage/dvb-fe-tda10086
  TITLE := Philips TDA10086
  $(call DvbFE,tda10086,CONFIG_DVB_TDA10086)
endef
$(eval $(call KernelPackage,dvb-fe-tda10086))


define KernelPackage/dvb-fe-tda18271c2dd
  TITLE := NXP TDA18271C2
  $(call DvbFE,tda18271c2dd,CONFIG_DVB_TDA18271C2DD)
endef
$(eval $(call KernelPackage,dvb-fe-tda18271c2dd))


define KernelPackage/dvb-fe-tda665x
  TITLE := Philips TDA6650/TDA6651
  $(call DvbFE,tda665x,CONFIG_DVB_TDA665x)
endef
$(eval $(call KernelPackage,dvb-fe-tda665x))


define KernelPackage/dvb-fe-tda8083
  TITLE := Philips TDA8083
  $(call DvbFE,tda8083,CONFIG_DVB_TDA8083)
endef
$(eval $(call KernelPackage,dvb-fe-tda8083))


define KernelPackage/dvb-fe-tda8261
  TITLE := Philips TDA8261
  $(call DvbFE,tda8261,CONFIG_DVB_TDA8261)
endef
$(eval $(call KernelPackage,dvb-fe-tda8261))


define KernelPackage/dvb-fe-tda826x
  TITLE := Philips TDA826X
  $(call DvbFE,tda826x,CONFIG_DVB_TDA826X)
endef
$(eval $(call KernelPackage,dvb-fe-tda826x))


define KernelPackage/dvb-fe-ts2020
  TITLE := Montage Tehnology TS2020
  $(call DvbFE,ts2020,CONFIG_DVB_TS2020,+kmod-regmap-i2c)
endef
$(eval $(call KernelPackage,dvb-fe-ts2020))


define KernelPackage/dvb-fe-tua6100
  TITLE := Infineon TUA6100
  $(call DvbFE,tua6100,CONFIG_DVB_TUA6100)
endef
$(eval $(call KernelPackage,dvb-fe-tua6100))


define KernelPackage/dvb-fe-ves1820
  TITLE := VLSI VES1820
  $(call DvbFE,ves1820,CONFIG_DVB_VES1820)
endef
$(eval $(call KernelPackage,dvb-fe-ves1820))


define KernelPackage/dvb-fe-ves1x93
  TITLE := VLSI VES1893/VES1993
  $(call DvbFE,ves1x93,CONFIG_DVB_VES1X93)
endef
$(eval $(call KernelPackage,dvb-fe-ves1x93))


define KernelPackage/dvb-fe-zd1301-demod
  TITLE := ZyDAS ZD1301
  $(call DvbFE,zd1301_demod,CONFIG_DVB_ZD1301_DEMOD)
endef
$(eval $(call KernelPackage,dvb-fe-zd1301-demod))


define KernelPackage/dvb-fe-zl10036
  TITLE := Zarlink ZL10036
  $(call DvbFE,zl10036,CONFIG_DVB_ZL10036)
endef
$(eval $(call KernelPackage,dvb-fe-zl10036))


define KernelPackage/dvb-fe-zl10039
  TITLE := Zarlink ZL10039
  $(call DvbFE,zl10039,CONFIG_DVB_ZL10039)
endef
$(eval $(call KernelPackage,dvb-fe-zl10039))


define KernelPackage/dvb-fe-zl10353
  TITLE := Zarlink ZL10353
  $(call DvbFE,zl10353,CONFIG_DVB_ZL10353)
endef
$(eval $(call KernelPackage,dvb-fe-zl10353))


define KernelPackage/dvb-pll
  TITLE := Generic I2C PLL based tuners
  $(call DvbFE,dvb-pll,CONFIG_DVB_PLL)
endef
$(eval $(call KernelPackage,dvb-pll))
