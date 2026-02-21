import 'package:dartz/dartz.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/features/location/domain/entities/province_entity.dart';
import 'package:sport_circle/features/location/domain/entities/city_entity.dart';

abstract class LocationRepository {
  Future<Either<Failure, ApiResponseModel<List<ProvinceEntity>>>>
  getProvinces();
  Future<Either<Failure, ApiResponseModel<List<CityEntity>>>> getCities();
  Future<Either<Failure, ApiResponseModel<List<CityEntity>>>>
  getCitiesByProvince(int provinceId);
}
