// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      id: (json['id'] as num).toInt(),
      sportCategoryId: (json['sport_category_id'] as num).toInt(),
      cityId: (json['city_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num?)?.toInt() ?? 0,
      priceDiscount: (json['price_discount'] as num?)?.toInt(),
      slot: (json['slot'] as num?)?.toInt(),
      address: json['address'] as String,
      activityDate: json['activity_date'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      organizer: ActivityOrganizerModel.fromJson(
        json['organizer'] as Map<String, dynamic>,
      ),
      city: ActivityCityModel.fromJson(json['city'] as Map<String, dynamic>),
      participants: (json['participants'] as List<dynamic>)
          .map(
            (e) => ActivityParticipantModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sport_category_id': instance.sportCategoryId,
      'city_id': instance.cityId,
      'user_id': instance.userId,
      'title': instance.title,
      'price': instance.price,
      'price_discount': instance.priceDiscount,
      'slot': instance.slot,
      'address': instance.address,
      'activity_date': instance.activityDate,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'organizer': ActivityModel._organizerToJson(instance.organizer),
      'city': ActivityModel._cityToJson(instance.city),
      'participants': instance.participants.map((e) => e.toJson()).toList(),
    };
