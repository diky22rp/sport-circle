import 'package:json_annotation/json_annotation.dart';
import 'package:sport_circle/features/authentication/domain/entities/user_entity.dart';

part 'user_model.g.dart';

// UserModel maps the user object from the API response.
//
// Field mapping:
// - id:         User ID (always stored as String)
// - name:       User's name
// - email:      User's email
// - role:       User's role (e.g., "user")
// - phoneNumber: Phone number (snake_case in API)
// - token:      Auth token (present in login/register response)
@JsonSerializable()
class UserModel extends UserEntity {
  // All required fields must be provided. Optional fields may be null.
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    super.role,
    @JsonKey(name: 'phone_number') super.phoneNumber,
    super.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final normalized = Map<String, dynamic>.from(json);
    normalized['id'] = (normalized['id'] != null)
        ? normalized['id'].toString()
        : '';
    normalized['name'] = normalized['name'] ?? '';
    normalized['email'] = normalized['email'] ?? '';
    return _$UserModelFromJson(normalized);
  }

  // Converts UserModel to a JSON map (for caching, etc).
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
