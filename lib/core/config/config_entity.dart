import 'package:flutter_base/core/constants/app_constants.dart';

class ConfigEntity {
  ConfigEntity({
    required this.flavor,
    required this.baseApiUrl,
  });

  factory ConfigEntity.dev({String flavor = ''}) {
    return ConfigEntity(
      flavor: flavor,
      baseApiUrl: 'https://api-dev.base.com/',
    );
  }

  factory ConfigEntity.prod({String flavor = ''}) {
    return ConfigEntity(
      flavor: flavor,
      baseApiUrl: 'https://api-prod.base.com/',
    );
  }

  final String flavor;
  final String baseApiUrl;

  bool get isProd => flavor.contains(AppConstants.flavorProdKey);
}
