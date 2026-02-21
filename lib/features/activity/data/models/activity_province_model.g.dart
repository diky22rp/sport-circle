// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_province_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityProvinceModel _$ActivityProvinceModelFromJson(
  Map<String, dynamic> json,
) => ActivityProvinceModel(
  provinceId: (json['province_id'] as num).toInt(),
  provinceName: json['province_name'] as String,
);

Map<String, dynamic> _$ActivityProvinceModelToJson(
  ActivityProvinceModel instance,
) => <String, dynamic>{
  'province_id': instance.provinceId,
  'province_name': instance.provinceName,
};
