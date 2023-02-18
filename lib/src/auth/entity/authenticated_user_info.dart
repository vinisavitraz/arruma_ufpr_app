

import 'package:arruma_ufpr_app/services/storage/cache_object.dart';

class AuthenticatedUserInfo implements CacheObject {

  int userId;
  String userEmail;
  String userName;
  int userRole;

  AuthenticatedUserInfo({
    required this.userId,
    required this.userEmail,
    required this.userName,
    required this.userRole,
  });

  factory AuthenticatedUserInfo.fromJson(dynamic json) {
    return AuthenticatedUserInfo(
      userId: json['userId'],
      userEmail: json['userEmail'],
      userName: json['userName'],
      userRole: json['userRole'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'userEmail': userEmail,
      'userName': userName,
      'userRole': userRole,
    };
  }

  @override
  CacheObject fromJson(dynamic data) {
    return AuthenticatedUserInfo.fromJson(data);
  }

}