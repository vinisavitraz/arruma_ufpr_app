import 'package:arruma_ufpr_app/src/user/entity/user.dart';

class AuthenticatedUserInfo {

  final User authenticatedUserInfo;

  const AuthenticatedUserInfo({
    required this.authenticatedUserInfo,
  });

  factory AuthenticatedUserInfo.fromJson(dynamic json) {
    return AuthenticatedUserInfo(
      authenticatedUserInfo: User.fromJson(json['authenticatedUserInfo']),
    );
  }

}