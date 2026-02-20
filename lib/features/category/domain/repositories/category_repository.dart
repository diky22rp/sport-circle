import 'package:dartz/dartz.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/features/category/data/models/category_model.dart';

abstract class CategoryRepository {
  Future<Either<Failure, ApiResponseModel<List<CategoryModel>>>>
  getSportCategories();
}
