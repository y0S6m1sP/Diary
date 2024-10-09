import 'package:equatable/equatable.dart';

final class LoginState extends Equatable {
  const LoginState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.isLoginSuccess = false,
  });

  final String email;
  final String password;
  final bool isPasswordVisible;
  final bool isLoginSuccess;

  @override
  List<Object?> get props => [email, password, isPasswordVisible, isLoginSuccess];

  LoginState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
    bool? isLoginSuccess,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
    );
  }
}
