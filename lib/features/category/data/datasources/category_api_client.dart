import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sport_circle/core/constants/api_constants.dart';
import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/features/category/data/models/category_model.dart';

part 'category_api_client.g.dart';

@RestApi()
abstract class CategoryApiClient {
  // Factory required by Retrofit for code generation.
  factory CategoryApiClient(Dio dio, {String baseUrl}) = _CategoryApiClient;

  // GET /api/v1/sport-categories
  // Fetches the list of sport categories.
  // Returns ApiResponseModel with a list of categories (paginated or not).
  @GET(ApiConstants.getSportCategory)
  Future<ApiResponseModel<List<CategoryModel>>> getSportCategories(
    @Header('Authorization') String token,
    @Query('is_paginate') bool isPaginate,
  );
}
