import 'package:arruma_ufpr_app/src/user/entity/user.dart';

class UserResponseDTO {

  final User entity;

  const UserResponseDTO({
    required this.entity,
  });

  factory UserResponseDTO.fromJson(dynamic json) {

    return UserResponseDTO(
      entity: User.fromJson(json['entity']),
    );
  }
}