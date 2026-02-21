import 'package:json_annotation/json_annotation.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_user_entity.dart';

part 'activity_user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ActivityUserModel extends ActivityUserEntity {
  const ActivityUserModel({
    required super.id,
    required super.name,
    required super.email,
  });

  factory ActivityUserModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityUserModelToJson(this);

  ActivityUserEntity toEntity() {
    return ActivityUserEntity(id: id, name: name, email: email);
  }

  factory ActivityUserModel.fromEntity(ActivityUserEntity entity) {
    return ActivityUserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
    );
  }
}
