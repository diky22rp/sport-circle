// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
  cityId: (json['city_id'] as num).toInt(),
  cityName: json['city_name'] as String,
  provinceId: (json['province_id'] as num).toInt(),
);

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
  'city_id': instance.cityId,
  'city_name': instance.cityName,
  'province_id': instance.provinceId,
};
