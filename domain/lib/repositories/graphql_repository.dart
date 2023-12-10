import 'dart:async';

import '../domain.dart';

abstract class GraphqlRepository {
  Future<User> loginWithGoogle(UserParam param);

  // Future<Result> logOut(String? refreshToken);

  Future<Initialize> init();

  StreamController<bool> get expiredStream;
}
