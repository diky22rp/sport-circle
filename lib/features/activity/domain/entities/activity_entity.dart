import 'package:equatable/equatable.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_city_entity.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_organizer_entity.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_participant_entity.dart';

class ActivityEntity extends Equatable {
  final int id;
  final int sportCategoryId;
  final int cityId;
  final int userId;
  final String title;
  final int price;
  final int? priceDiscount;
  final int? slot;
  final String address;
  final String activityDate;
  final String startTime;
  final String endTime;
  final String createdAt;
  final String updatedAt;
  final ActivityOrganizerEntity organizer;
  final ActivityCityEntity city;
  final List<ActivityParticipantEntity> participants;

  const ActivityEntity({
    required this.id,
    required this.sportCategoryId,
    required this.cityId,
    required this.userId,
    required this.title,
    required this.price,
    this.priceDiscount,
    this.slot,
    required this.address,
    required this.activityDate,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
    required this.organizer,
    required this.city,
    required this.participants,
  });

  @override
  List<Object?> get props => [
    id,
    sportCategoryId,
    cityId,
    userId,
    title,
    price,
    priceDiscount,
    slot,
    address,
    activityDate,
    startTime,
    endTime,
    createdAt,
    updatedAt,
    organizer,
    city,
    participants,
  ];
}
