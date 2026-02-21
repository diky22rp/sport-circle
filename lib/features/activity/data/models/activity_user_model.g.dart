// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityUserModel _$ActivityUserModelFromJson(Map<String, dynamic> json) =>
    ActivityUserModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$ActivityUserModelToJson(ActivityUserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
