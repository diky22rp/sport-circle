import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_circle/core/presentation/widgets/app_snackbar.dart';
import 'package:sport_circle/features/transaction/domain/entities/transaction_entity.dart';
import 'package:sport_circle/features/transaction/domain/entities/paginated_transaction_entity.dart';
import 'package:sport_circle/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'widgets/transaction_card.dart';
import 'widgets/transaction_detail_modal.dart';

class MyTransactionsPage extends StatefulWidget {
  const MyTransactionsPage({super.key});

  @override
  State<MyTransactionsPage> createState() => _MyTransactionsPageState();
}

class _MyTransactionsPageState extends State<MyTransactionsPage> {
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasReachedMax = false;
  List<TransactionEntity> _transactions = [];

  @override
  void initState() {
    super.initState();
    context.read<TransactionBloc>().add(
      const TransactionEvent.fetchTransactions(),
    );
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !_isLoadingMore &&
        !_hasReachedMax) {
      _isLoadingMore = true;
      context.read<TransactionBloc>().add(
        TransactionEvent.fetchTransactions(page: _currentPage + 1),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Transactions')),
      body: BlocConsumer<TransactionBloc, TransactionState>(
        listener: (context, state) {
          state.maybeWhen(
            listLoaded: (PaginatedTransactionEntity data) {
              _currentPage = data.currentPage ?? 1;
              _hasReachedMax =
                  (data.currentPage ?? 1) >= (data.lastPage ?? 1) ||
                  data.data.isEmpty;
              if (_currentPage == 1) {
                _transactions = data.data;
              } else {
                _transactions.addAll(data.data);
              }
              _isLoadingMore = false;
            },
            success: () {
              context.read<TransactionBloc>().add(
                const TransactionEvent.fetchTransactions(),
              );
              AppSnackbar.show(
                context,
                message: 'Transaksi berhasil dibatalkan.',
                type: AppSnackbarType.success,
              );
            },
            error: (msg) {
              _isLoadingMore = false;
              AppSnackbar.show(
                context,
                message: msg,
                type: AppSnackbarType.error,
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => _transactions.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : _buildListView(),
            listLoaded: (_) => _buildListView(),
            loaded: (_) => _buildListView(),
            success: () => _buildListView(),
            error: (msg) => Center(child: Text(msg)),
          );
        },
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _transactions.length + (_hasReachedMax ? 0 : 1),
      itemBuilder: (context, index) {
        if (index >= _transactions.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final tx = _transactions[index];
        return TransactionCard(
          tx: tx,
          onTap: () => _showTransactionDetail(context, tx),
          onUploadProof: () => _onUploadProof(context, tx),
          onCancel: () => _onCancel(context, tx),
        );
      },
    );
  }

  void _showTransactionDetail(BuildContext context, TransactionEntity tx) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => TransactionDetailModal(
        tx: tx,
        onUploadProof: () => _onUploadProof(context, tx),
        onCancel: () => _onCancel(context, tx),
      ),
    );
  }

  void _onUploadProof(BuildContext context, TransactionEntity tx) async {
    AppSnackbar.show(
      context,
      message: 'Fitur upload bukti coming soon!',
      type: AppSnackbarType.info,
    );
  }

  void _onCancel(BuildContext context, TransactionEntity tx) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Batalkan Transaksi?'),
        content: const Text(
          'Apakah Anda yakin ingin membatalkan transaksi ini?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Tidak'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Ya, Batalkan'),
          ),
        ],
      ),
    );
    if (!mounted) return;
    if (confirm == true) {
      context.read<TransactionBloc>().add(
        TransactionEvent.cancelTransaction(tx.id),
      );
    }
  }
}
