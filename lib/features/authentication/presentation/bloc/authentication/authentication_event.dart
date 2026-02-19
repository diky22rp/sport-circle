import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object?> get props => [];
}

class AuthenticationFetchUser extends AuthenticationEvent {}

class AuthenticationLogout extends AuthenticationEvent {}

class AuthenticationCheckToken extends AuthenticationEvent {}
