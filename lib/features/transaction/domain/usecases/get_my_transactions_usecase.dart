import 'package:dartz/dartz.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/transaction/domain/entities/paginated_transaction_entity.dart';
import 'package:sport_circle/features/transaction/domain/repositories/transaction_repository.dart';

import 'package:injectable/injectable.dart';

@lazySingleton
class GetMyTransactionsUseCase {
  final TransactionRepository repository;
  GetMyTransactionsUseCase(this.repository);

  Future<Either<Failure, PaginatedTransactionEntity>> call({
    bool isPaginate = true,
    int perPage = 10,
    int page = 1,
  }) {
    return repository.getMyTransactions(
      isPaginate: isPaginate,
      perPage: perPage,
      page: page,
    );
  }
}
