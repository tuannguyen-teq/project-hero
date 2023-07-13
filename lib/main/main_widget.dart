import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../firebase_options.dart';

import '../../app/di/injection_container.dart';
import '../app/bloc_observer.dart';
import 'package:common/common.dart';

void loadApp() async {
  print('=====currentEnvironment : $currentEnvironment');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: currentEnvironment == Environment.DEV ? 'TeqHero-dev' : 'TeqHero',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await injectContainerInit();
  Bloc.observer = SimpleBlocObserve();

  runApp(const MaterialApp(home: MainWidget()));
  // await preloadImageApp();
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text('HELLO WORLD'),
      ),
    );
  }
}
