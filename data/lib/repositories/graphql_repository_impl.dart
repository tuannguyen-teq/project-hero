import 'dart:async';

import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../common.dart';

@LazySingleton(as: GraphqlRepository)
class GraphqlRepositoryImpl extends GraphQlApi implements GraphqlRepository {
  GraphqlRepositoryImpl(THeroNetwork tHeroNetwork, HttpError httpError)
      : super(tHeroNetwork.dio, httpError);

  @override
  Future<UserInfo> loginWithGoogle(
    String? email,
    String? fullName,
    String? idToken,
  ) async {
    final signIn = '''mutation {
        signIn(input: {
          email: "$email",
          fullName: "$fullName",
          idToken: "$idToken",
        }) {
          user {
            id
            fullName
            email
            stravaConnection
            stravaUsername
            autoExportToStrava
          }
          accessToken
          refreshToken
          result
          error
        }
      }''';
    final response = await postRequest(signIn);
    return UserInfo();
    //  BaseResponseDto.fromMap(response, (json) => UserInfoDto.fromMap(json['signIn']))
    //     .data
    //     .toDomain();
  }

  @override
  Future<Initialize> init() async {
    const init = '''query {
      init
    }''';

    final response = await postRequest(init);
    return Initialize();
    // BaseResponseDto.fromMap(response, (json) => InitializeDto.fromMap(json['init']))
    //     .data
    //     .toDomain();
  }

  @override
  // TODO: implement expiredStream
  StreamController<bool> get expiredStream => throw UnimplementedError();
}
