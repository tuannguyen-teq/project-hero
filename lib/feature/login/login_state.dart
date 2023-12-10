part of 'login_bloc.dart';


@immutable
class LoginState extends Equatable {
  final bool isLoading;
  final dynamic error;

  const LoginState({
    required this.isLoading,
    this.error,
  });

  @override
  List<Object?> get props => [
        isLoading,
        error,
      ];

  LoginState copyWith({
    bool? isLoading,
    dynamic error,
  }) {
    return LoginState(
      isLoading: isLoading ?? false,
      error: error,
    );
  }
}
