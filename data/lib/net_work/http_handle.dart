import 'dart:core';

import 'package:common/common.dart';
import 'package:data/net_work/htttp_error.dart';
import 'package:data/net_work/net_work_custom.dart';

import 'package:dio/dio.dart';

abstract class HttpAPI {
  final HttpError httpError;

  HttpAPI(this._dio, this.httpError);

  BaseUrl? get baseUrl => null;

  Dio? _dio;

  Future<Dio> getDio() async {
    if (_dio != null) return _dio!;

    String? pemFilePath;
    if (baseUrl == null) {
      _dio = NetWorkCustom.getDioDefault();
    } else {
      _dio = NetWorkCustom.getBaseDio(baseUrl: baseUrl!.url);
      pemFilePath = baseUrl?.getPemFilePath;
    }
    if (pemFilePath != null) {
      setupCertificate(_dio!.httpClientAdapter, pemFilePath);
    }
    return _dio!;
  }
}
