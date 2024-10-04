import 'package:equatable/equatable.dart';

final class RegisterState extends Equatable {
  const RegisterState({
    this.email = '',
    this.password = '',
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];

  RegisterState copyWith({
    String? email,
    String? password,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
