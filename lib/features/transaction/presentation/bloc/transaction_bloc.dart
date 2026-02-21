import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_circle/features/transaction/domain/usecases/create_transaction_usecase.dart';
import 'package:sport_circle/features/transaction/domain/usecases/get_my_transactions_usecase.dart';
import 'package:sport_circle/features/transaction/domain/usecases/get_transaction_by_id_usecase.dart';
import 'package:sport_circle/features/transaction/domain/usecases/update_transaction_usecase.dart';
import 'package:sport_circle/features/transaction/domain/usecases/upload_proof_payment_usecase.dart';
import 'package:sport_circle/features/transaction/domain/usecases/cancel_transaction_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:sport_circle/features/activity/domain/usecases/get_activity_by_id_usecase.dart';

import 'transaction_event.dart';
import 'transaction_state.dart';

export 'transaction_event.dart';
export 'transaction_state.dart';

@injectable
class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final CreateTransactionUseCase createTransaction;
  final GetMyTransactionsUseCase getMyTransactions;
  final GetTransactionByIdUseCase getTransactionById;
  final GetActivityByIdUseCase getActivityById;
  final UpdateTransactionUseCase updateTransaction;
  final UploadProofPaymentUseCase uploadProofPayment;
  final CancelTransactionUseCase cancelTransaction;

  TransactionBloc({
    required this.createTransaction,
    required this.getMyTransactions,
    required this.getTransactionById,
    required this.getActivityById,
    required this.updateTransaction,
    required this.uploadProofPayment,
    required this.cancelTransaction,
  }) : super(const TransactionState.initial()) {
    on<TransactionEvent>((event, emit) async {
      await event.when(
        started: () async {
          emit(const TransactionState.loading());
          final result = await getMyTransactions(
            isPaginate: false,
            perPage: 10,
            page: 1,
          );
          result.fold(
            (failure) => emit(TransactionState.error(failure.toString())),
            (data) => emit(TransactionState.listLoaded(data)),
          );
        },
        fetchTransactions: (isPaginate, perPage, page) async {
          emit(const TransactionState.loading());
          final result = await getMyTransactions(
            isPaginate: isPaginate,
            perPage: perPage,
            page: page,
          );
          result.fold(
            (failure) => emit(TransactionState.error(failure.toString())),
            (data) => emit(TransactionState.listLoaded(data)),
          );
        },
        fetchTransactionById: (id) async {
          emit(const TransactionState.loading());
          final result = await getTransactionById(id: id);
          result.fold(
            (failure) => emit(TransactionState.error(failure.toString())),
            (data) => emit(TransactionState.loaded(data)),
          );
        },
        createTransaction: (slot, sportActivityId, paymentMethodId) async {
          emit(const TransactionState.loading());
          // Fetch activity detail first to check slot and participants
          final activityResult = await getActivityById(id: sportActivityId);
          if (activityResult.isLeft()) {
            final failure = activityResult.fold((f) => f, (_) => null);
            emit(
              TransactionState.error('Gagal cek slot: ${failure.toString()}'),
            );
            return;
          }
          final activity = activityResult.fold((_) => null, (a) => a);
          final totalSlot = activity?.slot ?? 0;
          final participantCount = activity?.participants.length ?? 0;
          final availableSlot = totalSlot - participantCount;
          if (availableSlot <= 0) {
            emit(TransactionState.error('Slot sudah penuh, tidak bisa join.'));
            return;
          }
          final result = await createTransaction(
            sportActivityId: sportActivityId,
            paymentMethodId: paymentMethodId,
          );
          if (result.isLeft()) {
            final failure = result.fold((f) => f, (_) => null);
            emit(TransactionState.error(failure.toString()));
          } else {
            emit(const TransactionState.success());
          }
        },
        updateTransaction: (id, status) async {
          emit(const TransactionState.loading());
          final result = await updateTransaction(id: id, status: status);
          result.fold(
            (failure) => emit(TransactionState.error(failure.toString())),
            (data) => emit(TransactionState.loaded(data)),
          );
        },
        uploadProofPayment: (id, proofPaymentUrl) async {
          emit(const TransactionState.loading());
          final result = await uploadProofPayment(
            id: id,
            proofPaymentUrl: proofPaymentUrl,
          );
          result.fold(
            (failure) => emit(TransactionState.error(failure.toString())),
            (_) => emit(const TransactionState.success()),
          );
        },
        cancelTransaction: (id) async {
          emit(const TransactionState.loading());
          final result = await cancelTransaction(id: id);
          result.fold(
            (failure) => emit(TransactionState.error(failure.toString())),
            (_) => emit(const TransactionState.success()),
          );
        },
        refresh: () async {
          emit(const TransactionState.loading());
          final result = await getMyTransactions(
            isPaginate: false,
            perPage: 10,
            page: 1,
          );
          result.fold(
            (failure) => emit(TransactionState.error(failure.toString())),
            (data) => emit(TransactionState.listLoaded(data)),
          );
        },
      );
    });
  }
}
