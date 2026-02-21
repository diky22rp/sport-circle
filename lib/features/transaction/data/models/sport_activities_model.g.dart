// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sport_activities_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SportActivitiesModel _$SportActivitiesModelFromJson(
  Map<String, dynamic> json,
) => SportActivitiesModel(
  id: (json['id'] as num).toInt(),
  sportCategoryId: (json['sport_category_id'] as num).toInt(),
  cityId: (json['city_id'] as num).toInt(),
  userId: (json['user_id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String?,
  imageUrl: json['image_url'] as String?,
  price: (json['price'] as num).toInt(),
  priceDiscount: (json['price_discount'] as num?)?.toInt(),
  slot: (json['slot'] as num).toInt(),
  address: json['address'] as String,
  mapUrl: json['map_url'] as String,
  activityDate: json['activity_date'] as String,
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$SportActivitiesModelToJson(
  SportActivitiesModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'sport_category_id': instance.sportCategoryId,
  'city_id': instance.cityId,
  'user_id': instance.userId,
  'title': instance.title,
  'description': instance.description,
  'image_url': instance.imageUrl,
  'price': instance.price,
  'price_discount': instance.priceDiscount,
  'slot': instance.slot,
  'address': instance.address,
  'map_url': instance.mapUrl,
  'activity_date': instance.activityDate,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
};
