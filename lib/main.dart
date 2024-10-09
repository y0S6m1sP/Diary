import 'package:diary/src/app.dart';
import 'package:diary/src/app_injector.dart';
import 'package:diary/src/core/utils/app_bloc_observer.dart';
import 'package:diary/src/features/auth/data/repositories/default_auth_repository.dart';
import 'package:diary/src/features/diary/data/repositories/default_diary_repository.dart';
import 'package:diary/src/features/diary/data/datasources/diary_data_source.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initApp();
  Bloc.observer = AppBlocObserver();

  await Firebase.initializeApp();

  final authRepository = DefalutAuthRepository();
  final diaryRepository = DefaultDiaryRepository(
    diaryDataSource: DefaultDiaryDataSource(),
  );

  runApp(
    App(
      authRepository: authRepository,
      diaryRepository: diaryRepository,
    ),
  );
}
