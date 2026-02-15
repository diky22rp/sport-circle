import 'package:sport_circle/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String id,
    required String name,
    required String email,
    String? role,
    String? phoneNumber,
    String? token,
  }) : super(
         id: id,
         name: name,
         email: email,
         role: role,
         phoneNumber: phoneNumber,
         token: token,
       );

  factory UserModel.fromJson(Map<String, dynamic> json, {String? token}) {
    return UserModel(
      id: (json['id'] ?? '').toString(),
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'],
      phoneNumber: json['phone_number']?.toString(),
      token: token ?? json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'phone_number': phoneNumber,
      'token': token,
    };
  }
}
