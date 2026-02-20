import 'package:dio/dio.dart';
import 'package:sport_circle/core/error/failures.dart';

Failure mapDioToFailure(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
      return ConnectionFailure(e.message ?? 'Connection error');
    case DioExceptionType.badResponse:
      final data = e.response?.data;
      final msg = (data is Map) ? (data['message'] ?? e.message) : e.message;
      return ServerFailure(msg?.toString() ?? 'Server error');
    default:
      return ServerFailure(e.message ?? 'Unknown error');
  }
}
