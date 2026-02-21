import 'package:equatable/equatable.dart';

class SportActivitiesEntity extends Equatable {
  final int id;
  final int sportCategoryId;
  final int cityId;
  final int userId;
  final String title;
  final String? description;
  final String? imageUrl;
  final int price;
  final int? priceDiscount;
  final int slot;
  final String address;
  final String mapUrl;
  final String activityDate;
  final String startTime;
  final String endTime;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SportActivitiesEntity({
    required this.id,
    required this.sportCategoryId,
    required this.cityId,
    required this.userId,
    required this.title,
    this.description,
    this.imageUrl,
    required this.price,
    this.priceDiscount,
    required this.slot,
    required this.address,
    required this.mapUrl,
    required this.activityDate,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    sportCategoryId,
    cityId,
    userId,
    title,
    description,
    imageUrl,
    price,
    priceDiscount,
    slot,
    address,
    mapUrl,
    activityDate,
    startTime,
    endTime,
    createdAt,
    updatedAt,
  ];

  Map<String, dynamic> toJson() => {
    'id': id,
    'sport_category_id': sportCategoryId,
    'city_id': cityId,
    'user_id': userId,
    'title': title,
    'description': description,
    'image_url': imageUrl,
    'price': price,
    'price_discount': priceDiscount,
    'slot': slot,
    'address': address,
    'map_url': mapUrl,
    'activity_date': activityDate,
    'start_time': startTime,
    'end_time': endTime,
    'created_at': createdAt.toIso8601String(),
    'updated_at': updatedAt.toIso8601String(),
  };

  factory SportActivitiesEntity.fromJson(Map<String, dynamic> json) =>
      SportActivitiesEntity(
        id: json['id'],
        sportCategoryId: json['sport_category_id'],
        cityId: json['city_id'],
        userId: json['user_id'],
        title: json['title'],
        description: json['description'] as String?,
        imageUrl: json['image_url'] as String?,
        price: json['price'],
        priceDiscount: json['price_discount'] as int?,
        slot: json['slot'],
        address: json['address'],
        mapUrl: json['map_url'],
        activityDate: json['activity_date'],
        startTime: json['start_time'],
        endTime: json['end_time'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );
}
