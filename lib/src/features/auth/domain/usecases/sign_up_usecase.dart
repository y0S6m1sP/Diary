import 'package:diary/src/features/auth/domain/repositories/auth_repository.dart';

class SignUpUsecase {
  SignUpUsecase({required this.authRepository});

  final AuthRepository authRepository;

  Future<void> call(SignUpParams params) async {
    return await authRepository.signUp(params: params);
  }
}

class SignUpParams {
  final String email;
  final String password;

  const SignUpParams({
    required this.email,
    required this.password,
  });
}
