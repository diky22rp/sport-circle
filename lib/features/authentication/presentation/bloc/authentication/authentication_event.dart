import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_event.freezed.dart';

@freezed
sealed class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.fetchUser() = _FetchUser;
  const factory AuthenticationEvent.logout() = _Logout;
  const factory AuthenticationEvent.checkToken() = _CheckToken;
}
