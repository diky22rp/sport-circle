import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/auth/domain/usecases/login_usecase.dart';

import 'login_event.dart';
import 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc(this._loginUseCase) : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (event.email.trim().isEmpty || event.password.trim().isEmpty) {
      emit(const LoginFailure('Email dan password tidak boleh kosong'));
      return;
    }

    emit(LoginLoading());

    final result = await _loginUseCase(
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }
}
