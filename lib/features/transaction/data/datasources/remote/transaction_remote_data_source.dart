import 'package:sport_circle/features/transaction/domain/entities/paginated_transaction_entity.dart';
import 'package:sport_circle/features/transaction/data/models/transaction_model.dart';

abstract class TransactionRemoteDataSource {
  Future<PaginatedTransactionEntity> getTransactions({
    required String token,
    bool isPaginate = true,
    int perPage = 10,
    int page = 1,
  });

  Future<TransactionModel> getTransactionById({
    required String token,
    required int id,
  });

  Future<TransactionModel> createTransaction({
    required String token,
    required int sportActivityId,
    required int paymentMethodId,
  });

  Future<TransactionModel> updateTransaction({
    required String token,
    required int id,
    required String status,
  });

  Future<void> uploadProofPayment({
    required String token,
    required int id,
    required String proofPaymentUrl,
  });

  Future<void> cancelTransaction({required String token, required int id});
}
