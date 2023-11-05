import 'dart:convert';

import 'package:common/app_log/custom_log.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class HttpLoggingViewInterceptor extends Interceptor {
  static const String httpLoggingViewInterceptor = 'HttpLoggingViewInterceptor';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    try {
      String requestLog = 'Request: ${options.method} ${options.baseUrl + options.path}';
      String paramLog = '';
      String bodyLog = '';
      if (options.data != null) {
        String log;
        if (options.data is Map) {
          log = const JsonEncoder.withIndent('  ').convert(options.data);
        } else if (options.data is FormData) {
          log = (options.data as FormData).fields.toString();
        } else {
          log = options.data.toString();
        }
        bodyLog = 'Request data: $log';
      }
      if (options.queryParameters.isNotEmpty) {
        paramLog =
            'Query Param: ${const JsonEncoder.withIndent('  ').convert(options.queryParameters)}';
      }
      logger.i('$requestLog\n$paramLog\n$bodyLog');
    } catch (e, stackTrade) {
      logger.e(httpLoggingViewInterceptor, error: e, stackTrace: stackTrade);
    }

    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    logger.i(response);
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    String url = err.requestOptions.baseUrl + err.requestOptions.path;
    String urlLog = 'Error ${err.response?.statusCode}: ${err.requestOptions.method} $url';
    String bodyFormat = const JsonEncoder.withIndent('  ').convert(err.response?.data);

    logger.e('$urlLog\n$bodyFormat', error: err);
    return super.onError(err, handler);
  }
}
