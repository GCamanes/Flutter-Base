import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base/core/data/interceptors/dio.interceptor.dart';
import 'package:flutter_base/core/domain/entities/failure.entity.dart';
import 'package:flutter_base/core/utils/app.constants.dart';
import 'package:flutter_base/features/auth/domain/entities/session.entity.dart';
import 'package:flutter_base/features/auth/domain/use_cases/refresh.use_case.dart';
import 'package:flutter_base/features/auth/presentation/cubits/auth.cubit.dart';
import 'package:flutter_base/get_it.injector.dart';

class AppDioInterceptor extends DioInterceptor {
  late AuthCubit _authCubit;
  late RefreshUseCase _refresh;

  @override
  void init({
    required Dio dioRef,
  }) {
    dioReference = dioRef;
    _authCubit = getIt();
    _refresh = getIt();
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final String token = _authCubit.currentSession?.accessToken ?? '';
    options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';

    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    /// If Token not expired then continue
    if (err.response?.statusCode != 401 ||
        err.requestOptions.path.contains(AppConstants.remoteAuthenticatePath)) {
      return super.onError(err, handler);
    }

    /// Retrieve new session
    final String refreshToken = _authCubit.currentSession?.refreshToken ?? '';
    final Either<FailureEntity, SessionEntity> refreshedSession =
        await _refresh.execute(refreshToken);

    /// Handling response
    refreshedSession.fold(
      (FailureEntity failure) {
        /// Clear and restart app
        _authCubit.clear();

        return handler.reject(err);
      },
      (SessionEntity session) async {
        /// Update session
        _authCubit.refreshSession(session);

        /// Retry request
        final Response<dynamic> retryResponse = await retry(err.requestOptions);

        return handler.resolve(retryResponse);
      },
    );
  }
}
