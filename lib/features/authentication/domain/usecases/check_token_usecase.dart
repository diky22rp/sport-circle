import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/authentication/domain/repositories/auth_repository.dart';

@lazySingleton
class CheckTokenUseCase {
  final AuthRepository _repository;
  CheckTokenUseCase(this._repository);

  Future<bool> call() async {
    return await _repository.hasToken();
  }
}
