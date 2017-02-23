ifeq ($(HAVE_FSL_IMX_CODEC),true)


LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	SorensonDec.cpp
		
LOCAL_CFLAGS += $(FSL_OMX_CFLAGS) -fpic

LOCAL_LDFLAGS += $(FSL_OMX_LDFLAGS)
 
LOCAL_C_INCLUDES += $(FSL_OMX_INCLUDES) 

LOCAL_SHARED_LIBRARIES := lib_omx_common_v2_arm11_elinux \
                          lib_omx_osal_v2_arm11_elinux \
			  lib_omx_utils_v2_arm11_elinux \
			  lib_H263_dec_v2_arm11_elinux
			
LOCAL_PRELINK_MODULE := false
	
LOCAL_MODULE:= lib_omx_sorenson_dec_v2_arm11_elinux
LOCAL_MODULE_TAGS := eng

ifeq ($(TARGET_BOARD_PLATFORM), imx8)
LOCAL_MULTILIB := 32
LOCAL_MODULE_PATH_32 := $(TARGET_OUT)/lib
endif
include $(BUILD_SHARED_LIBRARY)

endif
