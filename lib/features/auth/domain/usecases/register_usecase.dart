import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/auth/domain/entities/user_entity.dart';
import 'package:sport_circle/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class RegisterUseCase {
  final AuthRepository _repository;
  RegisterUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call({
    required String name,
    required String email,
    required String password,
  }) {
    return _repository.register(name: name, email: email, password: password);
  }
}
