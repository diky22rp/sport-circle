import 'package:json_annotation/json_annotation.dart';
import 'package:sport_circle/features/transaction/domain/entities/transaction_items_entity.dart';
import 'sport_activities_model.dart';

part 'transaction_items_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class TransactionItemsModel {
  final int id;
  final int transactionId;
  final int sportActivityId;
  final String title;
  final int price;
  final int? priceDiscount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SportActivitiesModel sportActivities;

  const TransactionItemsModel({
    required this.id,
    required this.transactionId,
    required this.sportActivityId,
    required this.title,
    required this.price,
    this.priceDiscount,
    required this.createdAt,
    required this.updatedAt,
    required this.sportActivities,
  });

  factory TransactionItemsModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionItemsModelFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionItemsModelToJson(this);

  TransactionItemsEntity toEntity() {
    return TransactionItemsEntity(
      id: id,
      transactionId: transactionId,
      sportActivityId: sportActivityId,
      title: title,
      price: price,
      priceDiscount: priceDiscount,
      createdAt: createdAt,
      updatedAt: updatedAt,
      sportActivities: sportActivities.toEntity(),
    );
  }
}
