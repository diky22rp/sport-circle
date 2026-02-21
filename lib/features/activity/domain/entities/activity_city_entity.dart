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
}
