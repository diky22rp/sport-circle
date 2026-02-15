import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? role;
  final String? phoneNumber;
  final String? token;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    this.role,
    this.phoneNumber,
    this.token,
  });

  @override
  List<Object?> get props => [id, name, email, role, phoneNumber, token];
}
