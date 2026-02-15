import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/auth/domain/usecases/register_usecase.dart';

import 'register_event.dart';
import 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc(this._registerUseCase) : super(RegisterInitial()) {
    on<RegisterSubmitted>(_onRegisterSubmitted);
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (event.name.trim().isEmpty ||
        event.email.trim().isEmpty ||
        event.password.trim().isEmpty) {
      emit(const RegisterFailure('Semua field harus diisi'));
      return;
    }

    emit(RegisterLoading());

    final result = await _registerUseCase(
      name: event.name,
      email: event.email,
      password: event.password,
    );

    result.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (user) => emit(RegisterSuccess(user)),
    );
  }
}
