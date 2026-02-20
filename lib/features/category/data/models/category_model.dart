import 'package:json_annotation/json_annotation.dart';
import 'package:sport_circle/features/category/domain/entities/category_entity.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends CategoryEntity {
  const CategoryModel({required super.id, required super.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final normalized = Map<String, dynamic>.from(json);
    normalized['id'] = (normalized['id'] != null)
        ? normalized['id'].toString()
        : '';
    normalized['name'] = normalized['name'] ?? '';
    return _$CategoryModelFromJson(normalized);
  }

  // Converts CategoryModel to a JSON map (for caching, etc).
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  static List<CategoryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
