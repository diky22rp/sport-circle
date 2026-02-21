import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/features/location/domain/entities/province_entity.dart';
import 'package:sport_circle/features/location/domain/repositories/location_repository.dart';

@LazySingleton()
class GetProvinces {
  final LocationRepository repository;
  GetProvinces(this.repository);

  Future<Either<Failure, ApiResponseModel<List<ProvinceEntity>>>> call() {
    return repository.getProvinces();
  }
}
