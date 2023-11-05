import 'package:injectable/injectable.dart';

class BaseUrl {
  final String? environment;

  BaseUrl(this.environment);

  String get url {
    switch (environment) {
      case Environment.dev:
        return '';
      case Environment.prod:
        return '';
      default:
        return '';
    }
  }
}