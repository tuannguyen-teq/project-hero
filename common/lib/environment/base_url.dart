import 'environment.dart';

abstract class BaseUrl extends BaseEnvironmentData<String> {
  String get url => getData;

  String? get getPemFilePath => null;
}
