import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/domain/entities/failure.entity.dart';
import 'package:flutter_base/core/domain/use_cases/use_case.dart';
import 'package:flutter_base/features/auth/domain/entities/session.entity.dart';
import 'package:flutter_base/features/auth/domain/repositories/auth.repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class RefreshUseCase
    implements UseCase<Future<Either<FailureEntity, SessionEntity>>, String> {
  RefreshUseCase(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<FailureEntity, SessionEntity>> execute(
      String refreshToken) async {
    return repository.refresh(refreshToken: refreshToken);
  }
}
