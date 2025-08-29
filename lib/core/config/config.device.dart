import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:swappid/core/config/config.device.model.dart';
import 'package:swappid/core/services/firebase/core.dart';

class ConfigDevice {
  final DeviceInfoPlugin _device = DeviceInfoPlugin();
  DeviceModel? _deviceModel;
  bool _isAppOpen = false;

  // Singleton instance
  static final ConfigDevice instance = _internal;
  static final ConfigDevice _internal = ConfigDevice._();

  ConfigDevice._();

  // Getter for deviceModel
  DeviceModel? get getDeviceModel => _deviceModel;
  bool get getIsAppOpen => _isAppOpen;

  // Setter to update deviceModel
  set deviceModel(DeviceModel? model) {
    _deviceModel = model;
  }

  set isAppOpen(bool value) {
    _isAppOpen = value;
  }

  // update device model
  void updateModel(DeviceModel Function(DeviceModel) updater) {
    _deviceModel = updater(_deviceModel!);
  }

  void updateIsAppOpen(bool value) {
    _isAppOpen = value;
  }

  /// Initialize device model
  /// [init] method to initialize device model
  /// [Platform.isIOS] if the platform is iOS
  /// [Platform.isAndroid] if the platform is Android
  /// [DeviceInfoPlugin] to get the device information
  /// [DeviceModel] to create the device model
  /// [device.iosInfo] to get the iOS device information
  /// [device.androidInfo] to get the Android device information
  /// [device.systemVersion] to get the iOS system version
  /// [device.model] to get the iOS device model
  /// [device.identifierForVendor] to get the iOS device identifier
  /// [device.device] to get the Android device
  /// [device.serialNumber] to get the Android device serial number
  /// [device.copyWith] to copy the device model
  ///
  init() async {
    _isAppOpen = false;
    // Get firebase device id
    String? deviceId = await FirebaseCore.getInstallationId();
    String? deviceOs = Platform.isIOS ? 'ios' : 'android';

    if (Platform.isIOS) {
      final device = await _device.iosInfo;
      _deviceModel = DeviceModel(
        deviceOs: deviceOs,
        deviceType: device.model,
        deviceNumber: device.identifierForVendor ?? '',
        deviceId: deviceId,
      );
    } else {
      final device = await _device.androidInfo;
      _deviceModel = DeviceModel(
        deviceOs: deviceOs,
        deviceType: device.model,
        deviceNumber: device.serialNumber,
        deviceId: deviceId,
      );
    }
  }
}
