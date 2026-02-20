import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_event.freezed.dart';

@freezed
sealed class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.submitted({
    required String name,
    required String email,
    required String password,
    required String cPassword,
    @Default('user') String role,
    @Default('') String phoneNumber,
  }) = _Submitted;
}
