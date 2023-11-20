import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../firebase_options_dev.dart' as fb_dev;
import '../../firebase_options_prod.dart' as fb_prod;

import '../../app/di/injection_container.dart';
import '../app/bloc_observer.dart';
import 'package:common/common.dart';

import '../feature/login/login_widget.dart';

void loadApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: currentEnvironment == Environment.DEV ? 'TeqHero-Dev' : 'TeqHero',
    options: currentEnvironment == Environment.DEV
        ? fb_dev.DefaultFirebaseOptions.currentPlatform
        : fb_prod.DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await injectContainerInit();

  Bloc.observer = SimpleBlocObserve();

  runApp(const MaterialApp(home: LoginWidget()));
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: LoginWidget(),
      ),
    );
  }
}
