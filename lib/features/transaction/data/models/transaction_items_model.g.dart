// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_items_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionItemsModel _$TransactionItemsModelFromJson(
  Map<String, dynamic> json,
) => TransactionItemsModel(
  id: (json['id'] as num).toInt(),
  transactionId: (json['transaction_id'] as num).toInt(),
  sportActivityId: (json['sport_activity_id'] as num).toInt(),
  title: json['title'] as String,
  price: (json['price'] as num).toInt(),
  priceDiscount: (json['price_discount'] as num?)?.toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  sportActivities: SportActivitiesModel.fromJson(
    json['sport_activities'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$TransactionItemsModelToJson(
  TransactionItemsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'transaction_id': instance.transactionId,
  'sport_activity_id': instance.sportActivityId,
  'title': instance.title,
  'price': instance.price,
  'price_discount': instance.priceDiscount,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'sport_activities': instance.sportActivities.toJson(),
};
