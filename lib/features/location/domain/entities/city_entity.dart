import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final int cityId;
  final String cityName;
  final int provinceId;

  const CityEntity({
    required this.cityId,
    required this.cityName,
    required this.provinceId,
  });

  @override
  List<Object?> get props => [cityId, cityName, provinceId];
}
