import 'package:arruma_ufpr_app/src/auth/repository/auth_repository.dart';
import 'package:dio/dio.dart';
import 'http_client_interceptors.dart';

class AppHttpClient {

  static Dio client = createDio();

  //static var remoteHost = 'http://168.138.252.48:3000';
  static var remoteHost = 'http://192.168.0.105:3000';

  static Dio createDio() {
    AuthRepository authRepository = AuthRepository();
    var dio = Dio(BaseOptions(
      baseUrl: remoteHost,
      receiveTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
      sendTimeout: const Duration(seconds: 10),
      contentType: Headers.jsonContentType,
    ));

    dio.interceptors.addAll({
      HttpClientInterceptors(dio, authRepository),
    });
    return dio;
  }

}


