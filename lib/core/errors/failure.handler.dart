import 'package:flutter_base/core/errors/failure.dart';

abstract class FailureHandler {
  static Failure handleFailure(dynamic error) {
    return UnknownErrorFailure(error.toString());
  }
}
