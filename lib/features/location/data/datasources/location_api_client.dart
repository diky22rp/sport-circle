import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/features/location/data/models/city_model.dart';
import 'package:sport_circle/features/location/data/models/province_model.dart';

part 'location_api_client.g.dart';

@RestApi()
abstract class LocationApiClient {
  factory LocationApiClient(Dio dio, {String baseUrl}) = _LocationApiClient;

  @GET('/api/v1/location/provinces')
  Future<ApiResponseModel<List<ProvinceModel>>> getProvinces(
    @Header('Authorization') String token,
    @Query('is_paginate') bool isPaginate,
  );

  @GET('/api/v1/location/cities')
  Future<ApiResponseModel<List<CityModel>>> getCities(
    @Header('Authorization') String token,
    @Query('is_paginate') bool isPaginate,
  );

  @GET('/api/v1/location/cities/{provinceId}')
  Future<ApiResponseModel<List<CityModel>>> getCitiesByProvince(
    @Header('Authorization') String token,
    @Path('provinceId') int provinceId,
    @Query('is_paginate') bool isPaginate,
  );
}
