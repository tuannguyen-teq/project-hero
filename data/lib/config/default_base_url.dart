import 'package:injectable/injectable.dart';

class DefaultBaseUrl {
  final String? environment;

  DefaultBaseUrl(this.environment);

  String get url {
    switch (environment) {
      case Environment.dev:
        return 'http://hero.dev.teqn.asia/';
      case Environment.prod:
        return 'http://hero.dev.teqn.asia/';
      default:
        return 'http://hero.dev.teqn.asia/';
    }
  }
}