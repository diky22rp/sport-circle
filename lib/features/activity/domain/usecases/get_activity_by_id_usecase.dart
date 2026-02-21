import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';
import 'package:sport_circle/features/activity/domain/repositories/activity_repository.dart';
import 'package:sport_circle/core/error/failures.dart';

@lazySingleton
class GetActivityByIdUseCase {
  final ActivityRepository repository;

  GetActivityByIdUseCase(this.repository);

  Future<Either<Failure, ActivityEntity>> call({required int id}) {
    return repository.getActivityById(id: id);
  }
}
