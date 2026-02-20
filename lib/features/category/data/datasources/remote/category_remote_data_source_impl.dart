import 'package:injectable/injectable.dart';
import 'package:sport_circle/core/network/api_response_model.dart';
import 'package:sport_circle/features/authentication/data/datasources/local/auth_local_data_source.dart';
import 'package:sport_circle/features/category/data/datasources/category_api_client.dart';
import 'package:sport_circle/features/category/data/datasources/remote/category_remote_data_source.dart';
import 'package:sport_circle/features/category/data/models/category_model.dart';
import 'package:sport_circle/core/error/exceptions.dart';

@LazySingleton(as: CategoryRemoteDataSource)
class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final CategoryApiClient _apiClient;
  final AuthLocalDataSource _authLocalDataSource;

  CategoryRemoteDataSourceImpl(this._apiClient, this._authLocalDataSource);

  @override
  Future<ApiResponseModel<List<CategoryModel>>> getSportCategories() async {
    final token = await _authLocalDataSource.getToken();
    if (token == null) {
      throw UnauthenticatedException();
    }
    final response = await _apiClient.getSportCategories(token, false);
    return response;
  }
}
