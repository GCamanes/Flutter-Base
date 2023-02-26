// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_base/core/data/clients/mdb_dio.client.dart' as _i3;
import 'package:flutter_base/core/data/datasources/mdb.datasource.dart' as _i4;
import 'package:flutter_base/features/auth/data/datasources/auth.remote_datasource.dart'
    as _i5;
import 'package:flutter_base/features/auth/data/datasources/auth.remote_datasource.impl.dart'
    as _i6;
import 'package:flutter_base/features/auth/data/repositories/auth.repository.impl.dart'
    as _i8;
import 'package:flutter_base/features/auth/domain/repositories/auth.repository.dart'
    as _i7;
import 'package:flutter_base/features/auth/domain/use_cases/authenticate.use_case.dart'
    as _i9;
import 'package:flutter_base/features/auth/domain/use_cases/refresh.use_case.dart'
    as _i10;
import 'package:flutter_base/features/auth/presentation/cubits/auth.cubit.dart'
    as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.MdbDioClient>(_i3.MdbDioClient());
  gh.singleton<_i4.MdbDataSource>(_i4.MdbDataSource(gh<_i3.MdbDioClient>()));
  gh.singleton<_i5.AuthRemoteDataSource>(
      _i6.AuthRemoteDataSourceImpl(gh<_i4.MdbDataSource>()));
  gh.singleton<_i7.AuthRepository>(
      _i8.AuthRepositoryImpl(gh<_i5.AuthRemoteDataSource>()));
  gh.singleton<_i9.AuthenticateUseCase>(
      _i9.AuthenticateUseCase(gh<_i7.AuthRepository>()));
  gh.singleton<_i10.RefreshUseCase>(
      _i10.RefreshUseCase(gh<_i7.AuthRepository>()));
  gh.singleton<_i11.AuthCubit>(
      _i11.AuthCubit(authenticate: gh<_i9.AuthenticateUseCase>()));
  return getIt;
}
