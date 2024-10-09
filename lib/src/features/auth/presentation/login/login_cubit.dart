import 'package:diary/src/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:diary/src/features/auth/presentation/login/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.signInUsecase}) : super(const LoginState());

  final SignInUsecase signInUsecase;

  void emailChanged(String email) {
    emit(state.copyWith(email: email));
  }

  void passwordChanged(String password) {
    emit(state.copyWith(password: password));
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> signIn() async {
    try {
      final params = SignInParams(
        email: state.email,
        password: state.password,
      );
      await signInUsecase(params);
      emit(state.copyWith(isLoginSuccess: true));
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    }
  }
}
