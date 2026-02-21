import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/location/domain/entities/city_entity.dart';
import 'package:sport_circle/features/location/domain/entities/province_entity.dart';
import 'package:sport_circle/features/location/domain/usecases/get_cities.dart';
import 'package:sport_circle/features/location/domain/usecases/get_provinces.dart';

class LocationState {
  final List<ProvinceEntity> provinces;
  final List<CityEntity> cities;
  final bool loading;
  final String? error;

  LocationState({
    this.provinces = const [],
    this.cities = const [],
    this.loading = false,
    this.error,
  });

  LocationState copyWith({
    List<ProvinceEntity>? provinces,
    List<CityEntity>? cities,
    bool? loading,
    String? error,
  }) {
    return LocationState(
      provinces: provinces ?? this.provinces,
      cities: cities ?? this.cities,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}

@injectable
class LocationCubit extends Cubit<LocationState> {
  final GetProvinces getProvinces;
  final GetCities getCities;
  final GetCitiesByProvince getCitiesByProvince;

  LocationCubit({
    required this.getProvinces,
    required this.getCities,
    required this.getCitiesByProvince,
  }) : super(LocationState());

  Future<void> fetchProvinces() async {
    print('[LocationCubit] fetchProvinces called');
    emit(state.copyWith(loading: true, error: null));
    final result = await getProvinces();
    result.fold(
      (failure) {
        print('[LocationCubit] fetchProvinces error: $failure');
        emit(state.copyWith(error: failure.toString(), loading: false));
      },
      (response) {
        print('[LocationCubit] fetchProvinces success: ${response.data}');
        emit(state.copyWith(provinces: response.data ?? [], loading: false));
      },
    );
  }

  Future<void> fetchCities() async {
    print('[LocationCubit] fetchCities called');
    emit(state.copyWith(loading: true, error: null));
    final result = await getCities();
    result.fold(
      (failure) {
        print('[LocationCubit] fetchCities error: $failure');
        emit(state.copyWith(error: failure.toString(), loading: false));
      },
      (response) {
        print('[LocationCubit] fetchCities success: ${response.data}');
        emit(state.copyWith(cities: response.data ?? [], loading: false));
      },
    );
  }

  Future<void> fetchCitiesByProvince(int provinceId) async {
    print('[LocationCubit] fetchCitiesByProvince called: $provinceId');
    emit(state.copyWith(loading: true, error: null));
    final result = await getCitiesByProvince(provinceId);
    result.fold(
      (failure) {
        print('[LocationCubit] fetchCitiesByProvince error: $failure');
        emit(state.copyWith(error: failure.toString(), loading: false));
      },
      (response) {
        print(
          '[LocationCubit] fetchCitiesByProvince success: ${response.data}',
        );
        emit(state.copyWith(cities: response.data ?? [], loading: false));
      },
    );
  }
}
