import 'package:diary/core/system_design/diary_action_button.dart';
import 'package:diary/core/system_design/diary_text_field.dart';
import 'package:diary/features/auth/domain/repository/auth_repository.dart';
import 'package:diary/features/auth/presentation/bloc/register_cubit.dart';
import 'package:diary/features/auth/presentation/bloc/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            create: (_) => RegisterCubit(
              context.read<AuthRepository>(),
            ),
            child: const RegisterContent(),
          ),
        ),
      ),
    );
  }
}

class RegisterContent extends StatelessWidget {
  const RegisterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      child: Column(
        children: [
          // const DiaryTextField(
          //   prefixIcon: Icon(Icons.person_outline),
          //   title: 'Username',
          //   hintText: 'Bob',
          // ),
          // const SizedBox(height: 16),
          _EmailInput(),
          const SizedBox(height: 16),
          _PasswordInput(),
          const Spacer(),
          _SignUpButton(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DiaryTextField(
      key: const Key('registerForm_emailInput_textField'),
      onChanged: (email) => context.read<RegisterCubit>().emailChanged(email),
      prefixIcon: const Icon(Icons.email_outlined),
      title: 'Email',
      hintText: 'test@example.com',
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DiaryTextField(
      key: const Key('registerForm_passwordInput_textField'),
      onChanged: (password) =>
          context.read<RegisterCubit>().passwordChanged(password),
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: const Icon(Icons.visibility_off_outlined),
      title: 'Password',
      hintText: 'Password',
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DiaryActionButton(
      key: const Key('registerForm_continue_raisedButton'),
      data: 'Sign Up',
      onPressed: () => context.read<RegisterCubit>().signUp(),
    );
  }
}
