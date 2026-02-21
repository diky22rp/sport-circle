import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_event.freezed.dart';

@freezed
class TransactionEvent with _$TransactionEvent {
  const factory TransactionEvent.started() = _Started;
  const factory TransactionEvent.fetchTransactions({
    @Default(true) bool isPaginate,
    @Default(10) int perPage,
    @Default(1) int page,
  }) = _FetchTransactions;
  const factory TransactionEvent.fetchTransactionById(int id) =
      _FetchTransactionById;
  const factory TransactionEvent.createTransaction({
    required int slot,
    required int sportActivityId,
    required int paymentMethodId,
  }) = _CreateTransaction;
  const factory TransactionEvent.updateTransaction({
    required int id,
    required String status,
  }) = _UpdateTransaction;
  const factory TransactionEvent.uploadProofPayment({
    required int id,
    required String proofPaymentUrl,
  }) = _UploadProofPayment;
  const factory TransactionEvent.cancelTransaction(int id) = _CancelTransaction;
  const factory TransactionEvent.refresh() = _Refresh;
}
