import 'package:bloc/bloc.dart';
import 'package:common/common.dart';

class SimpleBlocObserve extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.i('bloc: ${bloc.runtimeType}(${bloc.hashCode}) - $event');
  }
}
