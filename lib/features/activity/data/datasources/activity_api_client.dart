import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sport_circle/core/constants/api_constants.dart';
import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/features/activity/data/models/activity_model.dart';

part 'activity_api_client.g.dart';

// ActivityApiClient defines activity-related API endpoints.
@RestApi()
abstract class ActivityApiClient {
  // Factory required by Retrofit for code generation.
  factory ActivityApiClient(Dio dio, {String baseUrl}) = _ActivityApiClient;

  // POST /api/v1/activities
  // Creates a new activity.
  // Returns ApiResponseModel<ActivityModel> with the created activity data.
  @POST(ApiConstants.activities)
  Future<ApiResponseModel<ActivityModel>> createActivity(
    @Header('Authorization') String? token,
    @Body() Map<String, dynamic> body,
  );

  // GET /api/v1/activities
  // Fetches a list of activities with optional pagination and filters.
  // Returns ApiResponseModel<List<ActivityModel>> with the list of activities.
  @GET(ApiConstants.activities)
  Future<ApiResponseModel<dynamic>> getActivities({
    @Header('Authorization') String? token,
    @Query('is_paginate') bool isPaginate = false,
    @Query('per_page') int perPage = 5,
    @Query('page') int page = 1,
    @Query('search') String? search,
    @Query('sport_category_id') int? sportCategoryId,
    @Query('city_id') int? cityId,
  });

  // GET /api/v1/activities/{id}
  // Fetches a single activity by its ID.
  // Returns ApiResponseModel<ActivityModel> with the activity data.
  @GET('${ApiConstants.activities}/{id}')
  Future<ApiResponseModel<ActivityModel>> getActivityById(
    @Header('Authorization') String? token,
    @Path('id') int id,
  );

  // POST /api/v1/activities/update/{id}
  // Updates an existing activity by its ID.
  // Returns ApiResponseModel<ActivityModel> with the updated activity data.
  @POST('${ApiConstants.activities}/update/{id}')
  Future<ApiResponseModel<ActivityModel>> updateActivity(
    @Header('Authorization') String? token,
    @Path('id') int id,
    @Body() Map<String, dynamic> body,
  );

  // DELETE /api/v1/activities/delete/{id}
  // Deletes an activity by its ID.
  // Returns ApiResponseModel<void> indicating success or failure.
  @DELETE('${ApiConstants.activities}/delete/{id}')
  Future<ApiResponseModel<void>> deleteActivity(
    @Header('Authorization') String? token,
    @Path('id') int id,
  );
}
