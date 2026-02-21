import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/transaction/data/datasources/remote/transaction_remote_data_source.dart';
import 'package:sport_circle/features/transaction/data/datasources/transaction_api_client.dart';
import 'package:sport_circle/features/transaction/domain/entities/paginated_transaction_entity.dart';
import 'package:sport_circle/features/transaction/data/models/transaction_model.dart';

@LazySingleton(as: TransactionRemoteDataSource)
class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final TransactionApiClient _apiClient;

  TransactionRemoteDataSourceImpl(this._apiClient);

  @override
  Future<PaginatedTransactionEntity> getTransactions({
    required String token,
    bool isPaginate = true,
    int perPage = 10,
    int page = 1,
  }) async {
    final response = await _apiClient.getMyTransactions(
      token: token,
      isPaginate: isPaginate,
      perPage: perPage,
      page: page,
    );

    final map = response.result as Map<String, dynamic>;
    final activitiesRaw = map['data'] as List;
    final List<TransactionModel> activities = activitiesRaw.map((item) {
      if (item is TransactionModel) {
        return item;
      } else if (item is Map<String, dynamic>) {
        return TransactionModel.fromJson(item);
      } else {
        throw Exception(
          'Unexpected item type in transaction data: \\${item.runtimeType}',
        );
      }
    }).toList();
    return PaginatedTransactionEntity(
      data: activities.map((e) => e.toEntity()).toList(),
      currentPage: map['current_page'] ?? 1,
      lastPage: map['last_page'] ?? 1,
      perPage: map['per_page'] ?? activities.length,
      total: map['total'] ?? activities.length,
    );
  }

  @override
  Future<TransactionModel> getTransactionById({
    required String token,
    required int id,
  }) async {
    final response = await _apiClient.getTransactionById(token: token, id: id);

    return TransactionModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<TransactionModel> createTransaction({
    required String token,
    required int sportActivityId,
    required int paymentMethodId,
  }) async {
    final response = await _apiClient.createTransaction(
      token: token,
      body: {
        'sport_activity_id': sportActivityId,
        'payment_method_id': paymentMethodId,
      },
    );
    final result = response.result;
    if (result is Map<String, dynamic>) {
      if (!result.containsKey('transaction_items') ||
          result['transaction_items'] == null) {
        result['transaction_items'] = {
          'id': 0,
          'transaction_id': 0,
          'sport_activity_id': 0,
          'title': '',
          'price': 0,
          'price_discount': 0,
          'created_at': DateTime.now().toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
          'sport_activities': {
            'id': 0,
            'sport_category_id': 0,
            'city_id': 0,
            'user_id': 0,
            'title': '',
            'description': '',
            'image_url': '',
            'price': 0,
            'price_discount': 0,
            'slot': 0,
            'address': '',
            'map_url': '',
            'activity_date': DateTime.now().toIso8601String(),
            'start_time': '',
            'end_time': '',
            'created_at': DateTime.now().toIso8601String(),
            'updated_at': DateTime.now().toIso8601String(),
            'city': {
              'city_id': 0,
              'province_id': 0,
              'city_name': '',
              'city_name_full': '',
              'city_type': '',
              'city_lat': 0.0,
              'city_lon': 0.0,
              'province': {
                'province_id': 0,
                'province_name': '',
                'province_name_abbr': '',
                'province_name_id': '',
                'province_name_en': '',
                'province_capital_city_id': 0,
                'iso_code': '',
                'iso_name': '',
                'iso_type': '',
                'iso_geounit': '',
                'timezone': 0,
                'province_lat': 0.0,
                'province_lon': 0.0,
              },
            },
            'organizer': {'id': 0, 'name': '', 'email': ''},
            'participants': [],
          },
        };
      }
      return TransactionModel.fromJson(result);
    } else {
      throw Exception(
        'Expected Map<String, dynamic> but got {result.runtimeType}',
      );
    }
  }

  @override
  Future<TransactionModel> updateTransaction({
    required String token,
    required int id,
    required String status,
  }) async {
    final response = await _apiClient.updateTransaction(
      token: token,
      id: id,
      body: {'status': status},
    );
    return TransactionModel.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<void> uploadProofPayment({
    required String token,
    required int id,
    required String proofPaymentUrl,
  }) async {
    await _apiClient.uploadProofPayment(
      token: token,
      id: id,
      body: {'proof_payment_url': proofPaymentUrl},
    );
  }

  @override
  Future<void> cancelTransaction({
    required String token,
    required int id,
  }) async {
    await _apiClient.cancelTransaction(token: token, id: id);
  }
}
