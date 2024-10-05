import 'package:diary/app_event.dart';
import 'package:diary/app_state.dart';
import 'package:diary/domain/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthRepository authRepository})
      : super(AppState(user: authRepository.currentUser));
}
