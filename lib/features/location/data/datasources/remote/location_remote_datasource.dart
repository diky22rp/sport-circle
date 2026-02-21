import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/features/location/data/models/province_model.dart';
import 'package:sport_circle/features/location/data/models/city_model.dart';

abstract class LocationRemoteDataSource {
  Future<ApiResponseModel<List<ProvinceModel>>> getProvinces();
  Future<ApiResponseModel<List<CityModel>>> getCities();
  Future<ApiResponseModel<List<CityModel>>> getCitiesByProvince(int provinceId);
}
