import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class HomeFetchUser extends HomeEvent {}

class HomeLogout extends HomeEvent {}
