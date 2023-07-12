import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@InjectableInit(
  initializerName: r'$initGetItFromData', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
@module
abstract class RegisterModule {
  @preResolve
  @singleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  GoogleSignIn get googleSignIn =>
      GoogleSignIn(scopes: ['https://www.googleapis.com/auth/userinfo.email']);
}
