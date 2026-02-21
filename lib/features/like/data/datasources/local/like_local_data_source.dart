import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';

abstract class LikeLocalDataSource {
  Future<Map<int, bool>> loadLikes();
  Future<void> saveLikes(Map<int, bool> likes);

  Future<List<ActivityEntity>> loadLikedActivities();
  Future<void> saveLikedActivity(ActivityEntity activity);
  Future<void> removeLikedActivity(int activityId);
}

@LazySingleton(as: LikeLocalDataSource)
class LikeLocalDataSourceImpl implements LikeLocalDataSource {
  static const _key = 'liked_activities';
  static const _dataKey = 'liked_activities_data';

  @override
  Future<Map<int, bool>> loadLikes() async {
    final prefs = await SharedPreferences.getInstance();
    final likedIds = prefs.getStringList(_key) ?? [];
    return {for (var id in likedIds) int.parse(id): true};
  }

  @override
  Future<void> saveLikes(Map<int, bool> likes) async {
    final prefs = await SharedPreferences.getInstance();
    final likedIds = likes.entries.where((e) => e.value).map((e) => e.key.toString()).toList();
    await prefs.setStringList(_key, likedIds);
  }

  @override
  Future<List<ActivityEntity>> loadLikedActivities() async {
    final prefs = await SharedPreferences.getInstance();
    final dataList = prefs.getStringList(_dataKey) ?? [];
    return dataList.map((jsonStr) => ActivityEntity.fromJson(json.decode(jsonStr))).toList();
  }

  @override
  Future<void> saveLikedActivity(ActivityEntity activity) async {
    final prefs = await SharedPreferences.getInstance();
    final dataList = prefs.getStringList(_dataKey) ?? [];
    final activityJson = json.encode(activity.toJson());
    // Hindari duplikat
    if (!dataList.contains(activityJson)) {
      dataList.add(activityJson);
      await prefs.setStringList(_dataKey, dataList);
    }
  }

  @override
  Future<void> removeLikedActivity(int activityId) async {
    final prefs = await SharedPreferences.getInstance();
    final dataList = prefs.getStringList(_dataKey) ?? [];
    final updatedList = dataList.where((jsonStr) {
      final activity = ActivityEntity.fromJson(json.decode(jsonStr));
      return activity.id != activityId;
    }).toList();
    await prefs.setStringList(_dataKey, updatedList);
  }
}