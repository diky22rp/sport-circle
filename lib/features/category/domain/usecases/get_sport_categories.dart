import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/category/domain/repositories/category_repository.dart';
import 'package:sport_circle/features/category/data/models/category_model.dart';
import 'package:sport_circle/core/network/api_response_model.dart';

@lazySingleton
class GetSportCategories {
  final CategoryRepository repository;
  GetSportCategories(this.repository);

  Future<Either<Failure, ApiResponseModel<List<CategoryModel>>>> call() async {
    return repository.getSportCategories();
  }
}
