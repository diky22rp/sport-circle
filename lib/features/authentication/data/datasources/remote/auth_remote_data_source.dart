import 'package:sport_circle/features/authentication/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  /// Logs in a user with email and password. Returns the user and token.
  Future<UserModel> login({required String email, required String password});

  /// Registers a new user. Returns the created user.
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String cPassword,
    String role = 'user',
    String phoneNumber = '',
  });

  /// Fetches the profile of the currently authenticated user using the token.
  Future<UserModel> getMe({required String token});

  Future<UserModel> updateProfile({
    required int userId,
    required String email,
    required String name,
    required String phoneNumber,
    required String password,
    required String cPassword,
    required String token,
    String role = 'user',
  });
}
