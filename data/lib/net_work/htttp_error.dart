import 'package:dio/dio.dart';

class HttpError implements Exception {
  static const int codeNoInternet = 10001;
  final int? code;

  final String message;
  final Map? body;

  const HttpError({
    this.code,
    this.message = '',
    this.body,
  });

  factory HttpError.error(
    Exception e, {
    defaultError = 'Server error, please try again!!!',
  }) {
    String message = defaultError;
    // ignore: deprecated_member_use
    if (e is DioError && e.response != null) {
      Map? data = e.response != null ? e.response!.data : null;

      if (data != null && data.containsKey('errors') && data['errors'] is String) {
        message = data['errors'];
      }
      return HttpError(code: e.response?.statusCode, body: data, message: message);
    }
    return HttpError(message: message);
  }

  void handleError(error) {
    throw HttpError.error(error);
  }

  void withOutInternet({noInternetError = 'No Internet!'}) {
    throw HttpError(code: codeNoInternet, message: noInternetError);
  }

  @override
  String toString() {
    return message.toString();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HttpError &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          message == other.message &&
          body == other.body;

  @override
  int get hashCode => code.hashCode ^ message.hashCode ^ body.hashCode;
}
