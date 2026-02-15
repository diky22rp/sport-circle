// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:sport_circle/core/di/register_module.dart' as _i224;
import 'package:sport_circle/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i952;
import 'package:sport_circle/features/auth/data/datasources/auth_remote_data_source_impl.dart'
    as _i749;
import 'package:sport_circle/features/auth/data/repositories/auth_repository_impl.dart'
    as _i853;
import 'package:sport_circle/features/auth/domain/repositories/auth_repository.dart'
    as _i568;
import 'package:sport_circle/features/auth/domain/usecases/login_usecase.dart'
    as _i888;
import 'package:sport_circle/features/auth/domain/usecases/register_usecase.dart'
    as _i782;
import 'package:sport_circle/features/auth/presentation/bloc/login/login_bloc.dart'
    as _i634;
import 'package:sport_circle/features/auth/presentation/bloc/register/register_bloc.dart'
    as _i940;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i952.AuthRemoteDataSource>(
      () => _i749.AuthRemoteDataSourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i568.AuthRepository>(
      () => _i853.AuthRepositoryImpl(gh<_i952.AuthRemoteDataSource>()),
    );
    gh.lazySingleton<_i888.LoginUseCase>(
      () => _i888.LoginUseCase(gh<_i568.AuthRepository>()),
    );
    gh.lazySingleton<_i782.RegisterUseCase>(
      () => _i782.RegisterUseCase(gh<_i568.AuthRepository>()),
    );
    gh.factory<_i634.LoginBloc>(
      () => _i634.LoginBloc(gh<_i888.LoginUseCase>()),
    );
    gh.factory<_i940.RegisterBloc>(
      () => _i940.RegisterBloc(gh<_i782.RegisterUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i224.RegisterModule {}
