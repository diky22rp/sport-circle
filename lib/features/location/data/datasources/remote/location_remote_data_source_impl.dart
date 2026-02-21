import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/features/authentication/data/datasources/local/auth_local_data_source.dart';
import 'package:sport_circle/features/location/data/datasources/location_api_client.dart';
import 'package:sport_circle/features/location/data/datasources/remote/location_remote_datasource.dart';
import 'package:sport_circle/features/location/data/models/province_model.dart';
import 'package:sport_circle/features/location/data/models/city_model.dart';
import 'package:sport_circle/core/error/exceptions.dart';

@LazySingleton(as: LocationRemoteDataSource)
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final LocationApiClient _apiClient;
  final AuthLocalDataSource _authLocalDataSource;

  LocationRemoteDataSourceImpl(this._apiClient, this._authLocalDataSource);

  @override
  Future<ApiResponseModel<List<ProvinceModel>>> getProvinces() async {
    final token = await _authLocalDataSource.getToken();
    if (token == null) {
      throw UnauthenticatedException();
    }
    final response = await _apiClient.getProvinces(token, false);
    return response;
  }

  @override
  Future<ApiResponseModel<List<CityModel>>> getCities() async {
    final token = await _authLocalDataSource.getToken();
    if (token == null) {
      throw UnauthenticatedException();
    }
    final response = await _apiClient.getCities(token, false);
    return response;
  }

  @override
  Future<ApiResponseModel<List<CityModel>>> getCitiesByProvince(
    int provinceId,
  ) async {
    final token = await _authLocalDataSource.getToken();
    if (token == null) {
      throw UnauthenticatedException();
    }
    final response = await _apiClient.getCitiesByProvince(
      token,
      provinceId,
      false,
    );
    return response;
  }
}
