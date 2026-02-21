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
import 'package:sport_circle/features/activity/data/datasources/activity_api_client.dart'
    as _i291;
import 'package:sport_circle/features/activity/data/datasources/remote/activity_remote_data_source.dart'
    as _i715;
import 'package:sport_circle/features/activity/data/datasources/remote/activity_remote_data_source_impl.dart'
    as _i246;
import 'package:sport_circle/features/activity/data/repositories/activity_repository_impl.dart'
    as _i149;
import 'package:sport_circle/features/activity/domain/repositories/activity_repository.dart'
    as _i260;
import 'package:sport_circle/features/activity/domain/usecases/create_activity_usecase.dart'
    as _i990;
import 'package:sport_circle/features/activity/domain/usecases/get_activities_usecase.dart'
    as _i122;
import 'package:sport_circle/features/activity/domain/usecases/get_activity_by_id_usecase.dart'
    as _i873;
import 'package:sport_circle/features/activity/presentation/bloc/activity_bloc.dart'
    as _i1055;
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
import 'package:sport_circle/features/authentication/domain/usecases/update_profile_usecase.dart'
    as _i187;
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
import 'package:sport_circle/features/like/data/datasources/local/like_local_data_source.dart'
    as _i449;
import 'package:sport_circle/features/like/presentation/cubit/like_cubit.dart'
    as _i595;
import 'package:sport_circle/features/location/data/datasources/location_api_client.dart'
    as _i944;
import 'package:sport_circle/features/location/data/datasources/remote/location_remote_data_source_impl.dart'
    as _i37;
import 'package:sport_circle/features/location/data/datasources/remote/location_remote_datasource.dart'
    as _i140;
import 'package:sport_circle/features/location/data/repositories/location_repository_impl.dart'
    as _i543;
import 'package:sport_circle/features/location/domain/repositories/location_repository.dart'
    as _i11;
import 'package:sport_circle/features/location/domain/usecases/get_cities.dart'
    as _i249;
import 'package:sport_circle/features/location/domain/usecases/get_provinces.dart'
    as _i564;
import 'package:sport_circle/features/location/presentation/cubit/location_cubit.dart'
    as _i294;
import 'package:sport_circle/features/transaction/data/datasources/remote/transaction_remote_data_source.dart'
    as _i209;
import 'package:sport_circle/features/transaction/data/datasources/remote/transaction_remote_data_source_impl.dart'
    as _i426;
import 'package:sport_circle/features/transaction/data/datasources/transaction_api_client.dart'
    as _i739;
import 'package:sport_circle/features/transaction/data/repositories/transaction_repository_impl.dart'
    as _i623;
import 'package:sport_circle/features/transaction/domain/repositories/transaction_repository.dart'
    as _i748;
import 'package:sport_circle/features/transaction/domain/usecases/cancel_transaction_usecase.dart'
    as _i510;
import 'package:sport_circle/features/transaction/domain/usecases/create_transaction_usecase.dart'
    as _i856;
import 'package:sport_circle/features/transaction/domain/usecases/get_my_transactions_usecase.dart'
    as _i673;
import 'package:sport_circle/features/transaction/domain/usecases/get_transaction_by_id_usecase.dart'
    as _i921;
import 'package:sport_circle/features/transaction/domain/usecases/update_transaction_usecase.dart'
    as _i242;
import 'package:sport_circle/features/transaction/domain/usecases/upload_proof_payment_usecase.dart'
    as _i25;
import 'package:sport_circle/features/transaction/presentation/bloc/transaction_bloc.dart'
    as _i143;

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
    gh.lazySingleton<_i449.LikeLocalDataSource>(
      () => _i449.LikeLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i734.AuthApiClient>(
      () => registerModule.authApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i636.CategoryApiClient>(
      () => registerModule.categoryApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i291.ActivityApiClient>(
      () => registerModule.activityApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i944.LocationApiClient>(
      () => registerModule.locationApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i739.TransactionApiClient>(
      () => registerModule.transactionApiClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i715.ActivityRemoteDataSource>(
      () => _i246.ActivityRemoteDataSourceImpl(gh<_i291.ActivityApiClient>()),
    );
    gh.lazySingleton<_i867.AuthRemoteDataSource>(
      () => _i599.AuthRemoteDataSourceImpl(gh<_i734.AuthApiClient>()),
    );
    gh.factory<_i595.LikeCubit>(
      () => _i595.LikeCubit(gh<_i449.LikeLocalDataSource>()),
    );
    gh.lazySingleton<_i260.ActivityRepository>(
      () => _i149.ActivityRepositoryImpl(
        gh<_i715.ActivityRemoteDataSource>(),
        gh<_i531.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i209.TransactionRemoteDataSource>(
      () => _i426.TransactionRemoteDataSourceImpl(
        gh<_i739.TransactionApiClient>(),
      ),
    );
    gh.lazySingleton<_i990.CreateActivityUseCase>(
      () => _i990.CreateActivityUseCase(gh<_i260.ActivityRepository>()),
    );
    gh.lazySingleton<_i122.GetActivitiesUsecase>(
      () => _i122.GetActivitiesUsecase(gh<_i260.ActivityRepository>()),
    );
    gh.lazySingleton<_i873.GetActivityByIdUseCase>(
      () => _i873.GetActivityByIdUseCase(gh<_i260.ActivityRepository>()),
    );
    gh.lazySingleton<_i127.CategoryRemoteDataSource>(
      () => _i129.CategoryRemoteDataSourceImpl(
        gh<_i636.CategoryApiClient>(),
        gh<_i531.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i140.LocationRemoteDataSource>(
      () => _i37.LocationRemoteDataSourceImpl(
        gh<_i944.LocationApiClient>(),
        gh<_i531.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i896.AuthRepository>(
      () => _i152.AuthRepositoryImpl(
        gh<_i867.AuthRemoteDataSource>(),
        gh<_i531.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i11.LocationRepository>(
      () => _i543.LocationRepositoryImpl(gh<_i140.LocationRemoteDataSource>()),
    );
    gh.lazySingleton<_i249.GetCities>(
      () => _i249.GetCities(gh<_i11.LocationRepository>()),
    );
    gh.lazySingleton<_i249.GetCitiesByProvince>(
      () => _i249.GetCitiesByProvince(gh<_i11.LocationRepository>()),
    );
    gh.lazySingleton<_i564.GetProvinces>(
      () => _i564.GetProvinces(gh<_i11.LocationRepository>()),
    );
    gh.lazySingleton<_i748.TransactionRepository>(
      () => _i623.TransactionRepositoryImpl(
        gh<_i209.TransactionRemoteDataSource>(),
        gh<_i531.AuthLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i510.CancelTransactionUseCase>(
      () => _i510.CancelTransactionUseCase(gh<_i748.TransactionRepository>()),
    );
    gh.lazySingleton<_i856.CreateTransactionUseCase>(
      () => _i856.CreateTransactionUseCase(gh<_i748.TransactionRepository>()),
    );
    gh.lazySingleton<_i673.GetMyTransactionsUseCase>(
      () => _i673.GetMyTransactionsUseCase(gh<_i748.TransactionRepository>()),
    );
    gh.lazySingleton<_i921.GetTransactionByIdUseCase>(
      () => _i921.GetTransactionByIdUseCase(gh<_i748.TransactionRepository>()),
    );
    gh.lazySingleton<_i242.UpdateTransactionUseCase>(
      () => _i242.UpdateTransactionUseCase(gh<_i748.TransactionRepository>()),
    );
    gh.lazySingleton<_i25.UploadProofPaymentUseCase>(
      () => _i25.UploadProofPaymentUseCase(gh<_i748.TransactionRepository>()),
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
    gh.lazySingleton<_i187.UpdateProfileUseCase>(
      () => _i187.UpdateProfileUseCase(gh<_i896.AuthRepository>()),
    );
    gh.factory<_i1055.ActivityBloc>(
      () => _i1055.ActivityBloc(gh<_i122.GetActivitiesUsecase>()),
    );
    gh.lazySingleton<_i875.CategoryRepository>(
      () => _i91.CategoryRepositoryImpl(gh<_i127.CategoryRemoteDataSource>()),
    );
    gh.factory<_i143.TransactionBloc>(
      () => _i143.TransactionBloc(
        createTransaction: gh<_i856.CreateTransactionUseCase>(),
        getMyTransactions: gh<_i673.GetMyTransactionsUseCase>(),
        getTransactionById: gh<_i921.GetTransactionByIdUseCase>(),
        getActivityById: gh<_i873.GetActivityByIdUseCase>(),
        updateTransaction: gh<_i242.UpdateTransactionUseCase>(),
        uploadProofPayment: gh<_i25.UploadProofPaymentUseCase>(),
        cancelTransaction: gh<_i510.CancelTransactionUseCase>(),
      ),
    );
    gh.factory<_i760.AuthenticationBloc>(
      () => _i760.AuthenticationBloc(
        gh<_i209.GetMeUseCase>(),
        gh<_i110.CheckTokenUseCase>(),
        gh<_i187.UpdateProfileUseCase>(),
      ),
    );
    gh.factory<_i294.LocationCubit>(
      () => _i294.LocationCubit(
        getProvinces: gh<_i564.GetProvinces>(),
        getCities: gh<_i249.GetCities>(),
        getCitiesByProvince: gh<_i249.GetCitiesByProvince>(),
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
