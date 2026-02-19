import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/authentication/domain/usecases/check_token_usecase.dart';
import 'package:sport_circle/features/authentication/domain/usecases/get_me_usecase.dart';

import 'authentication_event.dart';
import 'authentication_state.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GetMeUseCase _getMeUseCase;
  final CheckTokenUseCase _checkTokenUseCase;

  AuthenticationBloc(this._getMeUseCase, this._checkTokenUseCase)
    : super(AuthenticationInitial()) {
    on<AuthenticationFetchUser>(_onFetchUser);
    on<AuthenticationLogout>(_onLogout);
    on<AuthenticationCheckToken>(_onCheckToken);
    add(AuthenticationCheckToken()); // Trigger event otomatis saat bloc dibuat
  }

  Future<void> _onFetchUser(
    AuthenticationFetchUser event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());

    final result = await _getMeUseCase();

    result.fold(
      (failure) => emit(AuthenticationFailure(failure.message)),
      (user) => emit(AuthenticationLoaded(user)),
    );
  }

  Future<void> _onLogout(
    AuthenticationLogout event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoggedOut());
  }

  Future<void> _onCheckToken(
    AuthenticationCheckToken event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    final hasToken = await _checkTokenUseCase();
    if (hasToken) {
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationUnauthenticated());
    }
  }
}
