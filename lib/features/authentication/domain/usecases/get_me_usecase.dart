import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/authentication/domain/entities/user_entity.dart';
import 'package:sport_circle/features/authentication/domain/repositories/auth_repository.dart';

@lazySingleton
class GetMeUseCase {
  final AuthRepository _repository;
  GetMeUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call() {
    return _repository.getMe(); // No token param
  }
}
