import 'package:equatable/equatable.dart';
import 'sport_activities_entity.dart';

class TransactionItemsEntity extends Equatable {
  final int id;
  final int transactionId;
  final int sportActivityId;
  final String title;
  final int price;
  final int? priceDiscount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SportActivitiesEntity sportActivities;

  const TransactionItemsEntity({
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

  @override
  List<Object?> get props => [
    id,
    transactionId,
    sportActivityId,
    title,
    price,
    priceDiscount,
    createdAt,
    updatedAt,
    sportActivities,
  ];

  Map<String, dynamic> toJson() => {
    'id': id,
    'transaction_id': transactionId,
    'sport_activity_id': sportActivityId,
    'title': title,
    'price': price,
    'price_discount': priceDiscount,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
    'sport_activities': sportActivities.toJson(),
  };

  factory TransactionItemsEntity.fromJson(Map<String, dynamic> json) =>
      TransactionItemsEntity(
        id: json['id'],
        transactionId: json['transaction_id'],
        sportActivityId: json['sport_activity_id'],
        title: json['title'],
        price: json['price'],
        priceDiscount: json['price_discount'] as int?,
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        sportActivities: SportActivitiesEntity.fromJson(
          json['sport_activities'],
        ),
      );
}
