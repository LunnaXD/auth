import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../data/data.dart';
import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String env) async {
  if (env == Env.unitTest) {
    getIt.reset();
  }

  await getIt.init(environment: env);
}
