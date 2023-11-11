import 'package:dio/dio.dart';

import '../common.dart';

abstract class GraphQlApi extends HttpAPI {
  Dio dio;
  GraphQlApi(this.dio, HttpError httpError) : super(dio, httpError);

  Future<Map<String, dynamic>> postRequest(String query,
      {Map<String, dynamic>? queryParameters}) async {
    final response =
        await dio.post('graphql/', data: {'query': query}, queryParameters: queryParameters);
    return response.data;
  }

  Future<Map<String, dynamic>> postRequestWithFile(FormData formData) async {
    final response = await dio.post('graphql/',
        data: formData, options: Options(headers: {"Content-Type": "multipart/form-data"}));
    return response.data;
  }
}
