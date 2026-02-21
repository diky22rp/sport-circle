import 'package:equatable/equatable.dart';

class ActivityProvinceEntity extends Equatable {
  final int provinceId;
  final String provinceName;

  const ActivityProvinceEntity({
    required this.provinceId,
    required this.provinceName,
  });

  @override
  List<Object?> get props => [provinceId, provinceName];
}
