import 'package:equatable/equatable.dart';

class ActivityUserEntity extends Equatable {
  final int id;
  final String name;
  final String email;

  const ActivityUserEntity({
    required this.id,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [id, name, email];

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};

  factory ActivityUserEntity.fromJson(Map<String, dynamic> json) =>
      ActivityUserEntity(
        id: json['id'],
        name: json['name'],
        email: json['email'],
      );
}
