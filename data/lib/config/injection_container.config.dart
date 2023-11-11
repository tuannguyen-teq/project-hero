// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../common.dart' as _i7;
import '../repositories/graphql_repository_impl.dart' as _i9;
import '../repositories/local_data_manager_impl.dart' as _i10;
import 'injection_container.dart' as _i11;
import 'logger_interceptor.dart' as _i4;
import 'net_work.dart' as _i6;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetItFromData(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.singleton<_i4.HttpLoggingViewInterceptor>(
      _i4.HttpLoggingViewInterceptor());
  await gh.singletonAsync<_i5.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i6.THeroNetwork>(_i6.THeroNetwork(gh<_i7.DefaultBaseUrl>()));
  gh.lazySingleton<_i8.GraphqlRepository>(() => _i9.GraphqlRepositoryImpl(
        gh<_i7.THeroNetwork>(),
        gh<_i7.HttpError>(),
      ));
  gh.singleton<_i8.LocalDataRepository>(_i10.LocalDataRepositoryImpl(
      sharedPreferences: gh<_i5.SharedPreferences>()));
  return getIt;
}

class _$RegisterModule extends _i11.RegisterModule {}
