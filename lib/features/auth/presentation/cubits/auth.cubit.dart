import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/domain/entities/failure.entity.dart';
import 'package:flutter_base/core/presentation/cubits/custom.cubit.dart';
import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';
import 'package:flutter_base/features/auth/domain/entities/session.entity.dart';
import 'package:flutter_base/features/auth/domain/use_cases/authenticate.use_case.dart';
import 'package:flutter_base/features/auth/presentation/cubits/auth.cubit.state.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends CustomCubit<CubitState> {
  AuthCubit({
    required AuthenticateUseCase authenticate,
  })  : _authenticate = authenticate,
        super(AuthOutState(const NoFailureEntity()));

  final AuthenticateUseCase _authenticate;

  SessionEntity? get currentSession =>
      (state is AuthInState) ? (state as AuthInState).session : null;

  void refreshSession(SessionEntity session) => emit(AuthInState(session));

  void clear() => emit(AuthOutState(const NoFailureEntity()));

  Future<void> authenticate({
    required String email,
    required String password,
  }) async {
    emit(AuthLoadingState());

    final Either<FailureEntity, SessionEntity> failureOrSession =
        await _authenticate.execute(
      AuthenticateParams(email, password),
    );
    emit(_eitherSuccessOrErrorState(failureOrSession));
  }

  CubitState _eitherSuccessOrErrorState(
    Either<FailureEntity, SessionEntity> failureOrSession,
  ) {
    return failureOrSession.fold(
      (FailureEntity failure) => AuthOutState(failure),
      (SessionEntity session) => AuthInState(session),
    );
  }
}
