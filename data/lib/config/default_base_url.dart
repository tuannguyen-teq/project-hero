import 'package:common/common.dart';
import 'package:injectable/injectable.dart';

@singleton
class DefaultBaseUrl extends BaseUrl {
  @override
  String dev() => 'http://hero.dev.teqn.asia/';

  @override
  String stg() => 'http://hero.dev.teqn.asia/';

  @override
  String prod() => 'https://hero.teqn.asia/';
}
