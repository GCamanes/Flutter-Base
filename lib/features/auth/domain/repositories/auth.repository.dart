import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/domain/entities/failure.entity.dart';
import 'package:flutter_base/core/domain/repositories/main.repository.dart';
import 'package:flutter_base/features/auth/domain/entities/session.entity.dart';

abstract class AuthRepository extends MainRepository {
  Future<Either<FailureEntity, SessionEntity>> authenticate({
    required String email,
    required String password,
  });

  Future<Either<FailureEntity, SessionEntity>> refresh({
    required String refreshToken,
  });
}
