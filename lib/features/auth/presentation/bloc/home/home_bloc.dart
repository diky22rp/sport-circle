import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/storage/token_storage.dart';
import 'package:sport_circle/features/auth/domain/usecases/get_me_usecase.dart';

import 'home_event.dart';
import 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetMeUseCase _getMeUseCase;
  final TokenStorage _tokenStorage;

  HomeBloc(this._getMeUseCase, this._tokenStorage) : super(HomeInitial()) {
    on<HomeFetchUser>(_onFetchUser);
    on<HomeLogout>(_onLogout);
  }

  Future<void> _onFetchUser(
    HomeFetchUser event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());

    final token = await _tokenStorage.getToken();
    if (token == null || token.isEmpty) {
      emit(const HomeFailure('Token tidak ditemukan, silakan login ulang'));
      return;
    }

    final result = await _getMeUseCase(token: token);

    result.fold(
      (failure) => emit(HomeFailure(failure.message)),
      (user) => emit(HomeLoaded(user)),
    );
  }

  Future<void> _onLogout(HomeLogout event, Emitter<HomeState> emit) async {
    await _tokenStorage.deleteToken();
    emit(HomeLoggedOut());
  }
}
