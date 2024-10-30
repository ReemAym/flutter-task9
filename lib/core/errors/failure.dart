import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class Failure {
  String erroMsg;
  Failure({required this.erroMsg});
}

class ServerFailure extends Failure {
  ServerFailure({required super.erroMsg});

  factory ServerFailure.fromDioError(DioError e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return (ServerFailure(erroMsg: 'Connection Timeout with Apiserver'));
      case DioExceptionType.sendTimeout:
        return (ServerFailure(erroMsg: 'send Timeout with Apiserver'));
      case DioExceptionType.receiveTimeout:
        return (ServerFailure(erroMsg: 'Receive Timeout with Apiserver'));
      case DioExceptionType.badCertificate:
        return (ServerFailure(erroMsg: 'bed certificate with Apiserver'));
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response?.statusCode, e.response?.data);
      case DioExceptionType.cancel:
        return (ServerFailure(erroMsg: 'Request to Apiserver was canceled'));
      case DioExceptionType.connectionError:
        return (ServerFailure(erroMsg: 'No Internet Connection'));

      case DioExceptionType.unknown:
        return (ServerFailure(erroMsg: 'Oops there was an error'));
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(erroMsg: 'request was not found, try later');
    } else if (statusCode == 500) {
      return ServerFailure(
          erroMsg: 'there is a problem with the server, try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(erroMsg: response['error']['message']);
    } else {
      return ServerFailure(erroMsg: 'Oops there was an error, try again');
    }
  }
}
