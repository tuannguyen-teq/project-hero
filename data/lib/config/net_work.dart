import 'package:common/common.dart';

import 'package:dio/dio.dart';
import 'package:domain/repositories/graphql_repository.dart';
import 'package:domain/repositories/local_data_repository.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../common.dart';

const timeOut = Duration(seconds: 10);

@singleton
class THeroNetwork {
  final DefaultBaseUrl baseUrl;

  THeroNetwork(this.baseUrl);

  Dio get dio {
    BaseOptions options = BaseOptions(
      connectTimeout: timeOut,
      receiveTimeout: timeOut,
      baseUrl: baseUrl.url,
    );

    Dio dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = GetIt.instance<LocalDataRepository>().accessToken;
        if (token.isNotEmpty == true) {
          options.headers['THero-Token'] = token;
        }
        handler.next(options);
      },
      onResponse: (response, handler) {
        final error = checkErrorExisted(response.data, response.requestOptions);
        if (error == null) {
          handler.resolve(response);
        } else {
          if (error.message == AppStrings.expired) {
            handler.next(response);
          } else {
            handler.reject(error);
          }
        }
      },
      onError: (e, handler) {
        handler.next(e);
      },
    ));
    dio.interceptors.add(RefreshTokenInterceptor(dio));
    return dio;
  }

  DioError? checkErrorExisted(dynamic response, RequestOptions options) {
    if (response is Map && response['errors'] is List) {
      final errors = response['errors'] as List<dynamic>;
      if (errors.isNotEmpty) {
        final error = errors.first['message'];
        return DioError(requestOptions: options, error: HttpError(message: error));
      }
    }
    return null;
  }
}

class RefreshTokenInterceptor extends QueuedInterceptor {
  final Dio defaultDio;

  RefreshTokenInterceptor(this.defaultDio);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    try {
      final accessToken = GetIt.instance<LocalDataRepository>().accessToken;
      // final refreshToken = GetIt.instance<LocalDataRepository>().refreshToken;
      var requestOptions = response.requestOptions;
      if (accessToken != requestOptions.headers['THero-Token']) {
        //Token updated
        fetchRequest(handler, requestOptions, accessToken);
      }
      // else {
      //   //refresh token
      //   final result = await refreshAccessToken(refreshToken);
      //   GetIt.instance<LocalDataRepository>().saveAccessToken(result.accessToken);
      //   fetchRequest(handler, requestOptions, result.accessToken);
      // }
    } catch (e) {
      //Expired
      handler.resolve(response);
      GetIt.instance<GraphqlRepository>().expiredStream.add(true);
    }
  }

  // Future<RefreshAccessTokenDto> refreshAccessToken(String? refreshToken) async {
  //   Dio dio = Dio(defaultDio.options);
  //   final refreshAccessToken = '''mutation {
  //     refreshAccessToken(
  //         input: {
  //           refreshToken: "$refreshToken"
  //         }
  //     ) {
  //       accessToken
  //       refreshToken
  //     }
  //   }''';
  //   final response = await dio.post('graphql/', data: {'query': refreshAccessToken});
  //   return BaseResponseDto.fromMap(
  //     response.data,
  //     (json) => RefreshAccessTokenDto.fromMap(json['refreshAccessToken']),
  //   ).data;
  // }

  void fetchRequest(
    ResponseInterceptorHandler handler,
    RequestOptions requestOptions,
    String? accessToken,
  ) async {
    requestOptions.headers['THero-Token'] = '$accessToken';
    if (requestOptions.data is FormData) {
      FormData formData = FormData();
      formData.fields.addAll(requestOptions.data.fields);
      for (MapEntry mapFile in requestOptions.data.files) {
        formData.files.add(
          MapEntry(
              mapFile.key,
              MultipartFile.fromFileSync(
                mapFile.value.filePath ?? '',
                filename: mapFile.value.filename,
              )),
        );
      }
      requestOptions.data = formData;
    }

    defaultDio.fetch(requestOptions).then(
      (value) {
        handler.resolve(value);
      },
      onError: (e) {
        handler.reject(e);
      },
    );
  }
}
