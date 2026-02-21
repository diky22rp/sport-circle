import 'package:dartz/dartz.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/transaction/domain/entities/paginated_transaction_entity.dart';
import 'package:sport_circle/features/transaction/domain/entities/transaction_entity.dart';

abstract class TransactionRepository {
  Future<Either<Failure, TransactionEntity>> createTransaction({
    required int sportActivityId,
    required int paymentMethodId,
  });

  Future<Either<Failure, PaginatedTransactionEntity>> getMyTransactions({
    bool isPaginate,
    int perPage,
    int page,
  });

  Future<Either<Failure, TransactionEntity>> getTransactionById({
    required int id,
  });

  Future<Either<Failure, TransactionEntity>> updateTransaction({
    required int id,
    required String status,
  });

  Future<Either<Failure, void>> uploadProofPayment({
    required int id,
    required String proofPaymentUrl,
  });

  Future<Either<Failure, void>> cancelTransaction({required int id});
}
