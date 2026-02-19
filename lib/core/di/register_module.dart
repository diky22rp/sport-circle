import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_circle/core/constants/api_constants.dart';
import 'package:sport_circle/features/authentication/data/datasources/auth_api_client.dart';

/// ========================================================================
/// Register Module — Dependency Injection
/// ========================================================================
///
/// File ini mendaftarkan semua dependency external (library pihak ketiga)
/// ke dalam GetIt (service locator) menggunakan injectable.
///
/// Kenapa pakai @module?
/// → Karena kita tidak bisa menambahkan annotation @injectable ke class
///   dari library (misal Dio, SharedPreferences) secara langsung.
///   Jadi kita bungkus dalam module ini.
///
/// Urutan penting:
/// 1. SharedPreferences (async, perlu preResolve)
/// 2. FlutterSecureStorage (untuk simpan token encrypted)
/// 3. Dio (HTTP client dasar)
/// 4. AuthApiClient (Retrofit client, butuh Dio)
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
  /// Retrofit TIDAK menggantikan Dio. Retrofit justru BUTUH Dio.
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

  /// AuthApiClient — Retrofit client untuk endpoint autentikasi.
  ///
  /// Dibuat dari Dio instance di atas.
  /// Semua endpoint (login, register, getMe) didefinisikan
  /// di [AuthApiClient] dengan annotation @POST, @GET, dll.
  ///
  /// Kalau nanti ada feature baru (misal Venue), tinggal buat
  /// VenueApiClient yang sama-sama pakai Dio ini.
  @lazySingleton
  AuthApiClient authApiClient(Dio dio) => AuthApiClient(dio);
}
