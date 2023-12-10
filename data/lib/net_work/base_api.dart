import 'package:dio/dio.dart';

import '../common.dart';

abstract class BaseAPI extends HttpAPI {
  Dio dio;
  BaseAPI(this.dio, HttpError httpError) : super(dio, httpError);
}
