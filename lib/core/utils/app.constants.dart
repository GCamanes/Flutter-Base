abstract class AppConstants {
  /// Channel keys
  static const String flavorKey = 'flavor';
  static const String appValuesKey = 'appValues';

  /// Channel methods key
  static const String flavorMethodKey = 'getFlavor';
  static const String apiUrlMethodKey = 'apiUrl';

  /// General keys
  static const String flavorProdKey = 'prod';

  /// Languages
  static const String localeEn = 'en';
  static const String localeFr = 'fr';

  /// MDB API
  static const String mdbAuthenticatePath = '/authenticate';
  static const String mdbRefreshPath = '/refresh';

  /// Api Errors
  // 401
  static const String apiErrorInvalidCredentialsKey = 'INVALID_CREDENTIALS';
  static const String apiErrorUnauthorizedKey = 'UNAUTHORIZED';

  // 500
  static const String apiErrorInternalServerErrorKey = 'INTERNAL_SERVER_ERROR';
  static const String timeOutErrorKey = 'TIME_OUT_ERROR';
  static const String connectivityErrorKey = 'CONNECTIVITY_ERROR';
  static const String unknownErrorKey = 'UNKNOWN_ERROR';
}
