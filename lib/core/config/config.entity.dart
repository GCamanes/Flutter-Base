import 'package:flutter_base/core/utils/app.constants.dart';

class ConfigEntity {
  ConfigEntity({
    required this.flavor,
    required this.baseApiUrl,
  });

  final String flavor;
  final String baseApiUrl;

  bool get isProd => flavor.contains(AppConstants.flavorProdKey);
}
