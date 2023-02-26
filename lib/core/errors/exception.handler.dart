import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_base/core/domain/entities/error.entity.dart';
import 'package:flutter_base/core/errors/api.exception.dart';
import 'package:flutter_base/core/errors/basic.exception.dart';
import 'package:flutter_base/core/utils/app.constants.dart';

abstract class ExceptionHandler {
  // Methode to get BasicException from DioError
  static BasicException handleApiError(DioError error) {
    Response<dynamic>? response = error.response;
    if (response != null) {
      // Extract error types returned by the Api
      final Iterable<dynamic> errorsData =
          response.data['errors'] ?? <dynamic>[];
      final List<ErrorEntity> errors = errorsData
          .map((dynamic error) =>
              ErrorEntity.fromJson(error as Map<String, dynamic>))
          .toList();
      // Return ApiException according to api DioError
      return ApiException(
        apiMessage: response.statusMessage ?? AppConstants.unknownErrorKey,
        statusCode: response.statusCode ?? 500,
        errors: errors,
      );
    } else if (error.type == DioErrorType.connectionTimeout ||
        error.type == DioErrorType.receiveTimeout) {
      return ApiException(
        apiMessage: error.message.toString(),
        errors: <ErrorEntity>[
          ErrorEntity.code(AppConstants.timeOutErrorKey),
        ],
      );
    } else if (error.type == DioErrorType.unknown &&
        error.error is SocketException &&
        error.error.toString().contains(error.requestOptions.baseUrl)) {
      return ApiException(
        apiMessage: error.error.toString(),
        errors: <ErrorEntity>[
          ErrorEntity.code(AppConstants.connectivityErrorKey),
        ],
      );
    }
    return const BasicException(AppConstants.unknownErrorKey);
  }
}
