import 'dart:convert';

class DeviceModel {
    final String deviceOs;
    final String deviceType;
    final String? deviceToken;
    final String deviceId;
    final String? deviceNumber;

    DeviceModel({
        required this.deviceOs,
        required this.deviceType,
        this.deviceToken,
        required this.deviceId,
        this.deviceNumber,
    });

    DeviceModel copyWith({
        String? deviceOs,
        String? deviceType,
        String? deviceToken,
        String? deviceId,
        String? deviceNumber,
    }) => 
        DeviceModel(
            deviceOs: deviceOs ?? this.deviceOs,
            deviceType: deviceType ?? this.deviceType,
            deviceToken: deviceToken ?? this.deviceToken,
            deviceId: deviceId ?? this.deviceId,
            deviceNumber: deviceNumber ?? this.deviceNumber,
        );

    factory DeviceModel.fromJson(String str) => DeviceModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DeviceModel.fromMap(Map<String, dynamic> json) => DeviceModel(
        deviceOs: json["deviceOS"],
        deviceType: json["deviceType"],
        deviceToken: json["deviceToken"],
        deviceId: json["deviceID"],
        deviceNumber: json["deviceNumber"],
    );

    Map<String, dynamic> toMap() => {
        "deviceOS": deviceOs,
        "deviceType": deviceType,
        "deviceToken": deviceToken,
        "deviceID": deviceId,
        "deviceNumber": deviceNumber,
    };
}
