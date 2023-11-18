import 'package:data/config/injection_container.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection_container.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> injectContainerInit() async {
  final getItFromData = await $initGetItFromData(sl);
  $initGetIt(getItFromData);
  await sl.allReady();
}
