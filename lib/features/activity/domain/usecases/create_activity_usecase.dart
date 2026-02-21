import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/activity/domain/repositories/activity_repository.dart';

@lazySingleton
class CreateActivityUseCase {
  final ActivityRepository repository;

  CreateActivityUseCase(this.repository);

  Future<Either<Failure, ActivityEntity>> call({
    required String name,
    required String description,
    required int sportCategoryId,
    required int cityId,
    required String imageUrl,
  }) async {
    return await repository.createActivity(
      name: name,
      description: description,
      sportCategoryId: sportCategoryId,
      cityId: cityId,
      imageUrl: imageUrl,
    );
  }
}
