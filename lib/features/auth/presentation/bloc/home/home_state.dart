import 'package:equatable/equatable.dart';
import 'package:sport_circle/features/auth/domain/entities/user_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final UserEntity user;
  const HomeLoaded(this.user);
  @override
  List<Object?> get props => [user];
}

class HomeFailure extends HomeState {
  final String message;
  const HomeFailure(this.message);
  @override
  List<Object?> get props => [message];
}

class HomeLoggedOut extends HomeState {}
