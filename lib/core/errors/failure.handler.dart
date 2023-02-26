import 'package:flutter_base/core/domain/entities/failure.entity.dart';
import 'package:flutter_base/core/errors/api.exception.dart';

abstract class FailureHandler {
  static FailureEntity handleFailure(dynamic error) {
    switch (error.runtimeType) {
      case ApiException:
        ApiException apiError = error as ApiException;
        switch (apiError.statusCode) {
          case 401:
            return UnauthorizedFailureEntity(apiError.firstCode);
          case 500:
            return InternalServerErrorFailureEntity(apiError.firstCode);
          default:
            if (apiError.isTimeOut) {
              return const TimeOutFailureEntity();
            }
            if (apiError.isConnectivityError) {
              return const ConnectivityFailureEntity();
            }
            return UnknownErrorFailureEntity(apiError.firstCode);
        }
      default:
        return UnknownErrorFailureEntity(error.toString());
    }
  }
}
