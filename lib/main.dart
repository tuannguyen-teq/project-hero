import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await injectContainerInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeqHero',
      home: Container(
        height: 30,
        width: 30,
        color: Colors.red,
      ),
    );
  }
}
