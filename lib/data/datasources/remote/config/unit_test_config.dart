import 'package:injectable/injectable.dart';

import 'env_config.dart';

@Environment(Env.unitTest)
@LazySingleton(as: EnvironmentConfig)
class UnitTestConfig extends EnvironmentConfig {
  @override
  bool get haveCert => true;

  @override
  String get host => 'beta.kraken.bo';

  @override
  String get port => '8050';

  @override
  String get initPath => '/api';

  @override
  bool get isUnitTest => true;

  @override
  bool get showLogs => false;
}
