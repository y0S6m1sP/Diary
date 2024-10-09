import 'package:diary/src/app_bloc.dart';
import 'package:diary/src/app_event.dart';
import 'package:diary/src/app_injector.dart';
import 'package:diary/src/app_state.dart';
import 'package:diary/src/config/app_route.dart';
import 'package:diary/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => sl<AppBloc>()..add(const AppUserSubcriptionRequested()),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Diary',
            theme: getThemeData,
            initialRoute: state.status == AppStatus.unauthenticated
                ? Routes.onBoard
                : Routes.overview,
            onGenerateRoute: AppRoute.onGenerateRoute,
          );
        },
      ),
    );
  }
}
