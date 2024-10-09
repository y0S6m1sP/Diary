import 'package:diary/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class SignInUsecase {
  SignInUsecase({required this.authRepository});
  
  final AuthRepository authRepository;

  Future<void> call(SignInParams params) async {
    return await authRepository.signInWithEmailAndPassword(params: params);
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
