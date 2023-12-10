import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(InitialState()) {
    on<MainEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
