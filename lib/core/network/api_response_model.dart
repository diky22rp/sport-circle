/// ========================================================================
/// API Response Model
/// ========================================================================
///
/// Model generic untuk membungkus response dari server.
///
/// Kebanyakan API mengembalikan format seperti ini:
/// ```json
/// {
///   "success": true,
///   "message": "Login berhasil",
///   "data": { ... },
///   "token": "abc123..."
/// }
/// ```
///
/// Kelas ini membantu parsing response tersebut secara otomatis
/// oleh Retrofit + json_serializable.
/// ========================================================================
library;

import 'package:json_annotation/json_annotation.dart';

part 'api_response_model.g.dart';

/// [ApiResponseModel] adalah wrapper generic untuk semua response dari API.
///
/// - [T] = tipe data yang ada di dalam field `data`.
///   Misalnya `ApiResponseModel<UserModel>` artinya field `data` berisi UserModel.
///
/// Contoh penggunaan:
/// ```dart
/// final response = await authApiClient.login(body);
/// // response.data    → UserModel
/// // response.token   → "abc123..."
/// // response.message → "Login berhasil"
/// ```
@JsonSerializable(genericArgumentFactories: true)
class ApiResponseModel<T> {
  /// Apakah request berhasil atau tidak.
  final bool? success;
  final bool? error;

  /// Pesan dari server (misal: "Login berhasil", "Unauthorized").
  final String? message;

  /// Data utama dari response. Tipe-nya dinamis sesuai generic [T].
  /// Misalnya bisa berisi [UserModel], `[List<VenueModel>]`, dll.
  final T? data;
  final T? result;

  /// Token autentikasi yang diberikan setelah login/register.
  final String? token;

  const ApiResponseModel({
    this.success,
    this.error,
    this.message,
    this.data,
    this.result,
    this.token,
  });

  /// Factory untuk parsing JSON → `ApiResponseModel<T>`.
  ///
  /// [fromJsonT] adalah fungsi yang tahu cara mengubah JSON menjadi tipe [T].
  /// Contoh: jika T = UserModel, maka fromJsonT = UserModel.fromJson
  factory ApiResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseModelFromJson(json, fromJsonT);

  /// Mengubah `ApiResponseModel<T>` kembali menjadi JSON.
  ///
  /// [toJsonT] adalah fungsi yang tahu cara mengubah tipe [T] ke JSON.
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ApiResponseModelToJson(this, toJsonT);

  /// Getter untuk mengambil payload utama (data atau result)
  T? get payload => data ?? result;
}
