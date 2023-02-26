import 'package:flutter_base/core/domain/entities/error.entity.dart';
import 'package:flutter_base/core/errors/basic.exception.dart';
import 'package:flutter_base/core/utils/app.constants.dart';

class ApiException extends BasicException {
  const ApiException({
    this.apiMessage = '',
    this.statusCode,
    required this.errors,
  }) : super(apiMessage);

  final String apiMessage;

  final int? statusCode;

  final List<ErrorEntity> errors;

  String get firstCode => errors.isNotEmpty ? errors.first.code : 'no code';

  bool get isTimeOut => errors
      .any((ErrorEntity error) => error.code == AppConstants.timeOutErrorKey);

  bool get isConnectivityError => errors.any(
        (ErrorEntity error) => error.code == AppConstants.connectivityErrorKey,
      );

  @override
  String toString() => errors.isNotEmpty
      ? errors.map((ErrorEntity error) => error.code).join(', ')
      : AppConstants.unknownErrorKey;
}
