// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityCityModel _$ActivityCityModelFromJson(Map<String, dynamic> json) =>
    ActivityCityModel(
      cityId: (json['city_id'] as num).toInt(),
      provinceId: (json['province_id'] as num).toInt(),
      cityName: json['city_name'] as String,
      cityNameFull: json['city_name_full'] as String,
      cityType: json['city_type'] as String,
      province: json['province'] == null
          ? null
          : ActivityProvinceModel.fromJson(
              json['province'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ActivityCityModelToJson(ActivityCityModel instance) =>
    <String, dynamic>{
      'city_id': instance.cityId,
      'province_id': instance.provinceId,
      'city_name': instance.cityName,
      'city_name_full': instance.cityNameFull,
      'city_type': instance.cityType,
      'province': instance.province?.toJson(),
    };
