// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityParticipantModel _$ActivityParticipantModelFromJson(
  Map<String, dynamic> json,
) => ActivityParticipantModel(
  id: (json['id'] as num).toInt(),
  sportActivityId: (json['sport_activity_id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  user: ActivityUserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ActivityParticipantModelToJson(
  ActivityParticipantModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'sport_activity_id': instance.sportActivityId,
  'user_id': instance.userId,
  'user': ActivityParticipantModel._userToJson(instance.user),
};
