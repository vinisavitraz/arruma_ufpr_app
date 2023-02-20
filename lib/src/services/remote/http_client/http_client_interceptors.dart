import 'package:arruma_ufpr_app/src/auth/entity/token.dart';
import 'package:arruma_ufpr_app/src/auth/repository/auth_repository.dart';
import 'package:arruma_ufpr_app/src/services/remote/http_client/http_client_exceptions.dart';
import 'package:dio/dio.dart';
import '../../../commons/exception/api_error_with_message_exception.dart';
import '../../../commons/mapper/exception_message_mapper.dart';

class HttpClientInterceptors extends Interceptor {

  final Dio dio;
  final AuthRepository authRepository;

  HttpClientInterceptors(this.dio, this.authRepository);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    Token? accessToken = await authRepository.getActiveTokenFromInternalCache();

    if (accessToken != null) {
      String token = accessToken.token;
      options.headers['Authorization'] = 'Bearer $token';

      return handler.next(options);
    }

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      // case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.badResponse:
        if (err.response == null) {
          throw InternalServerErrorException(err.requestOptions);
        }

        print(err.response!);
        var request = err.requestOptions.uri.toString();
        var httpStatusCode = err.response!.statusCode;
        var errorCode = err.response!.data['errorCode'];
        var errorMessage = err.response!.data['errorMessage'];
        print('Uri: $request');
        print('Http Status Code: $httpStatusCode');
        print('Error Code: $errorCode');
        print('Error Message: $errorMessage');

        if (errorCode == null) {
          throw InternalServerErrorException(err.requestOptions);
        }

        var mappedError = ExceptionMessageMapper.mapByErrorCode(errorCode);

        if (mappedError != null) {
          print('mappedError: $mappedError');
          throw ApiErrorWithMessageException(err.requestOptions, errorCode, mappedError);
        }

        switch (httpStatusCode) {
          case 400:
            throw BadRequestException(err.requestOptions);
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 403:
            throw ForbiddenException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.connectionTimeout:
        // TODO: Handle this case.
        break;
      case DioErrorType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioErrorType.badResponse:
        // TODO: Handle this case.
        break;
      case DioErrorType.connectionError:
        // TODO: Handle this case.
        break;
      case DioErrorType.unknown:
        // TODO: Handle this case.
        break;
    }

    return handler.next(err);
  }

}