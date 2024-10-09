import 'package:diary/src/app_injector.dart';
import 'package:diary/src/core/system_design/diary_action_button.dart';
import 'package:diary/src/core/system_design/diary_text_field.dart';
import 'package:diary/src/features/auth/presentation/register/register_cubit.dart';
import 'package:diary/src/features/auth/presentation/register/register_state.dart';
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
            create: (_) => sl<RegisterCubit>(),
            child: _RegisterContent(),
          ),
        ),
      ),
    );
  }
}

class _RegisterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      child: Column(
        children: [
          _UsernameInput(),
          const SizedBox(height: 16),
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

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DiaryTextField(
      onChanged: (username) =>
          context.read<RegisterCubit>().usernameChanged(username),
      prefixIcon: const Icon(Icons.person_outline),
      title: 'Username',
      hintText: 'Bob',
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DiaryTextField(
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
    final state = context.watch<RegisterCubit>().state;
    return DiaryTextField(
      onChanged: (password) =>
          context.read<RegisterCubit>().passwordChanged(password),
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: Icon(
        state.isPasswordVisible
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
      ),
      obscureText: !state.isPasswordVisible,
      onSuffixIconPressed: () {
        context.read<RegisterCubit>().togglePasswordVisibility();
      },
      title: 'Password',
      hintText: 'Password',
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DiaryActionButton(
      data: 'Sign Up',
      onPressed: () => context.read<RegisterCubit>().signUp(),
    );
  }
}
