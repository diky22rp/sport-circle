import 'package:sport_circle/features/transaction/data/models/transaction_model.dart';

class PaginatedTransactionModel {
  final List<TransactionModel> transactions;
  final int currentPage;
  final int lastPage;
  final String? nextPageUrl;

  PaginatedTransactionModel({
    required this.transactions,
    required this.currentPage,
    required this.lastPage,
    required this.nextPageUrl,
  });

  factory PaginatedTransactionModel.fromJson(Map<String, dynamic> json) {
    final result = json['result'] as Map<String, dynamic>;
    final data = result['data'] as List<dynamic>;
    return PaginatedTransactionModel(
      transactions: data.map((e) => TransactionModel.fromJson(e)).toList(),
      currentPage: result['current_page'] ?? 1,
      lastPage: result['last_page'] ?? 1,
      nextPageUrl: result['next_page_url'],
    );
  }
}
