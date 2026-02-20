import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/authentication/data/datasources/local/auth_local_data_source.dart';
import 'package:sport_circle/features/authentication/data/datasources/remote/auth_remote_data_source.dart';
import 'package:sport_circle/features/authentication/domain/entities/user_entity.dart';
import 'package:sport_circle/features/authentication/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

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

      await _localDataSource.saveToken(user.token ?? '');

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

  @override
  Future<Either<Failure, UserEntity>> getMe() async {
    try {
      final token = await _localDataSource.getToken();
      if (token == null || token.isEmpty) {
        return Left(
          ServerFailure('Token tidak ditemukan, silakan login ulang'),
        );
      }
      final user = await _remoteDataSource.getMe(token: token);
      return Right(user);
    } on DioException catch (e) {
      return Left(_mapDioToFailure(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<bool> hasToken() async {
    final token = await _localDataSource.getToken();
    return token != null && token.isNotEmpty;
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

  @override
  Future<Either<Failure, UserEntity>> updateProfile({
    required String email,
    required String name,
    required String phoneNumber,
    required String password,
    required String cPassword,
  }) async {
    try {
      final token = await _localDataSource.getToken();
      if (token == null || token.isEmpty) {
        return Left(
          ServerFailure('Token tidak ditemukan, silakan login ulang'),
        );
      }
      final user = await _remoteDataSource.getMe(token: token);
      final userId = int.tryParse(user.id.toString()) ?? 0;

      final updatedUser = await _remoteDataSource.updateProfile(
        userId: userId,
        token: token,
        email: email,
        name: name,
        phoneNumber: phoneNumber,
        password: password,
        cPassword: cPassword,
      );
      return Right(updatedUser);
    } on DioException catch (e) {
      return Left(_mapDioToFailure(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
