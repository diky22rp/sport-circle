import 'package:sport_circle/features/transaction/domain/entities/transaction_entity.dart';

class PaginatedTransactionEntity {
  final List<TransactionEntity> data;
  final int? currentPage;
  final int? lastPage;
  final int? perPage;
  final int? total;

  PaginatedTransactionEntity({
    required this.data,
    this.currentPage,
    this.lastPage,
    this.perPage,
    this.total,
  });

  factory PaginatedTransactionEntity.fromJson(Map<String, dynamic> json) {
    return PaginatedTransactionEntity(
      data: (json['data'] as List)
          .map((i) => TransactionEntity.fromJson(i))
          .toList(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );
  }
}
