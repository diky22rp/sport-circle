import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/core/utils/dio_failure_mapper.dart';
import 'package:sport_circle/features/location/data/datasources/remote/location_remote_datasource.dart';
import 'package:sport_circle/features/location/domain/entities/city_entity.dart';
import 'package:sport_circle/features/location/domain/entities/province_entity.dart';
import 'package:sport_circle/features/location/domain/repositories/location_repository.dart';

@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource _remoteDataSource;

  LocationRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, ApiResponseModel<List<ProvinceEntity>>>>
  getProvinces() async {
    try {
      final response = await _remoteDataSource.getProvinces();
      final models = response.data ?? response.result ?? [];
      final entities = models
          .map(
            (m) => ProvinceEntity(
              provinceId: m.provinceId,
              provinceName: m.provinceName,
            ),
          )
          .toList();
      return Right(
        ApiResponseModel<List<ProvinceEntity>>(
          data: entities,
          message: response.message,
          success: response.success,
          error: response.error,
          token: response.token,
        ),
      );
    } on DioException catch (e) {
      return Left(mapDioToFailure(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponseModel<List<CityEntity>>>>
  getCities() async {
    try {
      final response = await _remoteDataSource.getCities();
      final models = response.data ?? response.result ?? [];
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(
        ApiResponseModel<List<CityEntity>>(
          data: entities,
          message: response.message,
          success: response.success,
          error: response.error,
          token: response.token,
        ),
      );
    } on DioException catch (e) {
      return Left(mapDioToFailure(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponseModel<List<CityEntity>>>>
  getCitiesByProvince(int provinceId) async {
    try {
      final response = await _remoteDataSource.getCitiesByProvince(provinceId);
      final models = response.data ?? response.result ?? [];
      final entities = models.map((m) => m.toEntity()).toList();
      return Right(
        ApiResponseModel<List<CityEntity>>(
          data: entities,
          message: response.message,
          success: response.success,
          error: response.error,
          token: response.token,
        ),
      );
    } on DioException catch (e) {
      return Left(mapDioToFailure(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
