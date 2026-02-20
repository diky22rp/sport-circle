import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/core/utils/dio_failure_mapper.dart';
import 'package:sport_circle/features/category/data/datasources/remote/category_remote_data_source.dart';
import 'package:sport_circle/features/category/data/models/category_model.dart';
import 'package:sport_circle/features/category/domain/repositories/category_repository.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource _remoteDataSource;

  CategoryRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, ApiResponseModel<List<CategoryModel>>>>
  getSportCategories() async {
    try {
      final response = await _remoteDataSource.getSportCategories();
      return Right(response);
    } on DioException catch (e) {
      return Left(mapDioToFailure(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
