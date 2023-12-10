import 'dart:core';

import 'package:common/environment/base_url.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:data/net_work/network.dart';
import 'package:dio/dio.dart';

import 'htttp_error.dart';

abstract class HttpAPI {
  final HttpError httpError;

  HttpAPI(this._dio, this.httpError);

  BaseUrl? baseUrl() => null;

  Dio? _dio;

  Future<Dio> getDio() async {
    if (_dio != null) return _dio!;

    String? pemFilePath;
    if (baseUrl() == null) {
      _dio = NetWork.getDioDefault();
    } else {
      _dio = NetWork.getBaseDio(baseUrl: baseUrl()!.url);
      pemFilePath = baseUrl()?.getPemFilePath;
    }
    if (pemFilePath != null) {
      setupCertificate(_dio!.httpClientAdapter, pemFilePath);
    }
    return _dio!;
  }

  Future<Map<String, dynamic>> postRequest(String query,
      {Map<String, dynamic>? queryParameters,}) async {
    final response = await _dio?.post(
      'graphql/',
      data: {'query': query},
      queryParameters: queryParameters,
    );
    return response?.data;
  }

  Future<Map<String, dynamic>> postRequestWithFile(FormData formData) async {
    final response = await _dio?.post('graphql/',
        data: formData, options: Options(headers: {"Content-Type": "multipart/form-data"},));
    return response?.data;
  }

  Future sendApiRequest(
    Method method, {
    Map<String, String>? headers,
    dynamic body,
    Map<String, dynamic> queryParameters = const {},
    Options? options,
  }) async {
    bool haveConnection = await _connectedWithInternet();
    if (!haveConnection) httpError.withOutInternet();
    var request = HttpRequest.newRequest(
      method,
      dio: await getDio(),
      body: body,
      queryParameters: queryParameters,
      headers: headers,
      options: options,
    );
    try {
      Response rawResponse = await request.send();
      return rawResponse.data;
    } catch (e) {
      httpError.handleError(e);
    }
  }

  Future<bool> _connectedWithInternet() async {
    try {
      final result = await Connectivity().checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

class HttpRequest {
  final Method method;
  Map<String, dynamic>? headers;
  var body;
  Map<String, dynamic> queryParameters;
  Dio dio;
  Options? options;

  HttpRequest(
    this.method, {
    Dio? dio,
    Map<String, dynamic>? headers,
    this.body,
    this.queryParameters = const {},
    this.options,
  }) : dio = dio ?? NetWork.getDioDefault();

  factory HttpRequest.newRequest(
    Method method, {
    Dio? dio,
    Map<String, String>? headers,
    var body,
    Map<String, dynamic> queryParameters = const {},
    Options? options,
  }) {
    return HttpRequest(method,
        dio: dio, headers: headers, body: body, queryParameters: queryParameters, options: options);
  }

  void addQueries(Map<String, dynamic> queryParameters) => this.queryParameters = queryParameters;

  void addQuery(String key, var value) {
    queryParameters[key] = value;
  }

  void addParams(var body) => this.body = body;

  void addParam(String key, var value) {
    body ??= {};
    body[key] = value;
  }

  Future<Response> send() async {
    Future<Response> response;
    if (method is POST) {
      response =
          dio.post(method.path, data: body, queryParameters: queryParameters, options: options);
    } else if (method is GET) {
      response = dio.get(method.path, queryParameters: queryParameters, options: options);
    } else if (method is PUT) {
      response =
          dio.put(method.path, data: body, queryParameters: queryParameters, options: options);
    } else if (method is DELETE) {
      response =
          dio.delete(method.path, data: body, queryParameters: queryParameters, options: options);
    } else if (method is PATCH) {
      response =
          dio.patch(method.path, data: body, queryParameters: queryParameters, options: options);
    } else {
      throw 'no support method ${method.runtimeType}';
    }
    return response;
  }
}

abstract class Method {
  String path;

  Method(this.path);

  //String get path => _path;

  void setPath(String key, String value) {
    path = path.replaceAll(key, value);
  }

  Method addPath(String path) {
    this.path += path;
    return this;
  }
}

class POST extends Method {
  POST(String url) : super(url);
}

class GET extends Method {
  GET(String url) : super(url);
}

class PUT extends Method {
  PUT(String url) : super(url);
}

class PATCH extends Method {
  PATCH(String url) : super(url);
}

class DELETE extends Method {
  DELETE(String url) : super(url);
}
