import 'package:json_annotation/json_annotation.dart';
import 'package:sport_circle/features/transaction/domain/entities/sport_activities_entity.dart';

part 'sport_activities_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class SportActivitiesModel {
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

  const SportActivitiesModel({
    required this.id,
    required this.sportCategoryId,
    required this.cityId,
    required this.userId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.priceDiscount,
    required this.slot,
    required this.address,
    required this.mapUrl,
    required this.activityDate,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SportActivitiesModel.fromJson(Map<String, dynamic> json) =>
      _$SportActivitiesModelFromJson(json);
  Map<String, dynamic> toJson() => _$SportActivitiesModelToJson(this);

  SportActivitiesEntity toEntity() {
    return SportActivitiesEntity(
      id: id,
      sportCategoryId: sportCategoryId,
      cityId: cityId,
      userId: userId,
      title: title,
      description: description,
      imageUrl: imageUrl,
      price: price,
      priceDiscount: priceDiscount,
      slot: slot,
      address: address,
      mapUrl: mapUrl,
      activityDate: activityDate,
      startTime: startTime,
      endTime: endTime,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
