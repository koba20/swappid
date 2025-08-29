import 'package:swappid/core/config/config.dart';
import 'package:swappid/core/helper/enums.dart';

late String baseUrl;
late String chatUrl;
late String websiteUrl;
late String socketUrl;
late String originUrl;
late Environment environment;

// Initialize API Bases for PRODUCTION or for STAGING
void initApi(Environment env) {
  environment = env;

  switch (env) {
    case Environment.production:
      baseUrl = '${AppConfig.instance.config.productionBaseUrl}/api/v1';
      socketUrl =
          '${AppConfig.instance.config.productionSocketUrl}/v1/ws/client';
      chatUrl = '${AppConfig.instance.config.productionSocketUrl}/v1/ws';
      originUrl = AppConfig.instance.config.productionSocketUrl;
      websiteUrl = 'https://onfleekq.com';
      break;

    case Environment.staging:
      baseUrl = '${AppConfig.instance.config.stagingBaseUrl}/api/v1';
      socketUrl = '${AppConfig.instance.config.stagingSocketUrl}/v1/ws/client';
      chatUrl = '${AppConfig.instance.config.stagingSocketUrl}/v1/ws';
      originUrl = AppConfig.instance.config.stagingSocketUrl;
      websiteUrl = 'https://onfleekq.com';
      break;

    case Environment.development:
      baseUrl = '${AppConfig.instance.config.developmentBaseUrl}/api/v1';
      socketUrl =
          '${AppConfig.instance.config.developmentSocketUrl}/v1/ws/client';
      chatUrl = '${AppConfig.instance.config.developmentSocketUrl}/v1/ws';
      originUrl = AppConfig.instance.config.developmentSocketUrl;
      websiteUrl = 'https://onfleekq.com';
      break;
  }
}
