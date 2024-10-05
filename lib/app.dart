import 'package:diary/app_bloc.dart';
import 'package:diary/app_event.dart';
import 'package:diary/app_state.dart';
import 'package:diary/domain/repository/auth_repository.dart';
import 'package:diary/features/auth/onboard/onboard_screen.dart';
import 'package:diary/features/diary/overview/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({super.key, required AuthRepository authRepository})
      : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
          lazy: false,
          create: (_) => AppBloc(authRepository: _authRepository)
            ..add(const AppUserSubcriptionRequested()),
          child: const AppView()),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            textTheme: GoogleFonts.poppinsTextTheme(),
            useMaterial3: true,
          ),
          home: state.status == AppStatus.unauthenticated
              ? const OnboardScreen()
              : const OverviewScreen(),
        );
      },
    );
  }
}
