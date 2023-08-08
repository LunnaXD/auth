import 'dart:async';

import 'package:flutter/material.dart';

class RefreshListenable extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  RefreshListenable(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
