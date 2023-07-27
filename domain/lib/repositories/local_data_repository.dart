abstract class LocalDataRepository {
  String get accessToken;

  String get refreshToken;

  Future<void> saveAccessToken(String? accessToken);

  Future<void> clearLocalData();

  Future<void> saveRefreshToken(String? refreshToken);
}
