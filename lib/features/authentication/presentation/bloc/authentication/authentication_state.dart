import 'package:equatable/equatable.dart';
import 'package:sport_circle/features/authentication/domain/entities/user_entity.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationLoaded extends AuthenticationState {
  final UserEntity user;
  const AuthenticationLoaded(this.user);
  @override
  List<Object?> get props => [user];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;
  const AuthenticationFailure(this.message);
  @override
  List<Object?> get props => [message];
}

class AuthenticationLoggedOut extends AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {}

class AuthenticationUnauthenticated extends AuthenticationState {}
