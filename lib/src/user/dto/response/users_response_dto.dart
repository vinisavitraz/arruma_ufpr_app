import 'package:arruma_ufpr_app/src/user/entity/user.dart';

class UsersResponseDTO {

  List<User>? users;

  UsersResponseDTO({this.users});

  UsersResponseDTO.fromJson(Map<String, dynamic> json) {
    if (json['entities'] != null) {
      users = <User>[];
      json['entities'].forEach((v) {
        users!.add(User.fromJson(v));
      });
    }
  }

}