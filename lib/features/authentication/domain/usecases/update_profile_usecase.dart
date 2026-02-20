import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/authentication/domain/entities/user_entity.dart';
import 'package:sport_circle/features/authentication/domain/repositories/auth_repository.dart';

@lazySingleton
class UpdateProfileUseCase {
  final AuthRepository _repository;
  UpdateProfileUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call({
    required String email,
    required String name,
    required String phoneNumber,
    required String password,
    required String cPassword,
  }) {
    return _repository.updateProfile(
      email: email,
      name: name,
      phoneNumber: phoneNumber,
      password: password,
      cPassword: cPassword,
    );
  }
}
