import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/activity/data/datasources/activity_api_client.dart';
import 'package:sport_circle/features/activity/data/datasources/remote/activity_remote_data_source.dart';
import 'package:sport_circle/features/activity/data/models/activity_model.dart';

@LazySingleton(as: ActivityRemoteDataSource)
class ActivityRemoteDataSourceImpl implements ActivityRemoteDataSource {
  final ActivityApiClient _apiClient;

  ActivityRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<ActivityModel>> getActivities({
    required String token,
    bool isPaginate = false,
    int perPage = 5,
    int page = 1,
    String? search,
    int? sportCategoryId,
    int? cityId,
  }) async {
    final response = await _apiClient.getActivities(
      token: token,
      isPaginate: isPaginate,
      perPage: perPage,
      page: page,
      search: search,
      sportCategoryId: sportCategoryId,
      cityId: cityId,
    );

    // Retrofit sudah parsing ke model
    if (isPaginate) {
      final map = response.result as Map<String, dynamic>;
      final List<dynamic> rawList = map['data'] ?? [];
      final List<ActivityModel> activities = rawList.map((item) {
        if (item is ActivityModel) return item;
        return ActivityModel.fromJson(item as Map<String, dynamic>);
      }).toList();
      return activities;
    } else {
      final List<dynamic> rawList = response.result as List<dynamic>;
      final List<ActivityModel> activities = rawList.map((item) {
        if (item is ActivityModel) return item;
        return ActivityModel.fromJson(item as Map<String, dynamic>);
      }).toList();
      return activities;
    }
  }

  @override
  Future<ActivityModel> getActivityById({
    required String token,
    required int id,
  }) async {
    final response = await _apiClient.getActivityById(token, id);
    return response.data!;
  }

  @override
  Future<ActivityModel> createActivity({
    required String token,
    required String name,
    required String description,
    required int sportCategoryId,
    required int cityId,
    required String imageUrl,
  }) async {
    final request = {
      'name': name,
      'description': description,
      'sport_category_id': sportCategoryId,
      'city_id': cityId,
      'image_url': imageUrl,
    };
    final response = await _apiClient.createActivity(token, request);
    return response.data!;
  }

  @override
  Future<ActivityModel> updateActivity({
    required String token,
    required int id,
    required int sportCategoryId,
    required int cityId,
    required String imageUrl,
  }) async {
    final request = {
      'sport_category_id': sportCategoryId,
      'city_id': cityId,
      'image_url': imageUrl,
    };
    final response = await _apiClient.updateActivity(token, id, request);
    return response.data!;
  }

  @override
  Future<void> deleteActivity({required String token, required int id}) async {
    await _apiClient.deleteActivity(token, id);
  }
}
