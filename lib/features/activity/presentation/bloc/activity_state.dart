import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';

part 'activity_state.freezed.dart';

@freezed
class ActivityState with _$ActivityState {
  const factory ActivityState.initial() = _Initial;
  const factory ActivityState.loading() = _Loading;
  const factory ActivityState.loaded(
    List<ActivityEntity> activities, {
    @Default(false) bool hasReachedMax,
  }) = _Loaded;
  const factory ActivityState.error(String message) = _Error;
}
