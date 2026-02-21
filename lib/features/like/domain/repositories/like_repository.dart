abstract class LikeRepository {
  Future<Map<int, bool>> loadLikes();
  Future<void> saveLikes(Map<int, bool> likes);
}