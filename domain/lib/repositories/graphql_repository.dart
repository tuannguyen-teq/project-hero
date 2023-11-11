import 'dart:async';

import '../domain.dart';

abstract class GraphqlRepository {
  Future<UserInfo> loginWithGoogle(String? email, String? fullName, String? idToken);

  // Future<Result> logOut(String? refreshToken);

  Future<Initialize> init();

  StreamController<bool> get expiredStream;
}
