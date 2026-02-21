import 'package:sport_circle/features/like/domain/repositories/like_repository.dart';

class ToggleLikeUseCase {
  final LikeRepository repository;

  ToggleLikeUseCase(this.repository);

  Future<Map<int, bool>> call(
    int activityId,
    Map<int, bool> currentLikes,
  ) async {
    final updated = Map<int, bool>.from(currentLikes);
    updated[activityId] = !(updated[activityId] ?? false);
    await repository.saveLikes(updated);
    return updated;
  }
}
