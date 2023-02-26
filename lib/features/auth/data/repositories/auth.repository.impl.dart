import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/domain/entities/failure.entity.dart';
import 'package:flutter_base/features/auth/data/datasources/auth.remote_datasource.dart';
import 'package:flutter_base/features/auth/domain/entities/session.entity.dart';
import 'package:flutter_base/features/auth/domain/repositories/auth.repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(this._dataSource);

  final AuthRemoteDataSource _dataSource;

  @override
  Future<Either<FailureEntity, SessionEntity>> authenticate({
    required String email,
    required String password,
  }) async {
    try {
      final SessionEntity session = await _dataSource.authenticate(
        email: email,
        password: password,
      );
      return Right<FailureEntity, SessionEntity>(session);
    } catch (error) {
      return handleError<SessionEntity>(error);
    }
  }

  @override
  Future<Either<FailureEntity, SessionEntity>> refresh({
    required String refreshToken,
  }) async {
    try {
      final SessionEntity session = await _dataSource.refresh(
        refreshToken: refreshToken,
      );
      return Right<FailureEntity, SessionEntity>(session);
    } catch (error) {
      return handleError<SessionEntity>(error);
    }
  }
}
