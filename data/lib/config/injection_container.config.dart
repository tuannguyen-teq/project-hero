// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/repositories/graphql_repository.dart' as _i11;
import 'package:domain/repositories/local_data_repository.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../common.dart' as _i10;
import '../net_work/app_http_error.dart' as _i6;
import '../net_work/htttp_error.dart' as _i5;
import '../repositories/graphql_repository_impl.dart' as _i12;
import '../repositories/local_data_manager_impl.dart' as _i14;
import 'default_base_url.dart' as _i3;
import 'injection_container.dart' as _i15;
import 'logger_interceptor.dart' as _i7;
import 'net_work.dart' as _i9;

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
  gh.singleton<_i3.DefaultBaseUrl>(_i3.DefaultBaseUrl());
  gh.lazySingleton<_i4.GoogleSignIn>(() => registerModule.googleSignIn);
  gh.factory<_i5.HttpError>(() => _i6.AppHttpError());
  gh.singleton<_i7.HttpLoggingViewInterceptor>(
      _i7.HttpLoggingViewInterceptor());
  await gh.singletonAsync<_i8.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.singleton<_i9.THeroNetwork>(_i9.THeroNetwork(gh<_i10.DefaultBaseUrl>()));
  gh.lazySingleton<_i11.GraphqlRepository>(() => _i12.GraphqlRepositoryImpl(
        gh<_i10.THeroNetwork>(),
        gh<_i10.HttpError>(),
      ));
  gh.singleton<_i13.LocalDataRepository>(_i14.LocalDataRepositoryImpl(
      sharedPreferences: gh<_i8.SharedPreferences>()));
  return getIt;
}

class _$RegisterModule extends _i15.RegisterModule {}
