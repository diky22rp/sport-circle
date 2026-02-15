import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
  @override
  List<Object?> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String cPassword;
  final String role;
  final String phoneNumber;
  const RegisterSubmitted({
    required this.name,
    required this.email,
    required this.password,
    required this.cPassword,
    this.role = 'user',
    this.phoneNumber = '',
  });
  @override
  List<Object?> get props => [
    name,
    email,
    password,
    cPassword,
    role,
    phoneNumber,
  ];
}
