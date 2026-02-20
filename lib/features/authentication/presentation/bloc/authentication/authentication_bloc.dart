import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/authentication/domain/usecases/check_token_usecase.dart';
import 'package:sport_circle/features/authentication/domain/usecases/get_me_usecase.dart';
import 'package:sport_circle/features/authentication/domain/usecases/update_profile_usecase.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

export 'authentication_event.dart';
export 'authentication_state.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GetMeUseCase _getMeUseCase;
  final CheckTokenUseCase _checkTokenUseCase;
  final UpdateProfileUseCase _updateProfileUseCase;

  AuthenticationBloc(
    this._getMeUseCase,
    this._checkTokenUseCase,
    this._updateProfileUseCase,
  ) : super(const AuthenticationState.initial()) {
    on<AuthenticationEvent>((event, emit) async {
      await event.when(
        fetchUser: () async {
          emit(const AuthenticationState.loading());
          final result = await _getMeUseCase();
          result.fold(
            (failure) => emit(AuthenticationState.failure(failure.message)),
            (user) => emit(AuthenticationState.loaded(user)),
          );
        },
        logout: () async {
          emit(const AuthenticationState.loading());
          emit(const AuthenticationState.unauthenticated());
          emit(const AuthenticationState.loggedOut());
        },
        checkToken: () async {
          emit(const AuthenticationState.loading());
          final hasToken = await _checkTokenUseCase();
          if (hasToken) {
            emit(const AuthenticationState.authenticated());
          } else {
            emit(const AuthenticationState.unauthenticated());
          }
        },
        updateProfile: (name, email, phoneNumber, password, cPassword) async {
          emit(const AuthenticationState.updateProfileLoading());
          final result = await _updateProfileUseCase(
            name: name,
            email: email,
            phoneNumber: phoneNumber ?? '',
            password: password ?? '',
            cPassword: cPassword ?? '',
          );
          result.fold(
            (failure) =>
                emit(AuthenticationState.updateProfileFailure(failure.message)),
            (user) => emit(AuthenticationState.updateProfileSuccess(user)),
          );
        },
      );
    });
    add(const AuthenticationEvent.checkToken());
  }
}
