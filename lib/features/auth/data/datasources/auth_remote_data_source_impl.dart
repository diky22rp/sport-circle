import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/constants/api_constants.dart';
import 'package:sport_circle/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:sport_circle/features/auth/data/models/user_model.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      ApiConstants.login,
      data: {'email': email, 'password': password},
    );

    final data = response.data;
    // Adjust parsing based on actual API response structure
    final user = data['data'] ?? data['user'] ?? data;
    final token = data['token'] ?? user['token'];
    return UserModel.fromJson(
      Map<String, dynamic>.from(user),
      token: token?.toString(),
    );
  }

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String cPassword,
    String role = 'user',
    String phoneNumber = '',
  }) async {
    final response = await _dio.post(
      ApiConstants.register,
      data: {
        'email': email,
        'name': name,
        'password': password,
        'c_password': cPassword,
        'role': role,
        'phone_number': phoneNumber,
      },
    );

    final data = response.data;
    final user = data['data'] ?? data['user'] ?? data;
    final token = data['token'] ?? user['token'];
    return UserModel.fromJson(
      Map<String, dynamic>.from(user),
      token: token?.toString(),
    );
  }

  @override
  Future<UserModel> getMe({required String token}) async {
    final response = await _dio.get(
      ApiConstants.me,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      ),
    );

    final data = response.data;
    final user = data['data'] ?? data;
    return UserModel.fromJson(Map<String, dynamic>.from(user), token: token);
  }
}
