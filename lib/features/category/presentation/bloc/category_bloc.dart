import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/error/exceptions.dart';
import 'package:sport_circle/features/authentication/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:sport_circle/features/category/domain/usecases/get_sport_categories.dart';

import 'category_event.dart';
import 'category_state.dart';

export 'category_event.dart';
export 'category_state.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetSportCategories getSportCategories;
  final AuthenticationBloc authenticationBloc;

  CategoryBloc(this.getSportCategories, this.authenticationBloc)
    : super(const CategoryState.initial()) {
    on<CategoryEvent>((event, emit) async {
      await event.when(
        fetch: (page, perPage) async {
          emit(const CategoryState.loading());
          try {
            final result = await getSportCategories();
            result.fold(
              (failure) => emit(CategoryState.error(failure.toString())),
              (response) {
                final categories = response.payload ?? [];
                emit(CategoryState.loaded(categories));
              },
            );
          } on UnauthenticatedException {
            authenticationBloc.add(const AuthenticationEvent.logout());
            emit(const CategoryState.unauthenticated());
          } catch (e) {
            emit(CategoryState.error(e.toString()));
          }
        },
      );
    });
  }
}
