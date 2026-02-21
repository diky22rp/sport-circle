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

  // Convert object to Map<String, dynamic>
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sportCategoryId': sportCategoryId,
      'cityId': cityId,
      'userId': userId,
      'title': title,
      'price': price,
      'priceDiscount': priceDiscount,
      'slot': slot,
      'address': address,
      'activityDate': activityDate,
      'startTime': startTime,
      'endTime': endTime,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'organizer': organizer.toJson(), // Pastikan organizer punya toJson()
      'city': city.toJson(),           // Pastikan city punya toJson()
      'participants': participants.map((e) => e.toJson()).toList(), // Pastikan participant punya toJson()
    };
  }

  // Create object from Map<String, dynamic>
  factory ActivityEntity.fromJson(Map<String, dynamic> json) {
    return ActivityEntity(
      id: json['id'],
      sportCategoryId: json['sportCategoryId'],
      cityId: json['cityId'],
      userId: json['userId'],
      title: json['title'],
      price: json['price'],
      priceDiscount: json['priceDiscount'],
      slot: json['slot'],
      address: json['address'],
      activityDate: json['activityDate'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      organizer: ActivityOrganizerEntity.fromJson(json['organizer']),
      city: ActivityCityEntity.fromJson(json['city']),
      participants: (json['participants'] as List<dynamic>)
          .map((e) => ActivityParticipantEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

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
