LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_CFLAGS += -DHAVE_CONFIG_H -DKHTML_NO_EXCEPTIONS -DGKWQ_NO_JAVA
LOCAL_CFLAGS += -DNO_SUPPORT_JS_BINDING -DQT_NO_WHEELEVENT -DKHTML_NO_XBL
LOCAL_CFLAGS += -U__APPLE__
LOCAL_CFLAGS += -Wno-unused-parameter
LOCAL_CFLAGS += -Wno-non-virtual-dtor
LOCAL_CFLAGS += -Wno-maybe-uninitialized -Wno-parentheses
LOCAL_CFLAGS += -DHWUI_NEW_OPS
LOCAL_CPPFLAGS += -Wno-conversion-null

relative_path_to_framework := ../../../../../frameworks/base/core/jni

ifeq ($(TARGET_ARCH), arm)
    LOCAL_CFLAGS += -DPACKED="__attribute__ ((packed))"
else
    LOCAL_CFLAGS += -DPACKED=""
endif

ifneq ($(ENABLE_CPUSETS),)
    LOCAL_CFLAGS += -DENABLE_CPUSETS
endif

ifneq ($(ENABLE_SCHED_BOOST),)
    LOCAL_CFLAGS += -DENABLE_SCHED_BOOST
endif

LOCAL_CFLAGS += -DGL_GLEXT_PROTOTYPES -DEGL_EGLEXT_PROTOTYPES

LOCAL_CFLAGS += -DU_USING_ICU_NAMESPACE=0

LOCAL_SRC_FILES:= \
    $(relative_path_to_framework)/android_util_SeempLog.cpp \
    $(relative_path_to_framework)/AndroidRuntime.cpp \
    $(relative_path_to_framework)/com_android_internal_content_NativeLibraryHelper.cpp \
    $(relative_path_to_framework)/com_google_android_gles_jni_EGLImpl.cpp \
    $(relative_path_to_framework)/com_google_android_gles_jni_GLImpl.cpp.arm \
    $(relative_path_to_framework)/android_app_Activity.cpp \
    $(relative_path_to_framework)/android_app_ApplicationLoaders.cpp \
    $(relative_path_to_framework)/android_app_NativeActivity.cpp \
    $(relative_path_to_framework)/android_app_admin_SecurityLog.cpp \
    $(relative_path_to_framework)/android_opengl_EGL14.cpp \
    $(relative_path_to_framework)/android_opengl_EGLExt.cpp \
    $(relative_path_to_framework)/android_opengl_GLES10.cpp \
    $(relative_path_to_framework)/android_opengl_GLES10Ext.cpp \
    $(relative_path_to_framework)/android_opengl_GLES11.cpp \
    $(relative_path_to_framework)/android_opengl_GLES11Ext.cpp \
    $(relative_path_to_framework)/android_opengl_GLES20.cpp \
    $(relative_path_to_framework)/android_opengl_GLES30.cpp \
    $(relative_path_to_framework)/android_opengl_GLES31.cpp \
    $(relative_path_to_framework)/android_opengl_GLES31Ext.cpp \
    $(relative_path_to_framework)/android_opengl_GLES32.cpp \
    $(relative_path_to_framework)/android_database_CursorWindow.cpp \
    $(relative_path_to_framework)/android_database_SQLiteCommon.cpp \
    $(relative_path_to_framework)/android_database_SQLiteConnection.cpp \
    $(relative_path_to_framework)/android_database_SQLiteGlobal.cpp \
    $(relative_path_to_framework)/android_database_SQLiteDebug.cpp \
    $(relative_path_to_framework)/android_graphics_drawable_AnimatedVectorDrawable.cpp \
    $(relative_path_to_framework)/android_graphics_drawable_VectorDrawable.cpp \
    $(relative_path_to_framework)/android_view_DisplayEventReceiver.cpp \
    $(relative_path_to_framework)/android_view_DisplayListCanvas.cpp \
    $(relative_path_to_framework)/android_view_GraphicBuffer.cpp \
    $(relative_path_to_framework)/android_view_HardwareLayer.cpp \
    $(relative_path_to_framework)/android_view_InputChannel.cpp \
    $(relative_path_to_framework)/android_view_InputDevice.cpp \
    $(relative_path_to_framework)/android_view_InputEventReceiver.cpp \
    $(relative_path_to_framework)/android_view_InputEventSender.cpp \
    $(relative_path_to_framework)/android_view_InputQueue.cpp \
    $(relative_path_to_framework)/android_view_KeyCharacterMap.cpp \
    $(relative_path_to_framework)/android_view_KeyEvent.cpp \
    $(relative_path_to_framework)/android_view_MotionEvent.cpp \
    $(relative_path_to_framework)/android_view_PointerIcon.cpp \
    $(relative_path_to_framework)/android_view_RenderNode.cpp \
    $(relative_path_to_framework)/android_view_RenderNodeAnimator.cpp \
    $(relative_path_to_framework)/android_view_Surface.cpp \
    $(relative_path_to_framework)/android_view_SurfaceControl.cpp \
    $(relative_path_to_framework)/android_view_SurfaceSession.cpp \
    $(relative_path_to_framework)/android_view_TextureView.cpp \
    $(relative_path_to_framework)/android_view_ThreadedRenderer.cpp \
    $(relative_path_to_framework)/android_view_VelocityTracker.cpp \
    $(relative_path_to_framework)/android_text_AndroidCharacter.cpp \
    $(relative_path_to_framework)/android_text_AndroidBidi.cpp \
    $(relative_path_to_framework)/android_text_StaticLayout.cpp \
    $(relative_path_to_framework)/android_os_Debug.cpp \
    $(relative_path_to_framework)/android_os_GraphicsEnvironment.cpp \
    $(relative_path_to_framework)/android_os_MemoryFile.cpp \
    $(relative_path_to_framework)/android_os_MessageQueue.cpp \
    $(relative_path_to_framework)/android_os_Parcel.cpp \
    $(relative_path_to_framework)/android_os_SELinux.cpp \
    $(relative_path_to_framework)/android_os_SystemClock.cpp \
    $(relative_path_to_framework)/android_os_SystemProperties.cpp \
    $(relative_path_to_framework)/android_os_Trace.cpp \
    $(relative_path_to_framework)/android_os_UEventObserver.cpp \
    $(relative_path_to_framework)/android_net_LocalSocketImpl.cpp \
    $(relative_path_to_framework)/android_net_NetUtils.cpp \
    $(relative_path_to_framework)/android_net_TrafficStats.cpp \
    $(relative_path_to_framework)/android_nio_utils.cpp \
    $(relative_path_to_framework)/android_util_AssetManager.cpp \
    $(relative_path_to_framework)/android_util_Binder.cpp \
    $(relative_path_to_framework)/android_util_EventLog.cpp \
    $(relative_path_to_framework)/android_util_MemoryIntArray.cpp \
    $(relative_path_to_framework)/android_util_Log.cpp \
    $(relative_path_to_framework)/android_util_PathParser.cpp \
    $(relative_path_to_framework)/android_util_Process.cpp \
    $(relative_path_to_framework)/android_util_StringBlock.cpp \
    $(relative_path_to_framework)/android_util_XmlBlock.cpp \
    $(relative_path_to_framework)/android_util_jar_StrictJarFile.cpp \
    $(relative_path_to_framework)/android_graphics_Canvas.cpp \
    $(relative_path_to_framework)/android_graphics_Picture.cpp \
    $(relative_path_to_framework)/android/graphics/Bitmap.cpp \
    $(relative_path_to_framework)/android/graphics/BitmapFactory.cpp \
    $(relative_path_to_framework)/android/graphics/Camera.cpp \
    $(relative_path_to_framework)/android/graphics/CanvasProperty.cpp \
    $(relative_path_to_framework)/android/graphics/ColorFilter.cpp \
    $(relative_path_to_framework)/android/graphics/DrawFilter.cpp \
    $(relative_path_to_framework)/android/graphics/FontFamily.cpp \
    $(relative_path_to_framework)/android/graphics/CreateJavaOutputStreamAdaptor.cpp \
    $(relative_path_to_framework)/android/graphics/Graphics.cpp \
    $(relative_path_to_framework)/android/graphics/HarfBuzzNGFaceSkia.cpp \
    $(relative_path_to_framework)/android/graphics/Interpolator.cpp \
    $(relative_path_to_framework)/android/graphics/MaskFilter.cpp \
    $(relative_path_to_framework)/android/graphics/Matrix.cpp \
    $(relative_path_to_framework)/android/graphics/Movie.cpp \
    $(relative_path_to_framework)/android/graphics/NinePatch.cpp \
    $(relative_path_to_framework)/android/graphics/NinePatchPeeker.cpp \
    $(relative_path_to_framework)/android/graphics/Paint.cpp \
    $(relative_path_to_framework)/android/graphics/Path.cpp \
    $(relative_path_to_framework)/android/graphics/PathMeasure.cpp \
    $(relative_path_to_framework)/android/graphics/PathEffect.cpp \
    $(relative_path_to_framework)/android/graphics/Picture.cpp \
    $(relative_path_to_framework)/android/graphics/PorterDuff.cpp \
    $(relative_path_to_framework)/android/graphics/BitmapRegionDecoder.cpp \
    $(relative_path_to_framework)/android/graphics/Rasterizer.cpp \
    $(relative_path_to_framework)/android/graphics/Region.cpp \
    $(relative_path_to_framework)/android/graphics/Shader.cpp \
    $(relative_path_to_framework)/android/graphics/SurfaceTexture.cpp \
    $(relative_path_to_framework)/android/graphics/Typeface.cpp \
    $(relative_path_to_framework)/android/graphics/Utils.cpp \
    $(relative_path_to_framework)/android/graphics/Xfermode.cpp \
    $(relative_path_to_framework)/android/graphics/YuvToJpegEncoder.cpp \
    $(relative_path_to_framework)/android/graphics/pdf/PdfDocument.cpp \
    $(relative_path_to_framework)/android/graphics/pdf/PdfEditor.cpp \
    $(relative_path_to_framework)/android/graphics/pdf/PdfRenderer.cpp \
    $(relative_path_to_framework)/android_media_AudioRecord.cpp \
    $(relative_path_to_framework)/android_media_AudioSystem.cpp \
    $(relative_path_to_framework)/android_media_AudioTrack.cpp \
    $(relative_path_to_framework)/android_media_DeviceCallback.cpp \
    $(relative_path_to_framework)/android_media_JetPlayer.cpp \
    $(relative_path_to_framework)/android_media_RemoteDisplay.cpp \
    $(relative_path_to_framework)/android_media_ToneGenerator.cpp \
    android_hardware_Camera.cpp \
    $(relative_path_to_framework)/android_hardware_camera2_CameraMetadata.cpp \
    $(relative_path_to_framework)/android_hardware_camera2_legacy_LegacyCameraDevice.cpp \
    $(relative_path_to_framework)/android_hardware_camera2_legacy_PerfMeasurement.cpp \
    $(relative_path_to_framework)/android_hardware_camera2_DngCreator.cpp \
    $(relative_path_to_framework)/android_hardware_Radio.cpp \
    $(relative_path_to_framework)/android_hardware_SensorManager.cpp \
    $(relative_path_to_framework)/android_hardware_SerialPort.cpp \
    $(relative_path_to_framework)/android_hardware_SoundTrigger.cpp \
    $(relative_path_to_framework)/android_hardware_UsbDevice.cpp \
    $(relative_path_to_framework)/android_hardware_UsbDeviceConnection.cpp \
    $(relative_path_to_framework)/android_hardware_UsbRequest.cpp \
    $(relative_path_to_framework)/android_hardware_location_ContextHubService.cpp \
    $(relative_path_to_framework)/android_hardware_location_ActivityRecognitionHardware.cpp \
    $(relative_path_to_framework)/android_util_FileObserver.cpp \
    $(relative_path_to_framework)/android/opengl/poly_clip.cpp.arm \
    $(relative_path_to_framework)/android/opengl/util.cpp \
    $(relative_path_to_framework)/android_server_NetworkManagementSocketTagger.cpp \
    $(relative_path_to_framework)/android_server_Watchdog.cpp \
    $(relative_path_to_framework)/android_ddm_DdmHandleNativeHeap.cpp \
    $(relative_path_to_framework)/android_backup_BackupDataInput.cpp \
    $(relative_path_to_framework)/android_backup_BackupDataOutput.cpp \
    $(relative_path_to_framework)/android_backup_FileBackupHelperBase.cpp \
    $(relative_path_to_framework)/android_backup_BackupHelperDispatcher.cpp \
    $(relative_path_to_framework)/android_app_backup_FullBackup.cpp \
    $(relative_path_to_framework)/android_content_res_ObbScanner.cpp \
    $(relative_path_to_framework)/android_content_res_Configuration.cpp \
    $(relative_path_to_framework)/android_animation_PropertyValuesHolder.cpp \
    $(relative_path_to_framework)/com_android_internal_net_NetworkStatsFactory.cpp \
    $(relative_path_to_framework)/com_android_internal_os_PathClassLoaderFactory.cpp \
    $(relative_path_to_framework)/com_android_internal_os_Zygote.cpp \
    $(relative_path_to_framework)/com_android_internal_util_VirtualRefBasePtr.cpp \
    $(relative_path_to_framework)/com_android_internal_view_animation_NativeInterpolatorFactoryHelper.cpp

LOCAL_C_INCLUDES += \
    $(JNI_H_INCLUDE) \
	$(TOP)/frameworks/base/core/jni \
    $(TOP)/frameworks/base/core/jni/android/graphics \
    $(TOP)/frameworks/base//libs/hwui \
    $(TOP)/frameworks/native/opengl/libs \
    $(TOP)/frameworks/native/vulkan/include \
    $(call include-path-for, bluedroid) \
    $(call include-path-for, libhardware)/hardware \
    $(call include-path-for, libhardware_legacy)/hardware_legacy \
    $(TOP)/frameworks/base/media/jni \
    $(TOP)/system/core/base/include \
    $(TOP)/system/core/include \
    $(TOP)/system/media/camera/include \
    $(TOP)/system/netd/include \
    external/pdfium/core/include/fpdfapi \
    external/pdfium/fpdfsdk/include \
    external/pdfium/public \
    external/pdfium \
    external/skia/include/private \
    external/skia/src/core \
    external/skia/src/effects \
    external/skia/src/images \
    external/sqlite/dist \
    external/sqlite/android \
    external/expat/lib \
    external/tremor/Tremor \
    external/harfbuzz_ng/src \
    libcore/include \
    $(call include-path-for, audio-utils) \
    frameworks/minikin/include \
    external/freetype/include
# TODO: clean up Minikin so it doesn't need the freetype include

LOCAL_SHARED_LIBRARIES := \
    libmemtrack \
    libandroidfw \
    libexpat \
    libnativehelper \
    liblog \
    libcutils \
    libutils \
    libbinder \
    libnetutils \
    libui \
    libgui \
    libinput \
    libinputflinger \
    libcamera_client \
    libcamera_metadata \
    libskia \
    libsqlite \
    libEGL \
    libGLESv1_CM \
    libGLESv2 \
    libvulkan \
    libETC1 \
    libhardware \
    libhardware_legacy \
    libselinux \
    libsonivox \
    libcrypto \
    libssl \
    libicuuc \
    libicui18n \
    libmedia \
    libjpeg \
    libusbhost \
    libharfbuzz_ng \
    libz \
    libaudioutils \
    libpdfium \
    libimg_utils \
    libnetd_client \
    libradio \
    libsoundtrigger \
    libminikin \
    libprocessgroup \
    libnativebridge \
    libradio_metadata \
    libnativeloader \
    libmemunreachable \

LOCAL_SHARED_LIBRARIES += \
    libhwui \
    libdl \

# we need to access the private Bionic header
# <bionic_tls.h> in com_google_android_gles_jni_GLImpl.cpp
LOCAL_C_INCLUDES += bionic/libc/private

# AndroidRuntime.h depends on nativehelper/jni.h
LOCAL_EXPORT_C_INCLUDE_DIRS := libnativehelper/include

LOCAL_MODULE:= libandroid_runtime_mod

# -Wno-unknown-pragmas: necessary for Clang as the GL bindings need to turn
#                       off a GCC warning that Clang doesn't know.
LOCAL_CFLAGS += -Wall -Werror -Wno-error=deprecated-declarations -Wunused -Wunreachable-code \
        -Wno-unknown-pragmas

# -Wno-c++11-extensions: Clang warns about Skia using the C++11 override keyword, but this project
#                        is not being compiled with that level. Remove once this has changed.
LOCAL_CLANG_CFLAGS += -Wno-c++11-extensions

# b/22414716: thread_local (android/graphics/Paint.cpp) and Clang don't like each other at the
#             moment.
LOCAL_CLANG := false
LOCAL_OVERRIDES_PACKAGES := libandroid_runtime
LOCAL_SHARED_LIBRARIES += libandroid_runtime
LOCAL_POST_INSTALL_CMD := \
	-(cp -rf $(TARGET_OUT)/lib64/libandroid_runtime_mod.so $(TARGET_OUT)/lib64/libandroid_runtime.so; \
	cp -rf $(TARGET_OUT)/lib/libandroid_runtime_mod.so $(TARGET_OUT)/lib/libandroid_runtime.so; \
	rm -rf $(TARGET_OUT)/lib64/libandroid_runtime_mod.so; \
	rm -rf $(TARGET_OUT)/lib/libandroid_runtime_mod.so)
	
relative_path_to_framework :=

include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))
