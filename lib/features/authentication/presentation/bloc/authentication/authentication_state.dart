import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_circle/features/authentication/domain/entities/user_entity.dart';

part 'authentication_state.freezed.dart';

@freezed
sealed class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = _Initial;
  const factory AuthenticationState.loading() = _Loading;
  const factory AuthenticationState.loaded(UserEntity user) = _Loaded;
  const factory AuthenticationState.failure(String message) = _Failure;
  const factory AuthenticationState.loggedOut() = _LoggedOut;
  const factory AuthenticationState.authenticated() = _Authenticated;
  const factory AuthenticationState.unauthenticated() = _Unauthenticated;
  const factory AuthenticationState.updateProfileLoading() =
      _UpdateProfileLoading;
  const factory AuthenticationState.updateProfileSuccess(UserEntity user) =
      _UpdateProfileSuccess;
  const factory AuthenticationState.updateProfileFailure(String message) =
      _UpdateProfileFailure;
}
