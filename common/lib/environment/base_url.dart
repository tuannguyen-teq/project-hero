import 'environment.dart';

abstract class BaseUrl extends BaseEnvironmentData<String> {
  String getUrl() => getData();

  String? get getPemFilePath => null;
}
