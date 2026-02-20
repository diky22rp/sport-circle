import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/features/category/data/models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<ApiResponseModel<List<CategoryModel>>> getSportCategories();
}
