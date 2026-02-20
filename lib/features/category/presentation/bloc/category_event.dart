import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_event.freezed.dart';

@freezed
sealed class CategoryEvent with _$CategoryEvent {
  const factory CategoryEvent.fetch({
    @Default(1) int page,
    @Default(5) int perPage,
  }) = FetchCategories;
}
