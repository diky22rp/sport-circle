import 'package:sport_circle/features/like/data/datasources/local/like_local_data_source.dart';
import 'package:sport_circle/features/like/domain/repositories/like_repository.dart';

class LikeRepositoryImpl implements LikeRepository {
  final LikeLocalDataSource datasource;

  LikeRepositoryImpl(this.datasource);

  @override
  Future<Map<int, bool>> loadLikes() => datasource.loadLikes();

  @override
  Future<void> saveLikes(Map<int, bool> likes) => datasource.saveLikes(likes);
}
