import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_circle/features/category/data/models/category_model.dart';

part 'category_state.freezed.dart';

@freezed
sealed class CategoryState with _$CategoryState {
  const factory CategoryState.initial() = CategoryInitial;
  const factory CategoryState.loading() = CategoryLoading;
  const factory CategoryState.loaded(
    List<CategoryModel> categories, {
    @Default(false) bool hasReachedMax,
    @Default(1) int currentPage,
  }) = CategoryLoaded;
  const factory CategoryState.error(String message) = CategoryError;
  const factory CategoryState.unauthenticated() = CategoryUnauthenticated;
}
