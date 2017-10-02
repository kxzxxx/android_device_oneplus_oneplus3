# Copyright (C) 2017 The LineageOS Project
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

LOCAL_PATH := $(call my-dir)

ifneq ($(ANDROID_BUILD_EMBEDDED),true)

include $(CLEAR_VARS)

framework_res_source_path := APPS/framework-res_intermediates/src

relative_path_to_framework_base := ../../../../../frameworks/base

# FRAMEWORKS_BASE_SUBDIRS comes from build/core/pathmap.mk
framework_mod_java_src_dirs :=  \
	$(addprefix $(relative_path_to_framework_base)/,$(FRAMEWORKS_BASE_SUBDIRS))

framework_mod_java_src_files := \
$(call find-other-java-files,$(framework_mod_java_src_dirs))

# EventLogTags files.
LOCAL_SRC_FILES += \
	core/java/android/app/admin/SecurityLogTags.logtags \
	core/java/android/content/EventLogTags.logtags \
	core/java/android/speech/tts/EventLogTags.logtags \
	core/java/android/webkit/EventLogTags.logtags \
	core/java/com/android/internal/logging/EventLogTags.logtags \

## READ ME: ########################################################
##
## When updating this list of aidl files, consider if that aidl is
## part of the SDK API.  If it is, also add it to the list below that
## is preprocessed and distributed with the SDK.  This list should
## not contain any aidl files for parcelables, but the one below should
## if you intend for 3rd parties to be able to send those objects
## across process boundaries.
##
## READ ME: ########################################################
LOCAL_SRC_FILES += \
	core/java/android/accessibilityservice/IAccessibilityServiceConnection.aidl \
	core/java/android/accessibilityservice/IAccessibilityServiceClient.aidl \
	core/java/android/accounts/IAccountManager.aidl \
	core/java/android/accounts/IAccountManagerResponse.aidl \
	core/java/android/accounts/IAccountAuthenticator.aidl \
	core/java/android/accounts/IAccountAuthenticatorResponse.aidl \
	core/java/android/app/IActivityContainer.aidl \
	core/java/android/app/IActivityContainerCallback.aidl \
	core/java/android/app/IActivityController.aidl \
	core/java/android/app/IActivityPendingResult.aidl \
	core/java/android/app/IAlarmCompleteListener.aidl \
	core/java/android/app/IAlarmListener.aidl \
	core/java/android/app/IAlarmManager.aidl \
	core/java/android/app/IAppTask.aidl \
	core/java/android/app/ITaskStackListener.aidl \
	core/java/android/app/IBackupAgent.aidl \
	core/java/android/app/IEphemeralResolver.aidl \
	core/java/android/app/IInstrumentationWatcher.aidl \
	core/java/android/app/INotificationManager.aidl \
	core/java/android/app/IProcessObserver.aidl \
	core/java/android/app/ISearchManager.aidl \
	core/java/android/app/ISearchManagerCallback.aidl \
	core/java/android/app/IServiceConnection.aidl \
	core/java/android/app/IStopUserCallback.aidl \
	core/java/android/app/job/IJobCallback.aidl \
	core/java/android/app/job/IJobScheduler.aidl \
	core/java/android/app/job/IJobService.aidl \
	core/java/android/app/ITransientNotification.aidl \
	core/java/android/app/IUidObserver.aidl \
	core/java/android/app/IUiAutomationConnection.aidl \
	core/java/android/app/IUiModeManager.aidl \
	core/java/android/app/IUserSwitchObserver.aidl \
	core/java/android/app/IWallpaperManager.aidl \
	core/java/android/app/IWallpaperManagerCallback.aidl \
	core/java/android/app/admin/IDevicePolicyManager.aidl \
	core/java/android/app/trust/IStrongAuthTracker.aidl \
	core/java/android/app/trust/ITrustManager.aidl \
	core/java/android/app/trust/ITrustListener.aidl \
	core/java/android/app/backup/IBackupManager.aidl \
	core/java/android/app/backup/IBackupObserver.aidl \
	core/java/android/app/backup/IFullBackupRestoreObserver.aidl \
	core/java/android/app/backup/IRestoreObserver.aidl \
	core/java/android/app/backup/IRestoreSession.aidl \
	core/java/android/app/usage/IUsageStatsManager.aidl \
	core/java/android/bluetooth/IBluetooth.aidl \
	core/java/android/bluetooth/IBluetoothA2dp.aidl \
	core/java/android/bluetooth/IBluetoothA2dpSink.aidl \
	core/java/android/bluetooth/IBluetoothAvrcpController.aidl \
	core/java/android/bluetooth/IBluetoothCallback.aidl \
	core/java/android/bluetooth/IBluetoothProfileServiceConnection.aidl \
	core/java/android/bluetooth/IBluetoothHeadset.aidl \
	core/java/android/bluetooth/IBluetoothHeadsetPhone.aidl \
	core/java/android/bluetooth/IBluetoothHealth.aidl \
	core/java/android/bluetooth/IBluetoothHealthCallback.aidl \
	core/java/android/bluetooth/IBluetoothInputDevice.aidl \
	core/java/android/bluetooth/IBluetoothPan.aidl \
	core/java/android/bluetooth/IBluetoothManager.aidl \
	core/java/android/bluetooth/IBluetoothManagerCallback.aidl \
	core/java/android/bluetooth/IBluetoothPbap.aidl \
	core/java/android/bluetooth/IBluetoothPbapClient.aidl \
	core/java/android/bluetooth/IBluetoothMap.aidl \
	core/java/android/bluetooth/IBluetoothSap.aidl \
	core/java/android/bluetooth/IBluetoothStateChangeCallback.aidl \
	core/java/android/bluetooth/IBluetoothHeadsetClient.aidl \
	core/java/android/bluetooth/IBluetoothGatt.aidl \
	core/java/android/bluetooth/IBluetoothGattCallback.aidl \
	core/java/android/bluetooth/IBluetoothGattServerCallback.aidl \
	core/java/android/bluetooth/IBluetoothDun.aidl \
	core/java/android/content/IClipboard.aidl \
	core/java/android/content/IContentService.aidl \
	core/java/android/content/IIntentReceiver.aidl \
	core/java/android/content/IIntentSender.aidl \
	core/java/android/content/IOnPrimaryClipChangedListener.aidl \
	core/java/android/content/IRestrictionsManager.aidl \
	core/java/android/content/ISyncAdapter.aidl \
	core/java/android/content/ISyncContext.aidl \
	core/java/android/content/ISyncServiceAdapter.aidl \
	core/java/android/content/ISyncStatusObserver.aidl \
	core/java/android/content/pm/ILauncherApps.aidl \
	core/java/android/content/pm/IOnAppsChangedListener.aidl \
	core/java/android/content/pm/IOtaDexopt.aidl \
	core/java/android/content/pm/IPackageDataObserver.aidl \
	core/java/android/content/pm/IPackageDeleteObserver.aidl \
	core/java/android/content/pm/IPackageDeleteObserver2.aidl \
	core/java/android/content/pm/IPackageInstallObserver.aidl \
	core/java/android/content/pm/IPackageInstallObserver2.aidl \
	core/java/android/content/pm/IPackageInstaller.aidl \
	core/java/android/content/pm/IPackageInstallerCallback.aidl \
	core/java/android/content/pm/IPackageInstallerSession.aidl \
	core/java/android/content/pm/IPackageManager.aidl \
	core/java/android/content/pm/IPackageMoveObserver.aidl \
	core/java/android/content/pm/IPackageStatsObserver.aidl \
	core/java/android/content/pm/IOnPermissionsChangeListener.aidl \
	core/java/android/content/pm/IShortcutService.aidl \
	core/java/android/content/pm/permission/IRuntimePermissionPresenter.aidl \
	core/java/android/database/IContentObserver.aidl \
	../av/camera/aidl/android/hardware/ICameraService.aidl \
	../av/camera/aidl/android/hardware/ICameraServiceListener.aidl \
	../av/camera/aidl/android/hardware/ICameraServiceProxy.aidl \
	../av/camera/aidl/android/hardware/ICamera.aidl \
	../av/camera/aidl/android/hardware/ICameraClient.aidl \
	../av/camera/aidl/android/hardware/camera2/ICameraDeviceUser.aidl \
	../av/camera/aidl/android/hardware/camera2/ICameraDeviceCallbacks.aidl \
	core/java/android/hardware/IConsumerIrService.aidl \
	core/java/android/hardware/ISerialManager.aidl \
	core/java/android/hardware/display/IDisplayManager.aidl \
	core/java/android/hardware/display/IDisplayManagerCallback.aidl \
	core/java/android/hardware/display/IVirtualDisplayCallback.aidl \
	core/java/android/hardware/fingerprint/IFingerprintDaemon.aidl \
	core/java/android/hardware/fingerprint/IFingerprintDaemonCallback.aidl \
	core/java/android/hardware/fingerprint/IFingerprintService.aidl \
	core/java/android/hardware/fingerprint/IFingerprintServiceLockoutResetCallback.aidl \
	core/java/android/hardware/fingerprint/IFingerprintServiceReceiver.aidl \
	core/java/android/hardware/hdmi/IHdmiControlCallback.aidl \
	core/java/android/hardware/hdmi/IHdmiControlService.aidl \
	core/java/android/hardware/hdmi/IHdmiDeviceEventListener.aidl \
	core/java/android/hardware/hdmi/IHdmiHotplugEventListener.aidl \
	core/java/android/hardware/hdmi/IHdmiInputChangeListener.aidl \
	core/java/android/hardware/hdmi/IHdmiMhlVendorCommandListener.aidl \
	core/java/android/hardware/hdmi/IHdmiRecordListener.aidl \
	core/java/android/hardware/hdmi/IHdmiSystemAudioModeChangeListener.aidl \
	core/java/android/hardware/hdmi/IHdmiVendorCommandListener.aidl \
	core/java/android/hardware/input/IInputManager.aidl \
	core/java/android/hardware/input/IInputDevicesChangedListener.aidl \
	core/java/android/hardware/input/ITabletModeChangedListener.aidl \
	core/java/android/hardware/location/IActivityRecognitionHardware.aidl \
	core/java/android/hardware/location/IActivityRecognitionHardwareClient.aidl \
	core/java/android/hardware/location/IActivityRecognitionHardwareSink.aidl \
	core/java/android/hardware/location/IActivityRecognitionHardwareWatcher.aidl \
	core/java/android/hardware/location/IFusedLocationHardware.aidl \
	core/java/android/hardware/location/IFusedLocationHardwareSink.aidl \
	core/java/android/hardware/location/IGeofenceHardware.aidl \
	core/java/android/hardware/location/IGeofenceHardwareCallback.aidl \
	core/java/android/hardware/location/IGeofenceHardwareMonitorCallback.aidl \
	core/java/android/hardware/location/IContextHubCallback.aidl \
	core/java/android/hardware/location/IContextHubService.aidl \
	core/java/android/hardware/soundtrigger/IRecognitionStatusCallback.aidl \
	core/java/android/hardware/usb/IUsbManager.aidl \
	core/java/android/net/ICaptivePortal.aidl \
	core/java/android/net/IConnectivityManager.aidl \
	core/java/android/net/IConnectivityMetricsLogger.aidl \
	core/java/android/net/IIpConnectivityMetrics.aidl \
	core/java/android/net/IEthernetManager.aidl \
	core/java/android/net/IEthernetServiceListener.aidl \
	core/java/android/net/INetdEventCallback.aidl \
	core/java/android/net/INetworkManagementEventObserver.aidl \
	core/java/android/net/INetworkPolicyListener.aidl \
	core/java/android/net/INetworkPolicyManager.aidl \
	core/java/android/net/INetworkScoreCache.aidl \
	core/java/android/net/INetworkScoreService.aidl \
	core/java/android/net/INetworkStatsService.aidl \
	core/java/android/net/INetworkStatsSession.aidl \
	core/java/android/net/nsd/INsdManager.aidl \
	core/java/android/nfc/IAppCallback.aidl \
	core/java/android/nfc/INfcAdapter.aidl \
	core/java/android/nfc/INfcAdapterExtras.aidl \
	core/java/android/nfc/INfcTag.aidl \
	core/java/android/nfc/INfcCardEmulation.aidl \
	core/java/android/nfc/INfcFCardEmulation.aidl \
	core/java/android/nfc/INfcUnlockHandler.aidl \
	core/java/android/nfc/ITagRemovedCallback.aidl \
	core/java/android/os/IBatteryPropertiesListener.aidl \
	core/java/android/os/IBatteryPropertiesRegistrar.aidl \
	core/java/android/os/ICancellationSignal.aidl \
	core/java/android/os/IDeviceIdleController.aidl \
	core/java/android/os/IHardwarePropertiesManager.aidl \
	core/java/android/os/IMaintenanceActivityListener.aidl \
	core/java/android/os/IMessenger.aidl \
	core/java/android/os/INetworkActivityListener.aidl \
	core/java/android/os/INetworkManagementService.aidl \
	core/java/android/os/IPermissionController.aidl \
	core/java/android/os/IProcessInfoService.aidl \
	core/java/android/os/IProgressListener.aidl \
	core/java/android/os/IPowerManager.aidl \
	core/java/android/os/IRecoverySystem.aidl \
	core/java/android/os/IRecoverySystemProgressListener.aidl \
	core/java/android/os/IRemoteCallback.aidl \
	core/java/android/os/ISchedulingPolicyService.aidl \
	core/java/android/os/IUpdateLock.aidl \
	core/java/android/os/IUserManager.aidl \
	core/java/android/os/IVibratorService.aidl \
	core/java/android/security/IKeystoreService.aidl \
	core/java/android/service/carrier/ICarrierService.aidl \
	core/java/android/service/carrier/ICarrierMessagingCallback.aidl \
	core/java/android/service/carrier/ICarrierMessagingService.aidl \
	core/java/android/service/gatekeeper/IGateKeeperService.aidl \
	core/java/android/service/notification/INotificationListener.aidl \
	core/java/android/service/notification/IStatusBarNotificationHolder.aidl \
	core/java/android/service/notification/IConditionListener.aidl \
	core/java/android/service/notification/IConditionProvider.aidl \
	core/java/android/service/vr/IVrListener.aidl \
	core/java/android/service/vr/IVrManager.aidl \
	core/java/android/service/vr/IVrStateCallbacks.aidl \
	core/java/android/print/ILayoutResultCallback.aidl \
	core/java/android/print/IPrinterDiscoveryObserver.aidl \
	core/java/android/print/IPrintDocumentAdapter.aidl \
	core/java/android/print/IPrintDocumentAdapterObserver.aidl \
	core/java/android/print/IPrintJobStateChangeListener.aidl \
	core/java/android/print/IPrintServicesChangeListener.aidl \
	core/java/android/printservice/recommendation/IRecommendationsChangeListener.aidl \
	core/java/android/print/IPrintManager.aidl \
	core/java/android/print/IPrintSpooler.aidl \
	core/java/android/print/IPrintSpoolerCallbacks.aidl \
	core/java/android/print/IPrintSpoolerClient.aidl \
	core/java/android/printservice/recommendation/IRecommendationServiceCallbacks.aidl \
	core/java/android/printservice/recommendation/IRecommendationService.aidl \
	core/java/android/print/IWriteResultCallback.aidl \
	core/java/android/printservice/IPrintService.aidl \
	core/java/android/printservice/IPrintServiceClient.aidl \
	core/java/android/service/dreams/IDreamManager.aidl \
	core/java/android/service/dreams/IDreamService.aidl \
	core/java/android/service/persistentdata/IPersistentDataBlockService.aidl \
	core/java/android/service/trust/ITrustAgentService.aidl \
	core/java/android/service/trust/ITrustAgentServiceCallback.aidl \
	core/java/android/service/voice/IVoiceInteractionService.aidl \
	core/java/android/service/voice/IVoiceInteractionSession.aidl \
	core/java/android/service/voice/IVoiceInteractionSessionService.aidl \
	core/java/android/service/gesture/IGestureService.aidl \
	core/java/android/service/wallpaper/IWallpaperConnection.aidl \
	core/java/android/service/wallpaper/IWallpaperEngine.aidl \
	core/java/android/service/wallpaper/IWallpaperService.aidl \
	core/java/android/service/chooser/IChooserTargetService.aidl \
	core/java/android/service/chooser/IChooserTargetResult.aidl \
	core/java/android/view/accessibility/IAccessibilityInteractionConnection.aidl\
	core/java/android/view/accessibility/IAccessibilityInteractionConnectionCallback.aidl\
	core/java/android/view/accessibility/IAccessibilityManager.aidl \
	core/java/android/view/accessibility/IAccessibilityManagerClient.aidl \
	core/java/android/view/IApplicationToken.aidl \
	core/java/android/view/IAppTransitionAnimationSpecsFuture.aidl \
	core/java/android/view/IAssetAtlas.aidl \
	core/java/android/view/IDockedStackListener.aidl \
	core/java/android/view/IGraphicsStats.aidl \
	core/java/android/view/IInputFilter.aidl \
	core/java/android/view/IInputFilterHost.aidl \
	core/java/android/view/IOnKeyguardExitResult.aidl \
	core/java/android/view/IRotationWatcher.aidl \
	core/java/android/view/IWindow.aidl \
	core/java/android/view/IWindowFocusObserver.aidl \
	core/java/android/view/IWindowId.aidl \
	core/java/android/view/IWindowManager.aidl \
	core/java/android/view/IWindowSession.aidl \
	core/java/android/view/IWindowSessionCallback.aidl \
	core/java/android/webkit/IWebViewUpdateService.aidl \
	core/java/android/speech/IRecognitionListener.aidl \
	core/java/android/speech/IRecognitionService.aidl \
	core/java/android/speech/tts/ITextToSpeechCallback.aidl \
	core/java/android/speech/tts/ITextToSpeechService.aidl \
	core/java/com/android/internal/app/IAppOpsCallback.aidl \
	core/java/com/android/internal/app/IAppOpsService.aidl \
	core/java/com/android/internal/app/IAssistScreenshotReceiver.aidl \
	core/java/com/android/internal/app/IBatteryStats.aidl \
	core/java/com/android/internal/app/ISoundTriggerService.aidl \
	core/java/com/android/internal/app/IVoiceInteractionManagerService.aidl \
	core/java/com/android/internal/app/IVoiceInteractionSessionListener.aidl \
	core/java/com/android/internal/app/IVoiceInteractionSessionShowCallback.aidl \
	core/java/com/android/internal/app/IVoiceInteractor.aidl \
	core/java/com/android/internal/app/IVoiceInteractorCallback.aidl \
	core/java/com/android/internal/app/IVoiceInteractorRequest.aidl \
	core/java/com/android/internal/app/IMediaContainerService.aidl \
	core/java/com/android/internal/app/procstats/IProcessStats.aidl \
	core/java/com/android/internal/appwidget/IAppWidgetService.aidl \
	core/java/com/android/internal/appwidget/IAppWidgetHost.aidl \
	core/java/com/android/internal/backup/IBackupTransport.aidl \
	core/java/com/android/internal/backup/IObbBackupService.aidl \
	core/java/com/android/internal/inputmethod/IInputContentUriToken.aidl \
	core/java/com/android/internal/policy/IKeyguardDrawnCallback.aidl \
	core/java/com/android/internal/policy/IKeyguardExitCallback.aidl \
	core/java/com/android/internal/policy/IKeyguardService.aidl \
	core/java/com/android/internal/policy/IKeyguardStateCallback.aidl \
	core/java/com/android/internal/policy/IShortcutService.aidl \
	core/java/com/android/internal/os/IDropBoxManagerService.aidl \
	core/java/com/android/internal/os/IParcelFileDescriptorFactory.aidl \
	core/java/com/android/internal/os/IRegionalizationService.aidl \
	core/java/com/android/internal/os/IResultReceiver.aidl \
	core/java/com/android/internal/statusbar/IStatusBar.aidl \
	core/java/com/android/internal/statusbar/IStatusBarService.aidl \
	core/java/com/android/internal/textservice/ISpellCheckerService.aidl \
	core/java/com/android/internal/textservice/ISpellCheckerSession.aidl \
	core/java/com/android/internal/textservice/ISpellCheckerSessionListener.aidl \
	core/java/com/android/internal/textservice/ITextServicesManager.aidl \
	core/java/com/android/internal/textservice/ITextServicesSessionListener.aidl \
	core/java/com/android/internal/view/IDragAndDropPermissions.aidl \
	core/java/com/android/internal/view/IInputContext.aidl \
	core/java/com/android/internal/view/IInputContextCallback.aidl \
	core/java/com/android/internal/view/IInputMethod.aidl \
	core/java/com/android/internal/view/IInputMethodClient.aidl \
	core/java/com/android/internal/view/IInputMethodManager.aidl \
	core/java/com/android/internal/view/IInputMethodSession.aidl \
	core/java/com/android/internal/view/IInputSessionCallback.aidl \
	core/java/com/android/internal/widget/ICheckCredentialProgressCallback.aidl \
	core/java/com/android/internal/widget/ILockSettings.aidl \
	core/java/com/android/internal/widget/IRemoteViewsFactory.aidl \
	core/java/com/android/internal/widget/IRemoteViewsAdapterConnection.aidl \
	keystore/java/android/security/IKeyChainAliasCallback.aidl \
	keystore/java/android/security/IKeyChainService.aidl \
	location/java/android/location/ICountryDetector.aidl \
	location/java/android/location/ICountryListener.aidl \
	location/java/android/location/IFusedProvider.aidl \
	location/java/android/location/IGeocodeProvider.aidl \
	location/java/android/location/IGeofenceProvider.aidl \
	location/java/android/location/IGnssStatusListener.aidl \
	location/java/android/location/IGnssStatusProvider.aidl \
	location/java/android/location/IGnssMeasurementsListener.aidl \
	location/java/android/location/IGnssNavigationMessageListener.aidl \
	location/java/android/location/ILocationListener.aidl \
	location/java/android/location/ILocationManager.aidl \
	location/java/android/location/IFusedGeofenceHardware.aidl \
	location/java/android/location/IGpsGeofenceHardware.aidl \
	location/java/android/location/INetInitiatedListener.aidl \
	location/java/com/android/internal/location/ILocationProvider.aidl \
	media/java/android/media/IAudioService.aidl \
	media/java/android/media/IAudioFocusDispatcher.aidl \
	media/java/android/media/IAudioRoutesObserver.aidl \
	media/java/android/media/IMediaHTTPConnection.aidl \
	media/java/android/media/IMediaHTTPService.aidl \
	media/java/android/media/IMediaResourceMonitor.aidl \
	media/java/android/media/IMediaRouterClient.aidl \
	media/java/android/media/IMediaRouterService.aidl \
	media/java/android/media/IMediaScannerListener.aidl \
	media/java/android/media/IMediaScannerService.aidl \
	media/java/android/media/IRecordingConfigDispatcher.aidl \
	media/java/android/media/IRemoteDisplayCallback.aidl \
	media/java/android/media/IRemoteDisplayProvider.aidl \
	media/java/android/media/IRemoteVolumeController.aidl \
	media/java/android/media/IRemoteVolumeObserver.aidl \
	media/java/android/media/IRingtonePlayer.aidl \
	media/java/android/media/IVolumeController.aidl \
	media/java/android/media/audiopolicy/IAudioPolicyCallback.aidl \
	media/java/android/media/midi/IBluetoothMidiService.aidl \
	media/java/android/media/midi/IMidiDeviceListener.aidl \
	media/java/android/media/midi/IMidiDeviceOpenCallback.aidl \
	media/java/android/media/midi/IMidiDeviceServer.aidl \
	media/java/android/media/midi/IMidiManager.aidl \
	media/java/android/media/projection/IMediaProjection.aidl \
	media/java/android/media/projection/IMediaProjectionCallback.aidl \
	media/java/android/media/projection/IMediaProjectionManager.aidl \
	media/java/android/media/projection/IMediaProjectionWatcherCallback.aidl \
	media/java/android/media/session/IActiveSessionsListener.aidl \
	media/java/android/media/session/ISessionController.aidl \
	media/java/android/media/session/ISessionControllerCallback.aidl \
	media/java/android/media/session/ISession.aidl \
	media/java/android/media/session/ISessionCallback.aidl \
	media/java/android/media/session/ISessionManager.aidl \
	media/java/android/media/tv/ITvInputClient.aidl \
	media/java/android/media/tv/ITvInputHardware.aidl \
	media/java/android/media/tv/ITvInputHardwareCallback.aidl \
	media/java/android/media/tv/ITvInputManager.aidl \
	media/java/android/media/tv/ITvInputManagerCallback.aidl \
	media/java/android/media/tv/ITvInputService.aidl \
	media/java/android/media/tv/ITvInputServiceCallback.aidl \
	media/java/android/media/tv/ITvInputSession.aidl \
	media/java/android/media/tv/ITvInputSessionCallback.aidl \
	media/java/android/media/tv/ITvRemoteProvider.aidl \
	media/java/android/media/tv/ITvRemoteServiceInput.aidl \
	media/java/android/service/media/IMediaBrowserService.aidl \
	media/java/android/service/media/IMediaBrowserServiceCallbacks.aidl \
	telecomm/java/com/android/internal/telecom/ICallScreeningAdapter.aidl \
	telecomm/java/com/android/internal/telecom/ICallScreeningService.aidl \
	telecomm/java/com/android/internal/telecom/IVideoCallback.aidl \
	telecomm/java/com/android/internal/telecom/IVideoProvider.aidl \
	telecomm/java/com/android/internal/telecom/IConnectionService.aidl \
	telecomm/java/com/android/internal/telecom/IConnectionServiceAdapter.aidl \
	telecomm/java/com/android/internal/telecom/IInCallAdapter.aidl \
	telecomm/java/com/android/internal/telecom/IInCallService.aidl \
	telecomm/java/com/android/internal/telecom/ITelecomService.aidl \
	telecomm/java/com/android/internal/telecom/RemoteServiceCallback.aidl \
	telephony/java/com/android/ims/internal/IImsCallSession.aidl \
	telephony/java/com/android/ims/internal/IImsCallSessionListener.aidl \
	telephony/java/com/android/ims/internal/IImsConfig.aidl \
	telephony/java/com/android/ims/internal/IImsRegistrationListener.aidl \
	telephony/java/com/android/ims/internal/IImsEcbm.aidl \
	telephony/java/com/android/ims/internal/IImsEcbmListener.aidl \
	telephony/java/com/android/ims/internal/IImsExternalCallStateListener.aidl \
	telephony/java/com/android/ims/internal/IImsMultiEndpoint.aidl \
	telephony/java/com/android/ims/internal/IImsService.aidl \
	telephony/java/com/android/ims/internal/IImsStreamMediaSession.aidl \
	telephony/java/com/android/ims/internal/IImsUt.aidl \
	telephony/java/com/android/ims/internal/IImsUtListener.aidl \
	telephony/java/com/android/ims/internal/IImsVideoCallCallback.aidl \
	telephony/java/com/android/ims/internal/IImsVideoCallProvider.aidl \
	telephony/java/com/android/ims/internal/uce/uceservice/IUceService.aidl \
	telephony/java/com/android/ims/internal/uce/uceservice/IUceListener.aidl \
	telephony/java/com/android/ims/internal/uce/options/IOptionsService.aidl \
	telephony/java/com/android/ims/internal/uce/options/IOptionsListener.aidl \
	telephony/java/com/android/ims/internal/uce/presence/IPresenceService.aidl \
	telephony/java/com/android/ims/internal/uce/presence/IPresenceListener.aidl \
	telephony/java/com/android/ims/ImsConfigListener.aidl \
	telephony/java/com/android/internal/telephony/ICarrierConfigLoader.aidl \
	telephony/java/com/android/internal/telephony/IMms.aidl \
	telephony/java/com/android/internal/telephony/IOnSubscriptionsChangedListener.aidl \
	telephony/java/com/android/internal/telephony/IPhoneStateListener.aidl \
	telephony/java/com/android/internal/telephony/IPhoneSubInfo.aidl \
	telephony/java/com/android/internal/telephony/ISms.aidl \
	telephony/java/com/android/internal/telephony/ISub.aidl \
	telephony/java/com/android/internal/telephony/ITelephony.aidl \
	telephony/java/com/android/internal/telephony/ITelephonyRegistry.aidl \
	telephony/java/com/android/internal/telephony/IWapPushManager.aidl \
	wifi/java/android/net/wifi/IWifiManager.aidl \
	wifi/java/android/net/wifi/nan/IWifiNanEventListener.aidl \
	wifi/java/android/net/wifi/nan/IWifiNanManager.aidl \
	wifi/java/android/net/wifi/nan/IWifiNanSessionListener.aidl \
	wifi/java/android/net/wifi/p2p/IWifiP2pManager.aidl \
	wifi/java/android/net/wifi/IWifiScanner.aidl \
	wifi/java/android/net/wifi/IRttManager.aidl \
	packages/services/PacProcessor/com/android/net/IProxyService.aidl \
	packages/services/Proxy/com/android/net/IProxyCallback.aidl \
	packages/services/Proxy/com/android/net/IProxyPortListener.aidl \
	core/java/android/service/quicksettings/IQSService.aidl \
	core/java/android/service/quicksettings/IQSTileService.aidl \

# The following are native binders that need to go with the native component
# at system/update_engine/binder_bindings/. Use relative path to refer to them.
LOCAL_SRC_FILES += \
	../../system/update_engine/binder_bindings/android/os/IUpdateEngine.aidl \
	../../system/update_engine/binder_bindings/android/os/IUpdateEngineCallback.aidl \

LOCAL_SRC_FILES +=  \
	../../system/netd/server/binder/android/net/INetd.aidl \

LOCAL_AIDL_INCLUDES += system/update_engine/binder_bindings

# FRAMEWORKS_BASE_JAVA_SRC_DIRS comes from build/core/pathmap.mk
LOCAL_AIDL_INCLUDES += \
	$(FRAMEWORKS_BASE_JAVA_SRC_DIRS) \
	frameworks/native/aidl/binder

LOCAL_AIDL_INCLUDES += \
	frameworks/av/camera/aidl \
	frameworks/native/aidl/gui \
	system/netd/server/binder

LOCAL_INTERMEDIATE_SOURCES := \
	$(framework_res_source_path)/android/R.java \
	$(framework_res_source_path)/android/Manifest.java \
	$(framework_res_source_path)/com/android/internal/R.java

LOCAL_NO_STANDARD_LIBRARIES := true
LOCAL_JAVA_LIBRARIES := core-oj core-libart core-lambda-stubs conscrypt okhttp core-junit bouncycastle ext
LOCAL_STATIC_JAVA_LIBRARIES := framework-protos

LOCAL_MODULE := framework_mod

LOCAL_DX_FLAGS := --core-library --multi-dex

LOCAL_RMTYPEDEFS := true

ifeq ($(EMMA_INSTRUMENT_FRAMEWORK),true)
LOCAL_EMMA_INSTRUMENT := true
endif

LOCAL_OVERRIDES_PACKAGES := framework
LOCAL_JAVA_LIBRARIES += framework
LOCAL_REQUIRED_MODULES := framework

LOCAL_POST_INSTALL_CMD := \
	-(cp -rf $(TARGET_OUT)/framework/framework_mod.jar $(TARGET_OUT)/framework/framework.jar; \
	rm -rf $(TARGET_OUT)/framework/framework_mod.jar)

LOCAL_SRC_FILES := \
	$(addprefix $(relative_path_to_framework_base)/,$(LOCAL_SRC_FILES))

my_mod_src_files := $(call find-other-java-files,$(FRAMEWORKS_BASE_SUBDIRS))

my_filter_out_files:= \
	$(addprefix $(relative_path_to_framework_base)/,$(my_mod_src_files))

framework_mod_java_src_files := \
$(filter-out $(my_filter_out_files),$(framework_mod_java_src_files))

LOCAL_SRC_FILES += $(framework_mod_java_src_files)

LOCAL_SRC_FILES += $(my_mod_src_files)

relative_path_to_framework_base :=
framework_mod_java_src_dirs :=
my_mod_src_files :=
my_filter_out_files:=
framework_mod_java_src_files :=

include $(BUILD_JAVA_LIBRARY)

ifeq (,$(ONE_SHOT_MAKEFILE))
include $(call first-makefiles-under,$(LOCAL_PATH))
endif

endif # ANDROID_BUILD_EMBEDDED

