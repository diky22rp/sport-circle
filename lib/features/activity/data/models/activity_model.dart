import 'package:json_annotation/json_annotation.dart';
import 'package:sport_circle/features/activity/data/models/activity_user_model.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';
import 'activity_organizer_model.dart';
import 'activity_city_model.dart';
import 'activity_participant_model.dart';

part 'activity_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ActivityModel {
  final int id;
  final int sportCategoryId;
  final int cityId;
  final int userId;
  final String title;
  @JsonKey(defaultValue: 0)
  final int price;
  final int? priceDiscount; // nullable
  final int? slot; // nullable
  final String address;
  final String activityDate;
  final String startTime;
  final String endTime;
  final String createdAt;
  final String updatedAt;
  @JsonKey(fromJson: ActivityOrganizerModel.fromJson, toJson: _organizerToJson)
  final ActivityOrganizerModel organizer;
  @JsonKey(fromJson: ActivityCityModel.fromJson, toJson: _cityToJson)
  final ActivityCityModel city;
  final List<ActivityParticipantModel> participants;

  const ActivityModel({
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

  static Map<String, dynamic> _organizerToJson(
    ActivityOrganizerModel organizer,
  ) => organizer.toJson();
  static Map<String, dynamic> _cityToJson(ActivityCityModel city) =>
      city.toJson();

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);

  ActivityEntity toEntity() {
    return ActivityEntity(
      id: id,
      sportCategoryId: sportCategoryId,
      cityId: cityId,
      userId: userId,
      title: title,
      price: price,
      priceDiscount: priceDiscount,
      slot: slot,
      address: address,
      activityDate: activityDate,
      startTime: startTime,
      endTime: endTime,
      createdAt: createdAt,
      updatedAt: updatedAt,
      organizer: organizer.toEntity(),
      city: city.toEntity(),
      participants: participants.map((p) => p.toEntity()).toList(),
    );
  }

  factory ActivityModel.fromEntity(ActivityEntity entity) {
    return ActivityModel(
      id: entity.id,
      sportCategoryId: entity.sportCategoryId,
      cityId: entity.cityId,
      userId: entity.userId,
      title: entity.title,
      price: entity.price,
      priceDiscount: entity.priceDiscount,
      slot: entity.slot,
      address: entity.address,
      activityDate: entity.activityDate,
      startTime: entity.startTime,
      endTime: entity.endTime,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      organizer: ActivityOrganizerModel.fromEntity(entity.organizer),
      city: ActivityCityModel.fromEntity(entity.city),
      participants: entity.participants
          .map(
            (p) => ActivityParticipantModel(
              id: p.id,
              sportActivityId: p.sportActivityId,
              userId: p.userId,
              user: ActivityUserModel.fromEntity(p.user),
            ),
          )
          .toList(),
    );
  }
}
