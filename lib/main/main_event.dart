part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}

@immutable
class GoHomePageEvent extends MainEvent {
  GoHomePageEvent();
}

class GoLoginPageEvent extends MainEvent {
  GoLoginPageEvent();
}
