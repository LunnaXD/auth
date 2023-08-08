import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection({bool isUnitTest = false}) async {
  if (isUnitTest) {
    getIt.reset();
  }

  await getIt.init();
}
