import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/authentication/domain/usecases/login_usecase.dart';

import 'login_event.dart';
import 'login_state.dart';

export 'login_event.dart';
export 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        submitted: (email, password) async {
          emit(const LoginState.loading());

          final result = await loginUseCase(email: email, password: password);

          result.fold(
            (failure) => emit(LoginState.failure(failure.message)),
            (user) => emit(LoginState.success(user)),
          );
        },
      );
    });
  }
}
