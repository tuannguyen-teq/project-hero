import 'package:data/config/injection_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection_container.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future injectContainerInit() async {
  $initGetIt($initGetItFromData(sl) as GetIt);
  await sl.allReady();
}
