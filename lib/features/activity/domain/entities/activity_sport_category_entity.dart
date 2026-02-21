import 'package:equatable/equatable.dart';

class ActivitySportCategoryEntity extends Equatable {
  final int id;
  final String name;
  final String? createdAt;
  final String? updatedAt;

  const ActivitySportCategoryEntity({
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory ActivitySportCategoryEntity.fromJson(Map<String, dynamic> json) {
    return ActivitySportCategoryEntity(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  @override
  List<Object?> get props => [id, name, createdAt, updatedAt];
}
