import 'package:dartz/dartz.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/transaction/domain/entities/transaction_entity.dart';
import 'package:sport_circle/features/transaction/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateTransactionUseCase {
  final TransactionRepository repository;
  UpdateTransactionUseCase(this.repository);

  Future<Either<Failure, TransactionEntity>> call({
    required int id,
    required String status,
  }) {
    return repository.updateTransaction(id: id, status: status);
  }
}
