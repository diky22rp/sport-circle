import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_circle/core/constants/api_constants.dart';
import 'package:sport_circle/features/activity/data/datasources/activity_api_client.dart';
import 'package:sport_circle/features/authentication/data/datasources/auth_api_client.dart';
import 'package:sport_circle/features/category/data/datasources/category_api_client.dart';
import 'package:sport_circle/features/location/data/datasources/location_api_client.dart';

/// ========================================================================
/// Register Module — Dependency Injection
/// ========================================================================
@module
abstract class RegisterModule {
  /// SharedPreferences — untuk menyimpan data sederhana (non-sensitif).
  /// @preResolve → diinisialisasi sebelum app mulai (karena async).
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  /// Secure Storage — untuk menyimpan data sensitif (token) secara encrypted.
  /// Menggunakan EncryptedSharedPreferences di Android.
  @lazySingleton
  FlutterSecureStorage get secureStorage =>
      const FlutterSecureStorage(aOptions: AndroidOptions());

  /// Dio — HTTP client dasar yang dipakai oleh Retrofit.
  ///
  /// Konfigurasi di sini:
  /// - baseUrl: URL server API
  /// - timeout: batas waktu koneksi & response (15 detik)
  /// - headers: Content-Type dan Accept default
  /// - LogInterceptor: untuk debug request/response di console
  ///
  /// Dio = mesin, Retrofit = sopir yang tahu rute (endpoint).
  @lazySingleton
  Dio dio() => Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  )..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  @lazySingleton
  AuthApiClient authApiClient(Dio dio) => AuthApiClient(dio);

  @lazySingleton
  CategoryApiClient categoryApiClient(Dio dio) => CategoryApiClient(dio);

  @lazySingleton
  ActivityApiClient activityApiClient(Dio dio) => ActivityApiClient(dio);

  @lazySingleton
  LocationApiClient locationApiClient(Dio dio) => LocationApiClient(dio);
}
