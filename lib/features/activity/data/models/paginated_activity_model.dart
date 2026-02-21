import 'package:sport_circle/features/activity/data/models/activity_model.dart';

class PaginatedActivitiesModel {
  final List<ActivityModel> activities;
  final int currentPage;
  final int lastPage;
  final String? nextPageUrl;

  PaginatedActivitiesModel({
    required this.activities,
    required this.currentPage,
    required this.lastPage,
    required this.nextPageUrl,
  });

  factory PaginatedActivitiesModel.fromJson(Map<String, dynamic> json) {
    final result = json['result'] as Map<String, dynamic>;
    final data = result['data'] as List<dynamic>;
    return PaginatedActivitiesModel(
      activities: data.map((e) => ActivityModel.fromJson(e)).toList(),
      currentPage: result['current_page'] ?? 1,
      lastPage: result['last_page'] ?? 1,
      nextPageUrl: result['next_page_url'],
    );
  }
}
