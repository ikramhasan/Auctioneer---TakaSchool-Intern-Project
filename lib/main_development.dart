import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:auctioneer/app/app.dart';
import 'package:auctioneer/app/app_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Bloc.observer = AppBlocObserver();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(App()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
