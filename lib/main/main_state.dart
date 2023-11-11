part of 'main_bloc.dart';

@immutable
abstract class MainState extends Equatable {}

class InitialState extends MainState {
  @override
  List<Object?> get props => [InitialState];
}

class AppStatus extends MainState {
  final AppStatusEnum statusApp;

  AppStatus({
    this.statusApp = AppStatusEnum.defaultState,
  });

  @override
  List<Object?> get props => [AppStatus];

  AppStatus copyWith({
    AppStatusEnum? statusApp,
  }) {
    return AppStatus(
      statusApp: statusApp ?? this.statusApp,
    );
  }
}
