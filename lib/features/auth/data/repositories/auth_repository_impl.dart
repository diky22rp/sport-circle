import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:sport_circle/features/auth/domain/entities/user_entity.dart';
import 'package:sport_circle/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.login(
        email: email,
        password: password,
      );
      return Right(user);
    } on DioException catch (e) {
      return Left(_mapDioToFailure(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> register({
    required String name,
    required String email,
    required String password,
    required String cPassword,
    String role = 'user',
    String phoneNumber = '',
  }) async {
    try {
      final user = await _remoteDataSource.register(
        name: name,
        email: email,
        password: password,
        cPassword: cPassword,
        role: role,
        phoneNumber: phoneNumber,
      );
      return Right(user);
    } on DioException catch (e) {
      return Left(_mapDioToFailure(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Failure _mapDioToFailure(DioException e) {
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
}
