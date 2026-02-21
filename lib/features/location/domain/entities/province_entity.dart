import 'package:equatable/equatable.dart';

class ProvinceEntity extends Equatable {
  final int provinceId;
  final String provinceName;

  const ProvinceEntity({required this.provinceId, required this.provinceName});

  @override
  List<Object?> get props => [provinceId, provinceName];
}
