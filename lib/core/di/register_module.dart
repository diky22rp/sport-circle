import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sport_circle/core/constants/api_constants.dart';

@module
abstract class RegisterModule {
  // Shared Preferences (async)
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  // Secure Storage (untuk token, encrypted)
  @lazySingleton
  FlutterSecureStorage get secureStorage => const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  // Dio client
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

  // Firebase examples (optional)
  // @lazySingleton
  // FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  // @lazySingleton
  // FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
