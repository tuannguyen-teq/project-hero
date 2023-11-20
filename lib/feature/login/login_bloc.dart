import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/graphql_repository.dart';
import 'package:domain/repositories/local_data_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GraphqlRepository graphqlRepository;
  final LocalDataRepository localDataRepository;
  final GoogleSignIn googleSignIn;
  LoginBloc(
    this.graphqlRepository,
    this.localDataRepository,
    this.googleSignIn,
  ) : super(const LoginState(isLoading: true)) {
    on<LoginEvent>((event, emit) async {
      await googleSignIn.signOut();
      final userGoogle = await googleSignIn.signIn();
      final tokenResult = await userGoogle?.authentication;

      if (userGoogle != null && tokenResult != null) {
        emit(state.copyWith(isLoading: true));

        final data = await graphqlRepository.loginWithGoogle(UserParam(
            emai: userGoogle.email,
            fullName: userGoogle.displayName!,
            idToken: tokenResult.idToken!));
        // localDataRepository.saveAccessToken(data.accessToken);
        // localDataRepository.saveRefreshToken(data.refreshToken);
        // localDataRepository.saveUser(data.user);
        // final initialize = await graphqlRepository.init();
        // localDataRepository.saveInitialize(initialize);
        // emit(state.copyWith(isLoading: false, navigator: AppStatus.loggedIn));
      }
    });
  }
}
