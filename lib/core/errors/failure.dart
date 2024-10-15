import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMsg;

  Failure(this.errorMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMsg);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with API service');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with API service');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with API service');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Respone to was API service canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('Connection error with API service');

      case DioExceptionType.unknown:
        return ServerFailure('Unknown error with API service');

      default:
        return ServerFailure('oops, try again later');
    }
  }

  factory ServerFailure.fromResponse(int status, dynamic response) {
    if (status == 400 || status == 401 || status == 403) {
      return ServerFailure(response['error']['message']);
    } else if (status == 404) {
      return ServerFailure('Request not found');
    } else if (status == 500) {
      return ServerFailure('Internal server error');
    } else {
      return ServerFailure('Unknown error $status');
    }
  }
}
