import 'package:sport_circle/features/activity/data/models/activity_model.dart';

abstract class ActivityRemoteDataSource {
  Future<List<ActivityModel>> getActivities({
    required String token,
    bool isPaginate,
    int perPage,
    int page,
    String? search,
    int? sportCategoryId,
    int? cityId,
  });

  Future<ActivityModel> getActivityById({
    required String token,
    required int id,
  });

  Future<ActivityModel> createActivity({
    required String token,
    required String name,
    required String description,
    required int sportCategoryId,
    required int cityId,
    required String imageUrl,
  });

  Future<ActivityModel> updateActivity({
    required String token,
    required int id,
    required int sportCategoryId,
    required int cityId,
    required String imageUrl,
  });

  Future<void> deleteActivity({required String token, required int id});
}
