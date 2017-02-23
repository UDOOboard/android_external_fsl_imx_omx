ifeq ($(HAVE_FSL_IMX_CODEC),true)

LOCAL_PATH := $(call my-dir)

# LOCAL_PATH will be changed by each Android.mk under this. So save it firstly
FSL_OMX_PATH := $(LOCAL_PATH)

include $(CLEAR_VARS)

ANDROID_VERSION_LIST = -DFROYO=220 -DGINGER_BREAD=230 -DHONEY_COMB=300 \
		       -DICS=400 -DJELLY_BEAN_42=420 -DJELLY_BEAN_43=430 -DKITKAT_44=440 -DLOLLIPOP_50=500 \
               -DMARSH_MALLOW_600=600 -DNOUGAT=700

ANDROID_VERSION_MACRO := 700

ifeq ($(findstring x2.2,x$(PLATFORM_VERSION)), x2.2)
	ANDROID_VERSION_MACRO := 220
endif
ifeq ($(findstring x2.3,x$(PLATFORM_VERSION)), x2.3)
	ANDROID_VERSION_MACRO := 230
endif
ifeq ($(findstring x3.,x$(PLATFORM_VERSION)), x3.)
	ANDROID_VERSION_MACRO := 300
endif
ifeq ($(findstring x4.0,x$(PLATFORM_VERSION)), x4.0)
	ANDROID_VERSION_MACRO := 400
endif
ifeq ($(findstring x4.2,x$(PLATFORM_VERSION)), x4.2)
	ANDROID_VERSION_MACRO := 420
endif
ifeq ($(findstring x4.3,x$(PLATFORM_VERSION)), x4.3)
	ANDROID_VERSION_MACRO := 430
endif
ifeq ($(findstring x4.4,x$(PLATFORM_VERSION)), x4.4)
	ANDROID_VERSION_MACRO := 440
endif
ifeq ($(findstring x5.0,x$(PLATFORM_VERSION)), x5.0)
	ANDROID_VERSION_MACRO := 500
endif
ifeq ($(findstring x5.1,x$(PLATFORM_VERSION)), x5.1)
	ANDROID_VERSION_MACRO := 510
endif
ifeq ($(findstring x6.0.0,x$(PLATFORM_VERSION)), x6.0.0)
	ANDROID_VERSION_MACRO := 600
endif
ifeq ($(findstring x6.0.1,x$(PLATFORM_VERSION)), x6.0.1)
	ANDROID_VERSION_MACRO := 601
endif
ifeq ($(findstring x7.0,x$(PLATFORM_VERSION)), x7.0)
	ANDROID_VERSION_MACRO := 700
endif
ifeq ($(findstring x7.1,x$(PLATFORM_VERSION)), x7.1)
	ANDROID_VERSION_MACRO := 710
endif

FSL_OMX_CFLAGS += $(ANDROID_VERSION_LIST) -DANDROID_VERSION=$(ANDROID_VERSION_MACRO)

player := $(shell if [ $(ANDROID_VERSION_MACRO) -gt 600 ];then echo "simple_player";fi)
ifeq ($(player), simple_player)
	include $(FSL_OMX_PATH)/Android_simple_player.mk
else
	include $(FSL_OMX_PATH)/Android_full_player.mk
endif

endif
