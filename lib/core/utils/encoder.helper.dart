abstract class EncoderHelper {
  static String encodeUri(String toEncode) {
    return Uri.encodeComponent(toEncode);
  }

  static String decodeUri(String toDecode) {
    return Uri.decodeComponent(toDecode);
  }
}
