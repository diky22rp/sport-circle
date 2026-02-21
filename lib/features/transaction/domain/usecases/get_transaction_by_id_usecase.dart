import 'package:dartz/dartz.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/transaction/domain/entities/transaction_entity.dart';
import 'package:sport_circle/features/transaction/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTransactionByIdUseCase {
  final TransactionRepository repository;
  GetTransactionByIdUseCase(this.repository);

  Future<Either<Failure, TransactionEntity>> call({required int id}) {
    return repository.getTransactionById(id: id);
  }
}
