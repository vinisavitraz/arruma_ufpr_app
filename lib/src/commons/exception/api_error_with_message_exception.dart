import 'package:dio/dio.dart';

class ApiErrorWithMessageException extends DioError {

  String errorCode;
  String errorMessage;

  @override
  String toString() {
    return '$errorCode - $errorMessage';
  }

  ApiErrorWithMessageException(RequestOptions r, this.errorCode, this.errorMessage) : super(requestOptions: r);

}