import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/like/data/datasources/local/like_local_data_source.dart';
import 'package:sport_circle/features/activity/domain/entities/activity_entity.dart';

@injectable
class LikeCubit extends Cubit<Map<int, bool>> {
  final LikeLocalDataSource datasource;

  LikeCubit(this.datasource) : super({});

  Future<void> loadLikes() async {
    final likes = await datasource.loadLikes();
    emit(likes);
  }

  Future<void> toggleLike(ActivityEntity activity) async {
    final updated = Map<int, bool>.from(state);
    final isLiked = !(updated[activity.id] ?? false);
    updated[activity.id] = isLiked;
    await datasource.saveLikes(updated);
    if (isLiked) {
      await datasource.saveLikedActivity(activity);
    } else {
      await datasource.removeLikedActivity(activity.id);
    }
    emit(updated);
  }

  Future<List<ActivityEntity>> getLikedActivities() {
    return datasource.loadLikedActivities();
  }
}
