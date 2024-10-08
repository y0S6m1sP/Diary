import 'package:diary/src/app_event.dart';
import 'package:diary/src/app_state.dart';
import 'package:diary/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AppState(user: authRepository.currentUser)) {
    on<AppUserSubcriptionRequested>(_onUserSubscriptionRequested);
  }

  final AuthRepository _authRepository;

  Future<void> _onUserSubscriptionRequested(
    AppUserSubcriptionRequested event,
    Emitter<AppState> emit,
  ) async {
    return emit.onEach(
      _authRepository.user,
      onData: (user) => emit(
        AppState(user: user),
      ),
    );
  }
}
