import 'package:common/app_log/custom_log.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class HttpInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    handleError(err);
    return handler.next(err);
  }

  void handleError(DioException error) {
    String message = 'Server error, please try again';
    logger.e('e.type: ${error.type}');
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        message = 'Connect timeout, cannot connect to server!';
        break;
      case DioExceptionType.sendTimeout:
        message = 'Send timeout';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout';
        break;
      case DioExceptionType.badCertificate:
        message = 'Bad certificate';
        break;
      case DioExceptionType.badResponse:
        message = 'Bad response: ${handleDioErrorTypeResponse(error)}';
        break;
      case DioExceptionType.cancel:
        message = 'Request is cancelled';
        break;
      case DioExceptionType.connectionError:
        message = 'Connection error!';
        break;

      case DioExceptionType.unknown:
        message = 'Dio exception type unknown!';
        break;
    }

    throw NetworkException(message: message);
  }

  String handleDioErrorTypeResponse(DioException e) {
    switch (e.response?.statusCode) {
      case 400:
        return 'Bad request.';

      case 401:
        return 'Authentication failed.';

      case 403:
        return 'The authenticated user is not allowed to access the specified API endpoint.';

      case 404:
        return 'Not Found';

      case 409:
        return 'Conflict';

      case 408:
        return 'Request Timeout';
      case 422:
        return 'Data validation failed.';
      case 429:
        return 'Too many requests.';

      case 500:
        return 'Internal Server Error';

      case 503:
        return 'Service Unavailable';

      default:
        return 'Oops something went wrong!';
    }
  }
}

class NetworkException implements Exception {
  final String? message;

  final int? code;

  const NetworkException({this.message, this.code});

  @override
  String toString() {
    return message ?? runtimeType.toString();
  }
}
