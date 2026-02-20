// AuthRemoteDataSourceImpl provides the concrete implementation of AuthRemoteDataSource.
//
// This class uses AuthApiClient (Retrofit) to handle all network requests related to authentication.
//
// Why keep a DataSource layer instead of using Retrofit directly in the repository?
// - Allows for additional data transformation (e.g., extracting token from the response)
// - Keeps the repository clean and focused on business logic
// - Makes it easy to swap out Retrofit for another client (e.g., GraphQL) without changing the repository
//
// Request flow:
//   AuthRemoteDataSourceImpl → AuthApiClient (Retrofit) → _AuthApiClient (generated) → Dio → Server

import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/authentication/data/datasources/auth_api_client.dart';
import 'package:sport_circle/features/authentication/data/datasources/remote/auth_remote_data_source.dart';
import 'package:sport_circle/features/authentication/data/models/user_model.dart';

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiClient _apiClient;

  AuthRemoteDataSourceImpl(this._apiClient);

  // Calls AuthApiClient.login (POST /api/v1/login).
  // Extracts the user and token from the response.
  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.login({
      'email': email,
      'password': password,
    });
    final user = response.data;
    final token = response.token ?? user?.token;
    return UserModel(
      id: user?.id ?? '',
      name: user?.name ?? '',
      email: user?.email ?? '',
      role: user?.role,
      phoneNumber: user?.phoneNumber,
      token: token,
    );
  }

  // Calls AuthApiClient.register (POST /api/v1/register).
  // Extracts the user and token from the response.
  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String cPassword,
    String role = 'user',
    String phoneNumber = '',
  }) async {
    final response = await _apiClient.register({
      'name': name,
      'email': email,
      'password': password,
      'c_password': cPassword,
      'role': role,
      'phone_number': phoneNumber,
    });
    final user = response.data;
    final token = response.token ?? user?.token;
    return UserModel(
      id: user?.id ?? '',
      name: user?.name ?? '',
      email: user?.email ?? '',
      role: user?.role,
      phoneNumber: user?.phoneNumber,
      token: token,
    );
  }

  // Calls AuthApiClient.getMe (GET /api/v1/me) with the provided token.
  @override
  Future<UserModel> getMe({required String token}) async {
    final response = await _apiClient.getMe('Bearer $token');
    final user = response.data;
    return UserModel(
      id: user?.id ?? '',
      name: user?.name ?? '',
      email: user?.email ?? '',
      role: user?.role,
      phoneNumber: user?.phoneNumber,
      token: token,
    );
  }

  // Calls AuthApiClient.updateProfile (POST /api/v1/update-user/id) with the provided token and profile data.
  @override
  Future<UserModel> updateProfile({
    required int userId,
    required String email,
    required String name,
    required String phoneNumber,
    required String password,
    required String cPassword,
    required String token,
    String role = 'user',
  }) async {
    final response = await _apiClient.updateProfile(userId, 'Bearer $token', {
      'email': email,
      'name': name,
      'phone_number': phoneNumber,
      'password': password,
      'c_password': cPassword,
      'role': role,
    });
    final user = response.data;
    return UserModel(
      id: user?.id ?? '',
      name: user?.name ?? '',
      email: user?.email ?? '',
      role: user?.role,
      phoneNumber: user?.phoneNumber,
      token: token,
    );
  }
}
