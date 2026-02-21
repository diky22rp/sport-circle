import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';
import 'package:sport_circle/features/activity/domain/usecases/get_activities_usecase.dart';
import 'activity_event.dart';
import 'activity_state.dart';

@injectable
class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final GetActivitiesUsecase _getActivitiesUseCase;

  ActivityBloc(this._getActivitiesUseCase)
    : super(const ActivityState.initial()) {
    on<ActivityEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(const ActivityState.loading());
          final result = await _getActivitiesUseCase(page: 1, perPage: 10);

          log(
            'Fetched activities: ${result.fold((failure) => 'Failure: ${failure.message}', (activities) => 'Success: ${activities.length} activities')}',
          );
          result.fold(
            (failure) => emit(ActivityState.error(failure.message)),
            (activities) => emit(
              ActivityState.loaded(
                activities,
                hasReachedMax: activities.length < 10,
              ),
            ),
          );
        },
        fetchActivities:
            (page, perPage, search, sportCategoryId, cityId) async {
              final prevState = state;
              List<ActivityEntity> oldActivities = [];
              prevState.whenOrNull(
                loaded: (activities, hasReachedMax) {
                  oldActivities = activities;
                },
              );

              // Emit loading hanya jika page == 1
              if (page == 1) {
                emit(const ActivityState.loading());
              }

              final result = await _getActivitiesUseCase(
                page: page,
                perPage: perPage,
                search: search,
                sportCategoryId: sportCategoryId,
                cityId: cityId,
              );
              result.fold(
                (failure) => emit(ActivityState.error(failure.message)),
                (activities) {
                  final allActivities = page == 1
                      ? activities
                      : [...oldActivities, ...activities];
                  emit(
                    ActivityState.loaded(
                      allActivities,
                      hasReachedMax: activities.length < perPage,
                    ),
                  );
                },
              );
            },
        refresh: () async {
          emit(const ActivityState.loading());
          final result = await _getActivitiesUseCase(page: 1, perPage: 10);
          result.fold(
            (failure) => emit(ActivityState.error(failure.message)),
            (activities) => emit(
              ActivityState.loaded(
                activities,
                hasReachedMax: activities.length < 10,
              ),
            ),
          );
        },
      );
    });
  }
}
