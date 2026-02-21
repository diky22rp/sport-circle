import 'package:sport_circle/features/location/domain/entities/city_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel {
  @JsonKey(name: 'city_id')
  final int cityId;
  @JsonKey(name: 'city_name')
  final String cityName;
  @JsonKey(name: 'province_id')
  final int provinceId;

  CityModel({
    required this.cityId,
    required this.cityName,
    required this.provinceId,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);
  Map<String, dynamic> toJson() => _$CityModelToJson(this);

  CityEntity toEntity() =>
      CityEntity(cityId: cityId, cityName: cityName, provinceId: provinceId);
}
