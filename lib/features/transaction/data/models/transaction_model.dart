import 'package:json_annotation/json_annotation.dart';
import 'package:sport_circle/features/transaction/domain/entities/transaction_entity.dart';
import 'transaction_items_model.dart';

part 'transaction_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class TransactionModel {
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
  final TransactionItemsModel transactionItems;

  const TransactionModel({
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

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);

  TransactionEntity toEntity() {
    return TransactionEntity(
      id: id,
      userId: userId,
      paymentMethodId: paymentMethodId,
      invoiceId: invoiceId,
      status: status,
      totalAmount: totalAmount,
      proofPaymentUrl: proofPaymentUrl,
      orderDate: orderDate,
      expiredDate: expiredDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
      transactionItems: transactionItems.toEntity(),
    );
  }
}
