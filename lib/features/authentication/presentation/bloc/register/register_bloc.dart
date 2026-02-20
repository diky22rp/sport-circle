import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/authentication/domain/usecases/register_usecase.dart';

import 'register_event.dart';
import 'register_state.dart';

export 'register_event.dart';
export 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc(this._registerUseCase) : super(const RegisterState.initial()) {
    on<RegisterEvent>((event, emit) async {
      await event.when(
        submitted: (name, email, password, cPassword, role, phoneNumber) async {
          emit(const RegisterState.loading());
          final result = await _registerUseCase(
            name: name,
            email: email,
            password: password,
            cPassword: cPassword,
            role: role,
            phoneNumber: phoneNumber,
          );
          result.fold(
            (failure) => emit(RegisterState.failure(failure.message)),
            (user) => emit(RegisterState.success(user)),
          );
        },
      );
    });
  }
}
