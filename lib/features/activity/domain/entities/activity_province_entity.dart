import 'package:equatable/equatable.dart';

class ActivityProvinceEntity extends Equatable {
  final int provinceId;
  final String provinceName;

  const ActivityProvinceEntity({
    required this.provinceId,
    required this.provinceName,
  });

  factory ActivityProvinceEntity.fromJson(Map<String, dynamic> json) {
    return ActivityProvinceEntity(
      provinceId: json['province_id'] ?? json['provinceId'],
      provinceName: json['province_name'] ?? json['provinceName'],
    );
  }

  Map<String, dynamic> toJson() => {
    'province_id': provinceId,
    'province_name': provinceName,
  };

  @override
  List<Object?> get props => [provinceId, provinceName];
}
