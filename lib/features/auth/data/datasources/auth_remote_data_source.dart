import 'package:sport_circle/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
  });
}
