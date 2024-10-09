import 'package:diary/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:diary/src/features/auth/presentation/register/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepository) : super(const RegisterState());

  final AuthRepository _authRepository;

  void emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void usernameChanged(String username) {
    emit(state.copyWith(username: username));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> signUp() async {
    try {
      await _authRepository.signUp(
        email: state.email,
        password: state.password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    }
  }
}
