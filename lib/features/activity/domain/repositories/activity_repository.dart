import 'package:dartz/dartz.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';

abstract class ActivityRepository {
  Future<Either<Failure, List<ActivityEntity>>> getActivities({
    bool isPaginate,
    int perPage,
    int page,
    String? search,
    int? sportCategoryId,
    int? cityId,
  });

  Future<Either<Failure, ActivityEntity>> getActivityById({required int id});

  Future<Either<Failure, ActivityEntity>> createActivity({
    required String name,
    required String description,
    required int sportCategoryId,
    required int cityId,
    required String imageUrl,
  });

  Future<Either<Failure, ActivityEntity>> updateActivity({
    required int id,
    required String name,
    required String description,
    required int sportCategoryId,
    required int cityId,
    required String imageUrl,
  });

  Future<Either<Failure, void>> deleteActivity({required int id});
}
