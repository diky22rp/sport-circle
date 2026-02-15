import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/auth/domain/entities/user_entity.dart';
import 'package:sport_circle/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class GetMeUseCase {
  final AuthRepository _repository;
  GetMeUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call({required String token}) {
    return _repository.getMe(token: token);
  }
}
