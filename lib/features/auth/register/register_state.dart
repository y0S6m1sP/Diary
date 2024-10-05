import 'package:equatable/equatable.dart';

final class RegisterState extends Equatable {
  const RegisterState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false
  });

  final String username;
  final String email;
  final String password;
  final bool isPasswordVisible;

  @override
  List<Object?> get props => [username, email, password, isPasswordVisible];

  RegisterState copyWith({
    String? username,
    String? email,
    String? password,
    bool? isPasswordVisible,
  }) {
    return RegisterState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
