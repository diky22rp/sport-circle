import 'package:json_annotation/json_annotation.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_city_entity.dart';
import 'activity_province_model.dart';

part 'activity_city_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ActivityCityModel extends ActivityCityEntity {
  final ActivityProvinceModel? province;

  const ActivityCityModel({
    required super.cityId,
    required super.provinceId,
    required super.cityName,
    required super.cityNameFull,
    required super.cityType,
    this.province,
  }) : super();

  factory ActivityCityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityCityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityCityModelToJson(this);

  ActivityCityEntity toEntity() {
    return ActivityCityEntity(
      cityId: cityId,
      provinceId: provinceId,
      cityName: cityName,
      cityNameFull: cityNameFull,
      cityType: cityType,
    );
  }

  factory ActivityCityModel.fromEntity(ActivityCityEntity entity) {
    return ActivityCityModel(
      cityId: entity.cityId,
      provinceId: entity.provinceId,
      cityName: entity.cityName,
      cityNameFull: entity.cityNameFull,
      cityType: entity.cityType,
      province: null,
    );
  }
}
