import 'package:dartz/dartz.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/transaction/domain/entities/transaction_entity.dart';
import 'package:sport_circle/features/transaction/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateTransactionUseCase {
  final TransactionRepository repository;
  CreateTransactionUseCase(this.repository);

  Future<Either<Failure, TransactionEntity>> call({
    required int sportActivityId,
    required int paymentMethodId,
  }) {
    return repository.createTransaction(
      sportActivityId: sportActivityId,
      paymentMethodId: paymentMethodId,
    );
  }
}
