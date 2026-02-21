import 'package:equatable/equatable.dart';
import 'activity_user_entity.dart';

class ActivityParticipantEntity extends Equatable {
  final int id;
  final int sportActivityId;
  final int userId;
  final ActivityUserEntity user;

  const ActivityParticipantEntity({
    required this.id,
    required this.sportActivityId,
    required this.userId,
    required this.user,
  });

  @override
  List<Object?> get props => [id, sportActivityId, userId, user];

  Map<String, dynamic> toJson() => {
    'id': id,
    'sportActivityId': sportActivityId,
    'userId': userId,
    'user': user.toJson(),
  };

  factory ActivityParticipantEntity.fromJson(Map<String, dynamic> json) => ActivityParticipantEntity(
    id: json['id'],
    sportActivityId: json['sportActivityId'],
    userId: json['userId'],
    user: ActivityUserEntity.fromJson(json['user']),
  );
}
