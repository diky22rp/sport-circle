// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_organizer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityOrganizerModel _$ActivityOrganizerModelFromJson(
  Map<String, dynamic> json,
) => ActivityOrganizerModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
);

Map<String, dynamic> _$ActivityOrganizerModelToJson(
  ActivityOrganizerModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'email': instance.email,
};
