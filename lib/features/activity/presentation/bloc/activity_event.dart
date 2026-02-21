import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_event.freezed.dart';

@freezed
class ActivityEvent with _$ActivityEvent {
  const factory ActivityEvent.started() = _Started;
  const factory ActivityEvent.fetchActivities({
    @Default(1) int page,
    @Default(10) int perPage,
    String? search,
    int? sportCategoryId,
    int? cityId,
  }) = _FetchActivities;
  const factory ActivityEvent.refresh() = _Refresh;
}
