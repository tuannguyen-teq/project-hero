import 'package:domain/repositories/local_data_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: LocalDataRepository)
class LocalDataRepositoryImpl implements LocalDataRepository {
  static const String tokenKey = 'token_key';
  static const String refreshTokenKey = 'refresh_token_key';
  static const String userKey = 'user_key';
  static const String initializeKey = 'initialize_key';
  final SharedPreferences sharedPreferences;

  LocalDataRepositoryImpl({required this.sharedPreferences});

  @override
  String get accessToken => sharedPreferences.getString(tokenKey) ?? '';

  @override
  Future clearLocalData() async {
    await sharedPreferences.remove(tokenKey);
    await sharedPreferences.remove(refreshTokenKey);
    await sharedPreferences.remove(userKey);
    await sharedPreferences.remove(initializeKey);
  }

  @override
  String get refreshToken => sharedPreferences.getString(refreshTokenKey) ?? '';

  @override
  Future<void> saveRefreshToken(String? refreshToken) async {
    if (refreshToken != null) {
      sharedPreferences.setString(refreshTokenKey, refreshToken);
    }
  }

  @override
  Future<void> saveAccessToken(String? accessToken) async {
    if (accessToken != null) {
      sharedPreferences.setString(tokenKey, accessToken);
    }
  }
}
