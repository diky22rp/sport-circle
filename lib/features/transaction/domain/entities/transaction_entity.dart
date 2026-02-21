import 'package:equatable/equatable.dart';

import 'package:sport_circle/features/transaction/domain/entities/transaction_items_entity.dart';

class TransactionEntity extends Equatable {
  final int id;
  final int userId;
  final int paymentMethodId;
  final String invoiceId;
  final String status;
  final int totalAmount;
  final String? proofPaymentUrl;
  final String orderDate;
  final String expiredDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final TransactionItemsEntity transactionItems;

  const TransactionEntity({
    required this.id,
    required this.userId,
    required this.paymentMethodId,
    required this.invoiceId,
    required this.status,
    required this.totalAmount,
    this.proofPaymentUrl,
    required this.orderDate,
    required this.expiredDate,
    required this.createdAt,
    required this.updatedAt,
    required this.transactionItems,
  });

  @override
  List<Object?> get props => [
    id,
    userId,
    paymentMethodId,
    invoiceId,
    status,
    totalAmount,
    proofPaymentUrl,
    orderDate,
    expiredDate,
    createdAt,
    updatedAt,
    transactionItems,
  ];

  // Convert object to Map<String, dynamic>
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'payment_method_id': paymentMethodId,
      'invoice_id': invoiceId,
      'status': status,
      'total_amount': totalAmount,
      'proof_payment_url': proofPaymentUrl,
      'order_date': orderDate,
      'expired_date': expiredDate,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'transaction_items': transactionItems.toJson(),
    };
  }

  // Create object from Map<String, dynamic>
  factory TransactionEntity.fromJson(Map<String, dynamic> json) {
    return TransactionEntity(
      id: json['id'],
      userId: json['user_id'],
      paymentMethodId: json['payment_method_id'],
      invoiceId: json['invoice_id'],
      status: json['status'],
      totalAmount: json['total_amount'],
      proofPaymentUrl: json['proof_payment_url'] as String?,
      orderDate: json['order_date'],
      expiredDate: json['expired_date'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      transactionItems: TransactionItemsEntity.fromJson(
        json['transaction_items'],
      ),
    );
  }
}
