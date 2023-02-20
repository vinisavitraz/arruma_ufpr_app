import 'package:arruma_ufpr_app/src/services/storage/cache_object.dart';

class Token implements CacheObject {

  final String token;
  final String tokenExpirationDate;

  const Token({
    required this.token,
    required this.tokenExpirationDate
  });

  factory Token.fromJson(dynamic json) {
    return Token(token: json['token'], tokenExpirationDate: json['tokenExpirationDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'tokenExpirationDate': tokenExpirationDate,
    };
  }

  @override
  CacheObject fromJson(data) {
    return Token.fromJson(data);
  }

}