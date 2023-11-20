import 'package:data/config/base_api.dart';
import 'package:dio/dio.dart';

abstract class GraphQlApi extends BaseAPI {
  GraphQlApi(super.dio, super.httpError);

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
