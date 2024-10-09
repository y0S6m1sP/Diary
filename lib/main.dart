import 'package:diary/src/app.dart';
import 'package:diary/src/app_injector.dart';
import 'package:diary/src/core/utils/app_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initApp();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp();
  runApp(
    const App(),
  );
}
