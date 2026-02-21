import 'package:json_annotation/json_annotation.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_province_entity.dart';

part 'activity_province_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ActivityProvinceModel {
  final int provinceId;
  final String provinceName;

  const ActivityProvinceModel({
    required this.provinceId,
    required this.provinceName,
  });

  factory ActivityProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityProvinceModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityProvinceModelToJson(this);

  ActivityProvinceEntity toEntity() {
    return ActivityProvinceEntity(
      provinceId: provinceId,
      provinceName: provinceName,
    );
  }

  factory ActivityProvinceModel.fromEntity(ActivityProvinceEntity entity) {
    return ActivityProvinceModel(
      provinceId: entity.provinceId,
      provinceName: entity.provinceName,
    );
  }
}
