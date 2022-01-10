import 'package:flutter_base/core/constants/app_constants.dart';

class ConfigEntity {
  ConfigEntity({
    required this.flavor,
    required this.baseApiUrl,
  });

  factory ConfigEntity.dev() {
    return ConfigEntity(
      flavor: AppConstants.flavorDev,
      baseApiUrl: 'https://api-dev.base.com/',
    );
  }

  factory ConfigEntity.prod() {
    return ConfigEntity(
      flavor: AppConstants.flavorProd,
      baseApiUrl: 'https://api-prod.base.com/',
    );
  }

  final String flavor;
  final String baseApiUrl;

  bool get isProd => flavor == AppConstants.flavorProd;
}
