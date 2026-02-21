import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/activity/data/datasources/remote/activity_remote_data_source.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';
import 'package:sport_circle/features/activity/domain/entities/paginated_activities_entity.dart';
import 'package:sport_circle/features/activity/domain/repositories/activity_repository.dart';
import 'package:sport_circle/features/authentication/data/datasources/local/auth_local_data_source.dart';

@LazySingleton(as: ActivityRepository)
class ActivityRepositoryImpl implements ActivityRepository {
  final ActivityRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  ActivityRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, PaginatedActivitiesEntity>> getActivities({
    bool isPaginate = false,
    int perPage = 10,
    int page = 1,
    String? search,
    int? sportCategoryId,
    int? cityId,
  }) async {
    final token = await _localDataSource.getToken();
    if (token == null || token.isEmpty) {
      return Left(ServerFailure('Token tidak ditemukan, silakan login ulang'));
    }

    try {
      final paginated = await _remoteDataSource.getActivities(
        token: token,
        isPaginate: isPaginate,
        perPage: perPage,
        page: page,
        search: search,
        sportCategoryId: sportCategoryId,
        cityId: cityId,
      );
      return Right(paginated);
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ActivityEntity>> getActivityById({
    required int id,
  }) async {
    try {
      final token = await _localDataSource.getToken();
      if (token == null || token.isEmpty) {
        return Left(
          ServerFailure('Token tidak ditemukan, silakan login ulang'),
        );
      }

      final activity = await _remoteDataSource.getActivityById(
        id: id,
        token: token,
      );

      return Right(activity.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ActivityEntity>> createActivity({
    required String name,
    required String description,
    required int sportCategoryId,
    required int cityId,
    required String imageUrl,
  }) async {
    try {
      final token = await _localDataSource.getToken();
      if (token == null || token.isEmpty) {
        return Left(
          ServerFailure('Token tidak ditemukan, silakan login ulang'),
        );
      }

      final activity = await _remoteDataSource.createActivity(
        token: token,
        name: name,
        description: description,
        sportCategoryId: sportCategoryId,
        cityId: cityId,
        imageUrl: imageUrl,
      );
      return Right(activity.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ActivityEntity>> updateActivity({
    required int id,
    required String name,
    required String description,
    required int sportCategoryId,
    required int cityId,
    required String imageUrl,
  }) async {
    try {
      final token = await _localDataSource.getToken();
      if (token == null || token.isEmpty) {
        return Left(
          ServerFailure('Token tidak ditemukan, silakan login ulang'),
        );
      }

      final activity = await _remoteDataSource.updateActivity(
        token: token,
        id: id,
        sportCategoryId: sportCategoryId,
        cityId: cityId,
        imageUrl: imageUrl,
      );
      return Right(activity.toEntity());
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteActivity({required int id}) async {
    try {
      final token = await _localDataSource.getToken();
      if (token == null || token.isEmpty) {
        return Left(
          ServerFailure('Token tidak ditemukan, silakan login ulang'),
        );
      }
      await _remoteDataSource.deleteActivity(token: token, id: id);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ServerFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
