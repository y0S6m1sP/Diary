import 'package:diary/app.dart';
import 'package:diary/core/utils/app_bloc_observer.dart';
import 'package:diary/data/repository/default_auth_repository.dart';
import 'package:diary/data/repository/default_diary_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();

  final authRepository = DefalutAuthRepository();
  final diaryRepository = DefaultDiaryRepository();

  runApp(
    App(
      authRepository: authRepository,
      diaryRepository: diaryRepository,
    ),
  );
}
