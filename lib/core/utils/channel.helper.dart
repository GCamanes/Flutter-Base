import 'package:flutter/services.dart';
import 'package:flutter_base/core/utils/app.constants.dart';

class ChannelHelper {
  static Future<String?> getFlavor() async {
    String? flavor = await const MethodChannel(AppConstants.flavorKey)
        .invokeMethod<String>(AppConstants.flavorMethodKey);
    return flavor;
  }

  static Future<String?> getApiUrl() async {
    String? apiUrl = await const MethodChannel(AppConstants.appValuesKey)
        .invokeMethod<String>(AppConstants.apiUrlMethodKey);
    return apiUrl;
  }
}
