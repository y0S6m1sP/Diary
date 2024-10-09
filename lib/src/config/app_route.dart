import 'package:diary/src/app_injector.dart';
import 'package:diary/src/features/auth/presentation/login/login_cubit.dart';
import 'package:diary/src/features/auth/presentation/login/login_screen.dart';
import 'package:diary/src/features/auth/presentation/onboard/onboard_screen.dart';
import 'package:diary/src/features/auth/presentation/register/register_cubit.dart';
import 'package:diary/src/features/auth/presentation/register/register_screen.dart';
import 'package:diary/src/features/diary/presentation/add_diary/add_diary_bloc.dart';
import 'package:diary/src/features/diary/presentation/add_diary/add_diary_screen.dart';
import 'package:diary/src/features/diary/presentation/overview/overview_cubit.dart';
import 'package:diary/src/features/diary/presentation/overview/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes {
  static const String onBoard = 'onBoard';
  static const String login = 'login';
  static const String register = 'register';
  static const String overview = 'overview';
  static const String addDiary = 'addDiary';
}

class AppRoute {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoard:
        return MaterialPageRoute(
          builder: (_) => const OnboardScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<RegisterCubit>(),
            child: const RegisterScreen(),
          ),
        );
      case Routes.overview:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<OverviewCubit>(),
            child: const OverviewScreen(),
          ),
        );
      case Routes.addDiary:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<AddDiaryBloc>(),
            child: const AddDiaryScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No route found.'),
            ),
          ),
        );
    }
  }
}
