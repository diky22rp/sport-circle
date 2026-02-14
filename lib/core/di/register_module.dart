import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// If you use Firebase, uncomment and add firebase packages to pubspec
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

@module
abstract class RegisterModule {
  // Shared Preferences (async)
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  // Dio client
  @lazySingleton
  Dio dio() => Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  // Firebase examples (optional)
  // @lazySingleton
  // FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  // @lazySingleton
  // FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
