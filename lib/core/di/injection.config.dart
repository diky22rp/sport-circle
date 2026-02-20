// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:sport_circle/core/di/register_module.dart' as _i224;
import 'package:sport_circle/features/authentication/data/datasources/auth_api_client.dart'
    as _i734;
import 'package:sport_circle/features/authentication/data/datasources/local/auth_local_data_source.dart'
    as _i531;
import 'package:sport_circle/features/authentication/data/datasources/remote/auth_remote_data_source.dart'
    as _i867;
import 'package:sport_circle/features/authentication/data/datasources/remote/auth_remote_data_source_impl.dart'
    as _i599;
import 'package:sport_circle/features/authentication/data/repositories/auth_repository_impl.dart'
    as _i152;
import 'package:sport_circle/features/authentication/domain/repositories/auth_repository.dart'
    as _i896;
import 'package:sport_circle/features/authentication/domain/usecases/check_token_usecase.dart'
    as _i110;
import 'package:sport_circle/features/authentication/domain/usecases/get_me_usecase.dart'
    as _i209;
import 'package:sport_circle/features/authentication/domain/usecases/login_usecase.dart'
    as _i36;
import 'package:sport_circle/features/authentication/domain/usecases/register_usecase.dart'
    as _i499;
import 'package:sport_circle/features/authentication/presentation/bloc/authentication/authentication_bloc.dart'
    as _i760;
import 'package:sport_circle/features/authentication/presentation/bloc/login/login_bloc.dart'
    as _i112;
import 'package:sport_circle/features/authentication/presentation/bloc/register/register_bloc.dart'
    as _i435;
import 'package:sport_circle/features/category/data/datasources/category_api_client.dart'
    as _i636;
import 'package:sport_circle/features/category/data/datasources/remote/category_remote_data_source.dart'
    as _i127;
import 'package:sport_circle/features/category/data/datasources/remote/category_remote_data_source_impl.dart'
    as _i129;
import 'package:sport_circle/features/category/data/repositories/category_repository_impl.dart'
    as _i91;
import 'package:sport_circle/features/category/domain/repositories/category_repository.dart'
    as _i875;
import 'package:sport_circle/features/category/domain/usecases/get_sport_categories.dart'
    as _i233;
import 'package:sport_circle/features/category/presentation/bloc/category_bloc.dart'
    as _i296;

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
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i531.AuthLocalDataSource>(
      () => _i531.AuthLocalDataSourceImpl(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i734.AuthApiClient>(
      () => registerModule.authApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i636.CategoryApiClient>(
      () => registerModule.categoryApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i867.AuthRemoteDataSource>(
      () => _i599.AuthRemoteDataSourceImpl(gh<_i734.AuthApiClient>()),
    );
    gh.lazySingleton<_i127.CategoryRemoteDataSource>(
      () => _i129.CategoryRemoteDataSourceImpl(
        gh<_i636.CategoryApiClient>(),
        gh<_i531.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i896.AuthRepository>(
      () => _i152.AuthRepositoryImpl(
        gh<_i867.AuthRemoteDataSource>(),
        gh<_i531.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i110.CheckTokenUseCase>(
      () => _i110.CheckTokenUseCase(gh<_i896.AuthRepository>()),
    );
    gh.lazySingleton<_i209.GetMeUseCase>(
      () => _i209.GetMeUseCase(gh<_i896.AuthRepository>()),
    );
    gh.lazySingleton<_i36.LoginUseCase>(
      () => _i36.LoginUseCase(gh<_i896.AuthRepository>()),
    );
    gh.lazySingleton<_i499.RegisterUseCase>(
      () => _i499.RegisterUseCase(gh<_i896.AuthRepository>()),
    );
    gh.lazySingleton<_i875.CategoryRepository>(
      () => _i91.CategoryRepositoryImpl(gh<_i127.CategoryRemoteDataSource>()),
    );
    gh.factory<_i760.AuthenticationBloc>(
      () => _i760.AuthenticationBloc(
        gh<_i209.GetMeUseCase>(),
        gh<_i110.CheckTokenUseCase>(),
      ),
    );
    gh.factory<_i112.LoginBloc>(() => _i112.LoginBloc(gh<_i36.LoginUseCase>()));
    gh.factory<_i435.RegisterBloc>(
      () => _i435.RegisterBloc(gh<_i499.RegisterUseCase>()),
    );
    gh.lazySingleton<_i233.GetSportCategories>(
      () => _i233.GetSportCategories(gh<_i875.CategoryRepository>()),
    );
    gh.factory<_i296.CategoryBloc>(
      () => _i296.CategoryBloc(
        gh<_i233.GetSportCategories>(),
        gh<_i760.AuthenticationBloc>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i224.RegisterModule {}
