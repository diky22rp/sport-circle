import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/features/location/domain/entities/city_entity.dart';
import 'package:sport_circle/features/location/domain/repositories/location_repository.dart';

@lazySingleton
class GetCities {
  final LocationRepository repository;
  GetCities(this.repository);

  Future<Either<Failure, ApiResponseModel<List<CityEntity>>>> call() async {
    final result = await repository.getCities();
    return result;
  }
}

@lazySingleton
class GetCitiesByProvince {
  final LocationRepository repository;
  GetCitiesByProvince(this.repository);

  Future<Either<Failure, ApiResponseModel<List<CityEntity>>>> call(
    int provinceId,
  ) async {
    final result = await repository.getCitiesByProvince(provinceId);
    return result;
  }
}
