import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/domain/entities/failure.entity.dart';
import 'package:flutter_base/core/errors/failure.handler.dart';

abstract class MainRepository {
  Either<FailureEntity, T> handleError<T>(dynamic error) {
    log('HANDLED ERROR $error');
    return Left<FailureEntity, T>(FailureHandler.handleFailure(error));
  }
}
