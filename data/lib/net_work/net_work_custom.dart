import 'dart:io';

import 'package:data/net_work/htttp_error.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart';

class NetWorkCustom {
  static Dio? _dio;
  static List<Interceptor>? _interceptors;
  static late HttpError httpError;
  static late BaseOptions _defaultOptions;

  static void init({
    List<Interceptor>? interceptors,
    required HttpError httpError,
    required BaseOptions options,
    String? pemFilePath,
  }) {
    _interceptors = interceptors;
    _defaultOptions = options;
    NetWorkCustom.httpError = httpError;
    getDioDefault();
    if (pemFilePath != null) {
      setupCertificate(_dio!.httpClientAdapter, pemFilePath);
    }
  }

  static Dio getDioDefault() {
    _dio ??= getBaseDio();
    return _dio!;
  }

  static Dio getBaseDio({String? baseUrl}) {
    BaseOptions options;
    if (baseUrl != null) {
      options = BaseOptions(
        connectTimeout: const Duration(milliseconds: 10000),
        receiveTimeout: const Duration(milliseconds: 10000),
        baseUrl: baseUrl,
      );
    } else {
      options = _defaultOptions;
    }

    Dio dio = Dio(options);
    _interceptors?.forEach((interceptor) => dio.interceptors.add(interceptor));

    dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        return handler.next(e);
      },
    ));
    return dio;
  }
}

void setupCertificate(HttpClientAdapter clientAdapter, String pemFilePath) async {
  var data = await rootBundle.load(pemFilePath);
  // ignore: deprecated_member_use
  (clientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
    SecurityContext sc = SecurityContext();
    sc.setTrustedCertificatesBytes(data.buffer.asUint8List());
    HttpClient httpClient = HttpClient(context: sc);
    return httpClient;
  };
}
