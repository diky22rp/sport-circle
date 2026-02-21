import 'package:json_annotation/json_annotation.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_participant_entity.dart';
import 'activity_user_model.dart';

part 'activity_participant_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ActivityParticipantModel {
  final int id;
  final int sportActivityId;
  final int userId;
  @JsonKey(fromJson: ActivityUserModel.fromJson, toJson: _userToJson)
  final ActivityUserModel user;

  const ActivityParticipantModel({
    required this.id,
    required this.sportActivityId,
    required this.userId,
    required this.user,
  });

  static Map<String, dynamic> _userToJson(ActivityUserModel user) =>
      user.toJson();

  factory ActivityParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityParticipantModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityParticipantModelToJson(this);

  ActivityParticipantEntity toEntity() {
    return ActivityParticipantEntity(
      id: id,
      sportActivityId: sportActivityId,
      userId: userId,
      user: user.toEntity(),
    );
  }

  factory ActivityParticipantModel.fromEntity(
    ActivityParticipantEntity entity,
  ) {
    return ActivityParticipantModel(
      id: entity.id,
      sportActivityId: entity.sportActivityId,
      userId: entity.userId,
      user: ActivityUserModel.fromEntity(entity.user),
    );
  }
}
