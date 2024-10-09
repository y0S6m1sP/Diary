import 'package:diary/src/app_bloc.dart';
import 'package:diary/src/app_event.dart';
import 'package:diary/src/app_injector.dart';
import 'package:diary/src/app_state.dart';
import 'package:diary/src/features/auth/presentation/onboard/onboard_screen.dart';
import 'package:diary/src/features/diary/presentation/overview/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => sl<AppBloc>()..add(const AppUserSubcriptionRequested()),
      child: const AppView(),
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
