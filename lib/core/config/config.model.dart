import 'dart:convert';

class AppConfigModel {
  final String developmentBaseUrl;
  final String stagingBaseUrl;
  final String productionBaseUrl;


  final String developmentSocketUrl;
  final String stagingSocketUrl;
  final String productionSocketUrl;

  AppConfigModel({
    required this.developmentBaseUrl,
    required this.stagingBaseUrl,
    required this.productionBaseUrl,

    required this.developmentSocketUrl,
    required this.stagingSocketUrl,
    required this.productionSocketUrl,

  });

  AppConfigModel copyWith({
    required String developmentBaseUrl,
    required String stagingBaseUrl,
    required String productionBaseUrl,

    required String developmentSocketUrl,
    required String stagingSocketUrl,
    required String productionSocketUrl,

  }) =>
      AppConfigModel(
        developmentBaseUrl: developmentBaseUrl,
        stagingBaseUrl: stagingBaseUrl,
        productionBaseUrl: productionBaseUrl,

        developmentSocketUrl: developmentSocketUrl,
        stagingSocketUrl: stagingSocketUrl,
        productionSocketUrl: productionSocketUrl,
      );

  factory AppConfigModel.fromJson(String str) =>
      AppConfigModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppConfigModel.fromMap(Map<String, String> json) => AppConfigModel(
        developmentBaseUrl: json["DEVELOPMENT-BASE-URL"]!,
        stagingBaseUrl: json["STAGING-BASE-URL"]!,
        productionBaseUrl: json["PRODUCTION-BASE-URL"]!,

        developmentSocketUrl: json["DEVELOPMENT-SOCKET-URL"]!,
        stagingSocketUrl: json["STAGING-SOCKET-URL"]!,
        productionSocketUrl: json["PRODUCTION-SOCKET-URL"]!,
      );

  Map<String, String?> toMap() => {
        "DEVELOPMENT-BASE-URL": developmentBaseUrl,
        "STAGING-BASE-URL": stagingBaseUrl,
        "PRODUCTION-BASE-URL": productionBaseUrl,

        "DEVELOPMENT-SOCKET-URL": developmentSocketUrl,
        "STAGING-SOCKET-URL": stagingSocketUrl,
        "PRODUCTION-SOCKET-URL": productionSocketUrl,
      };
}
