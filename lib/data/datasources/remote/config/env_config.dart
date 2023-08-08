class Env {
  static const unitTest = 'unitTest';
  static const dev = 'dev';
  static const test = 'test';
  static const prod = 'prod';
}

abstract class EnvironmentConfig {
  bool get haveCert;

  String get host;

  String? get port;

  String get initPath;

  bool get isUnitTest;

  bool get showLogs;

  String get apiUrlBase => '$host${port != null ? ':$port' : ''}$initPath';

  String get _protocol => haveCert ? 'https://' : 'http://';

  String uri({String? path}) => '$_protocol$apiUrlBase${path ?? ''}';
}
