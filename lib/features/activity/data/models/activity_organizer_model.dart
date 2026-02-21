import 'package:json_annotation/json_annotation.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_organizer_entity.dart';

part 'activity_organizer_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ActivityOrganizerModel extends ActivityOrganizerEntity {
  const ActivityOrganizerModel({
    required super.id,
    required super.name,
    required super.email,
  });

  factory ActivityOrganizerModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityOrganizerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityOrganizerModelToJson(this);

  ActivityOrganizerEntity toEntity() {
    return ActivityOrganizerEntity(id: id, name: name, email: email);
  }

  factory ActivityOrganizerModel.fromEntity(ActivityOrganizerEntity entity) {
    return ActivityOrganizerModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
    );
  }
}
