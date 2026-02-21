import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';

class PaginatedActivitiesEntity {
  final List<ActivityEntity> data;
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  PaginatedActivitiesEntity({
    required this.data,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
  });
}
