import 'package:flutter/services.dart';

class ChannelHelper {
  static Future<String?> getFlavor() async {
    String? flavor =
        await const MethodChannel('flavor').invokeMethod<String>('getFlavor');
    return flavor;
  }

  static Future<String?> getApiUrl() async {
    String? apiUrl = await const MethodChannel('appValues')
        .invokeMethod<String>('apiUrl');
    return apiUrl;
  }
}
