import 'package:diary/src/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:diary/src/features/auth/presentation/register/register_state.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.signUpUsecase}) : super(const RegisterState());

  final SignUpUsecase signUpUsecase;

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
      final params = SignUpParams(
        email: state.email,
        password: state.password,
      );
      await signUpUsecase(params);
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    }
  }
}
