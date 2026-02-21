import 'package:sport_circle/features/location/domain/entities/province_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'province_model.g.dart';

@JsonSerializable()
class ProvinceModel {
  @JsonKey(name: 'province_id')
  final int provinceId;
  @JsonKey(name: 'province_name')
  final String provinceName;

  ProvinceModel({required this.provinceId, required this.provinceName});

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ProvinceModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProvinceModelToJson(this);

  ProvinceEntity toEntity() =>
      ProvinceEntity(provinceId: provinceId, provinceName: provinceName);
}
