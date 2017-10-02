# Copyright 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH:= $(call my-dir)

#
# libcameraservice
#

relative_path_to_libcameraservice := ../../../../../frameworks/av/services/camera/libcameraservice

include $(CLEAR_VARS)

# Camera service source

LOCAL_SRC_FILES :=  \
	CameraService.cpp \
	$(relative_path_to_libcameraservice)/CameraFlashlight.cpp \
	$(relative_path_to_libcameraservice)/common/Camera2ClientBase.cpp \
	$(relative_path_to_libcameraservice)/common/CameraDeviceBase.cpp \
	$(relative_path_to_libcameraservice)/common/CameraModule.cpp \
	$(relative_path_to_libcameraservice)/common/FrameProcessorBase.cpp \
	api1/CameraClient.cpp \
	$(relative_path_to_libcameraservice)/api1/Camera2Client.cpp \
	$(relative_path_to_libcameraservice)/api1/client2/Parameters.cpp \
	$(relative_path_to_libcameraservice)/api1/client2/FrameProcessor.cpp \
	$(relative_path_to_libcameraservice)/api1/client2/StreamingProcessor.cpp \
	$(relative_path_to_libcameraservice)/api1/client2/JpegProcessor.cpp \
	$(relative_path_to_libcameraservice)/api1/client2/CallbackProcessor.cpp \
	$(relative_path_to_libcameraservice)/api1/client2/JpegCompressor.cpp \
	$(relative_path_to_libcameraservice)/api1/client2/CaptureSequencer.cpp \
	$(relative_path_to_libcameraservice)/api1/client2/ZslProcessor.cpp \
	$(relative_path_to_libcameraservice)/api2/CameraDeviceClient.cpp \
	$(relative_path_to_libcameraservice)/device3/Camera3Device.cpp \
	$(relative_path_to_libcameraservice)/device3/Camera3Stream.cpp \
	$(relative_path_to_libcameraservice)/device3/Camera3IOStreamBase.cpp \
	$(relative_path_to_libcameraservice)/device3/Camera3InputStream.cpp \
	$(relative_path_to_libcameraservice)/device3/Camera3OutputStream.cpp \
	$(relative_path_to_libcameraservice)/device3/Camera3ZslStream.cpp \
	$(relative_path_to_libcameraservice)/device3/Camera3DummyStream.cpp \
	$(relative_path_to_libcameraservice)/device3/StatusTracker.cpp \
	$(relative_path_to_libcameraservice)/device3/Camera3BufferManager.cpp \
	$(relative_path_to_libcameraservice)/gui/RingBufferConsumer.cpp \
	$(relative_path_to_libcameraservice)/utils/CameraTraces.cpp \
	$(relative_path_to_libcameraservice)/utils/AutoConditionLock.cpp \
	$(relative_path_to_libcameraservice)/utils/TagMonitor.cpp

LOCAL_SHARED_LIBRARIES:= \
	libui \
	liblog \
	libutils \
	libbinder \
	libcutils \
	libmedia \
	libmediautils \
	libcamera_client \
	libgui \
	libhardware \
	libsync \
	libcamera_metadata \
	libjpeg \
	libmemunreachable \

LOCAL_C_INCLUDES += \
	$(TOP)/frameworks/av/services/camera/libcameraservice/api1 \
	$(TOP)/frameworks/av/services/camera/libcameraservice/api1/client2 \
	$(TOP)/frameworks/av/services/camera/libcameraservice/api2 \
	$(TOP)/frameworks/av/services/camera/libcameraservice/common \
	$(TOP)/frameworks/av/services/camera/libcameraservice/device1 \
	$(TOP)/frameworks/av/services/camera/libcameraservice/device3 \
	$(TOP)/frameworks/av/services/camera/libcameraservice/gui \
	$(TOP)/frameworks/av/services/camera/libcameraservice/utils \
	$(TOP)/system/media/private/camera/include \
	$(TOP)/frameworks/native/include/media/openmax \
	$(TOP)/external/jpeg

LOCAL_EXPORT_C_INCLUDE_DIRS := \
	frameworks/av/services/camera/libcameraservice

LOCAL_CFLAGS += -Wall -Wextra -Werror

ifneq ($(BOARD_NUMBER_OF_CAMERAS),)
	LOCAL_CFLAGS += -DMAX_CAMERAS=$(BOARD_NUMBER_OF_CAMERAS)
endif

ifeq ($(TARGET_HAS_LEGACY_CAMERA_HAL1),true)
	LOCAL_CFLAGS += -DNO_CAMERA_SERVER
endif

ifeq ($(TARGET_CAMERASERVICE_CLOSES_NATIVE_HANDLES),true)
	LOCAL_CFLAGS += -DCAMERASERVICE_CLOSES_NATIVE_HANDLES
endif

ifeq ($(BOARD_NEEDS_MEMORYHEAPION),true)
	LOCAL_CFLAGS += -DUSE_MEMORY_HEAP_ION
endif

#LOCAL_CLANG:= false
LOCAL_MODULE:= libcameraservice_mod
LOCAL_SHARED_LIBRARIES+= libcameraservice
LOCAL_OVERRIDES_PACKAGES := libcameraservice
LOCAL_POST_INSTALL_CMD := \
	-(cp -rf $(TARGET_OUT)/lib64/libcameraservice_mod.so $(TARGET_OUT)/lib64/libcameraservice.so; \
	cp -rf $(TARGET_OUT)/lib/libcameraservice_mod.so $(TARGET_OUT)/lib/libcameraservice.so; \
	rm -rf $(TARGET_OUT)/lib64/libcameraservice_mod.so; \
	rm -rf $(TARGET_OUT)/lib/libcameraservice_mod.so)
	
relative_path_to_libcameraservice :=
	
include $(BUILD_SHARED_LIBRARY)
