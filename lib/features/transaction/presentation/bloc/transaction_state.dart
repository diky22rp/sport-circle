import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_circle/features/transaction/domain/entities/transaction_entity.dart';
import 'package:sport_circle/features/transaction/domain/entities/paginated_transaction_entity.dart';

part 'transaction_state.freezed.dart';

@freezed
class TransactionState with _$TransactionState {
  const factory TransactionState.initial() = _Initial;
  const factory TransactionState.loading() = _Loading;
  const factory TransactionState.listLoaded(PaginatedTransactionEntity data) =
      _ListLoaded;
  const factory TransactionState.loaded(TransactionEntity transaction) =
      _Loaded;
  const factory TransactionState.success() = _Success;
  const factory TransactionState.error(String message) = _Error;
}
