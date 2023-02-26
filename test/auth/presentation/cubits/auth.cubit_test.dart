import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/domain/entities/failure.entity.dart';
import 'package:flutter_base/core/presentation/cubits/custom.cubit.state.dart';
import 'package:flutter_base/features/auth/domain/entities/session.entity.dart';
import 'package:flutter_base/features/auth/domain/use_cases/authenticate.use_case.dart';
import 'package:flutter_base/features/auth/presentation/cubits/auth.cubit.dart';
import 'package:flutter_base/features/auth/presentation/cubits/auth.cubit.state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticateUseCase extends Mock implements AuthenticateUseCase {}

void main() {
  late MockAuthenticateUseCase authenticateUseCase;
  late AuthCubit authCubit;
  String email = 'email';
  String password = 'password';
  const SessionEntity session = SessionEntity(
    accessToken: 'accessToken',
    refreshToken: 'refreshToken',
  );
  const UnknownErrorFailureEntity failure =
      UnknownErrorFailureEntity('failure');

  setUp(() {
    authenticateUseCase = MockAuthenticateUseCase();
    authCubit = AuthCubit(authenticate: authenticateUseCase);
    registerFallbackValue(AuthenticateParams(email, password));
  });

  group('Test: Auth cubit', () {
    blocTest(
      'emits [AuthLoadingState, AuthInState] in case of auth success',
      setUp: () => when(() => authenticateUseCase.execute(any())).thenAnswer(
        (_) async => const Right<FailureEntity, SessionEntity>(session),
      ),
      build: () => authCubit,
      act: (AuthCubit bloc) => bloc.authenticate(
        email: email,
        password: password,
      ),
      wait: const Duration(milliseconds: 300),
      expect: () => <TypeMatcher<CubitState>>[
        isA<AuthLoadingState>(),
        isA<AuthInState>(),
      ],
      tearDown: () => expect(authCubit.state, isA<AuthInState>()),
    );

    blocTest(
      'emits [AuthLoadingState, AuthInState] in case of auth fail',
      setUp: () => when(() => authenticateUseCase.execute(any())).thenAnswer(
        (_) async => const Left<FailureEntity, SessionEntity>(failure),
      ),
      build: () => authCubit,
      act: (AuthCubit bloc) => bloc.authenticate(
        email: email,
        password: password,
      ),
      wait: const Duration(milliseconds: 300),
      expect: () => <TypeMatcher<CubitState>>[
        isA<AuthLoadingState>(),
        isA<AuthOutState>(),
      ],
      tearDown: () => expect(authCubit.state, isA<AuthOutState>()),
    );
  });
}
