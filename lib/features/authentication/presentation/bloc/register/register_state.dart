import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_circle/features/authentication/domain/entities/user_entity.dart';

part 'register_state.freezed.dart';

@freezed
sealed class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = _Initial;
  const factory RegisterState.loading() = _Loading;
  const factory RegisterState.success(UserEntity user) = _Success;
  const factory RegisterState.failure(String message) = _Failure;
}
