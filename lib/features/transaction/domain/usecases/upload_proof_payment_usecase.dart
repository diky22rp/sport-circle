import 'package:dartz/dartz.dart';
import 'package:sport_circle/core/error/failures.dart';
import 'package:sport_circle/features/transaction/domain/repositories/transaction_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UploadProofPaymentUseCase {
  final TransactionRepository repository;
  UploadProofPaymentUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required int id,
    required String proofPaymentUrl,
  }) {
    return repository.uploadProofPayment(
      id: id,
      proofPaymentUrl: proofPaymentUrl,
    );
  }
}
