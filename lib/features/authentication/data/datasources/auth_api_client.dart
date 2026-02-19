// AuthApiClient defines all authentication-related API endpoints using Retrofit.
//
// Retrofit generates the implementation based on this abstract class and annotations.
//
// Usage:
//   final client = AuthApiClient(dio);
//   final response = await client.login({'email': ..., 'password': ...});
//
// Why Retrofit?
// - Centralizes all endpoints in one place
// - Eliminates repetitive manual Dio calls
// - Handles JSON parsing automatically via json_serializable
// - Easy to add new endpoints (just add a method and annotation)
//
// To add a new endpoint:
//   @GET('/api/v1/venues')
//   Future<ApiResponseModel<List<VenueModel>>> getVenues();
// Then run: dart run build_runner build

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sport_circle/core/constants/api_constants.dart';
import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/features/authentication/data/models/user_model.dart';

part 'auth_api_client.g.dart';

// AuthApiClient defines authentication endpoints (login, register, get profile).
@RestApi()
abstract class AuthApiClient {
  // Factory required by Retrofit for code generation.
  factory AuthApiClient(Dio dio, {String baseUrl}) = _AuthApiClient;

  // POST /api/v1/login
  // Sends email and password for login.
  // Returns ApiResponseModel<UserModel> with user data and token.
  @POST(ApiConstants.login)
  Future<ApiResponseModel<UserModel>> login(@Body() Map<String, dynamic> body);

  // POST /api/v1/register
  // Registers a new user.
  // Returns ApiResponseModel<UserModel> with user data and token.
  @POST(ApiConstants.register)
  Future<ApiResponseModel<UserModel>> register(
    @Body() Map<String, dynamic> body,
  );

  // GET /api/v1/me
  // Fetches the profile of the currently authenticated user.
  // Requires Authorization header: Bearer <token>.
  @GET(ApiConstants.me)
  Future<ApiResponseModel<UserModel>> getMe(
    @Header('Authorization') String token,
  );
}
