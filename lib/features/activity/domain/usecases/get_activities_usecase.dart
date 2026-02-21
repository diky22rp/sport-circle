import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/activity/domain/repositories/activity_repository.dart';

@lazySingleton
class GetActivitiesUsecase {
  final ActivityRepository repository;

  GetActivitiesUsecase(this.repository);

  Future<Either<Failure, List<ActivityEntity>>> call({
    isPaginate = true,
    required int page,
    required int perPage,
    String? search,
    int? sportCategoryId,
    int? cityId,
  }) async {
    return await repository.getActivities(
      isPaginate: isPaginate,
      page: page,
      perPage: perPage,
      search: search,
      sportCategoryId: sportCategoryId,
      cityId: cityId,
    );
  }
}
