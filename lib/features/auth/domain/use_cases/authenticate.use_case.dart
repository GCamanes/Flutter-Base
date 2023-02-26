import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/domain/entities/failure.entity.dart';
import 'package:flutter_base/core/domain/use_cases/use_case.dart';
import 'package:flutter_base/features/auth/domain/entities/session.entity.dart';
import 'package:flutter_base/features/auth/domain/repositories/auth.repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthenticateUseCase
    implements
        UseCase<Future<Either<FailureEntity, SessionEntity>>,
            AuthenticateParams> {
  AuthenticateUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<FailureEntity, SessionEntity>> execute(
      AuthenticateParams params) async {
    return repository.authenticate(
      email: params.email,
      password: params.password,
    );
  }
}

class AuthenticateParams {
  AuthenticateParams(this.email, this.password);

  final String email;
  final String password;
}
