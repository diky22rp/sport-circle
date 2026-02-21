import 'package:equatable/equatable.dart';

class ActivityCityEntity extends Equatable {
  final int cityId;
  final int provinceId;
  final String cityName;
  final String cityNameFull;
  final String cityType;

  const ActivityCityEntity({
    required this.cityId,
    required this.provinceId,
    required this.cityName,
    required this.cityNameFull,
    required this.cityType,
  });

  @override
  List<Object?> get props => [
    cityId,
    provinceId,
    cityName,
    cityNameFull,
    cityType,
  ];

  Map<String, dynamic> toJson() => {
    'cityId': cityId,
    'provinceId': provinceId,
    'cityName': cityName,
    'cityNameFull': cityNameFull,
    'cityType': cityType,
  };

  factory ActivityCityEntity.fromJson(Map<String, dynamic> json) => ActivityCityEntity(
    cityId: json['cityId'],
    provinceId: json['provinceId'],
    cityName: json['cityName'],
    cityNameFull: json['cityNameFull'],
    cityType: json['cityType'],
  );
}
