import 'package:injectable/injectable.dart';

import 'env_config.dart';

@Environment(Env.prod)
@LazySingleton(as: EnvironmentConfig)
class ProdConfig extends EnvironmentConfig {
  @override
  bool get haveCert => true;

  @override
  String get host => 'reqres.in';

  @override
  String? get port => null;

  @override
  String get initPath => '/api';

  @override
  bool get isUnitTest => false;

  @override
  bool get showLogs => false;
}
