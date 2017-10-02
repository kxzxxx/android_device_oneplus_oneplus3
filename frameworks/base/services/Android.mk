LOCAL_PATH:= $(call my-dir)

# merge all required services into one jar
# ============================================================
include $(CLEAR_VARS)

LOCAL_MODULE := services_mod

LOCAL_REQUIRED_MODULES := services

LOCAL_SRC_FILES := $(call all-java-files-under,.)

LOCAL_JAVA_LIBRARIES += services services.core org.cyanogenmod.platform.internal

include $(BUILD_JAVA_LIBRARY)

#######################################
# init.environ.rc

include $(CLEAR_VARS)
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE := init.environ.rc_hook
LOCAL_MODULE_PATH := $(TARGET_ROOT_OUT)
LOCAL_REQUIRED_MODULES := init.environ.rc services_mod
LOCAL_POST_INSTALL_CMD := $(hide) rm -rf $(TARGET_ROOT_OUT)/init.environ.rc && mv $(TARGET_ROOT_OUT)/init.environ.rc_hook $(TARGET_ROOT_OUT)/init.environ.rc

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): $(TARGET_ROOT_OUT)/init.environ.rc
	@echo "Hooking SYSTEMSERVERCLASSPATH: $< -> $@"
	@mkdir -p $(dir $@)
	$(hide) sed 's/:\/system\/framework\/org.cyanogenmod.hardware.jar:\/system\/framework\/services.jar:/:\/system\/framework\/org.cyanogenmod.hardware.jar:\/system\/framework\/services_mod.jar:\/system\/framework\/services.jar:/g' $< > $@
	
#######################################