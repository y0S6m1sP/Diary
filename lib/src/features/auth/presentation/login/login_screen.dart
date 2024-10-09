import 'package:diary/src/core/system_design/diary_action_button.dart';
import 'package:diary/src/core/system_design/diary_text_field.dart';
import 'package:diary/src/features/auth/domain/repository/auth_repository.dart';
import 'package:diary/src/features/auth/presentation/login/login_cubit.dart';
import 'package:diary/src/features/auth/presentation/login/login_state.dart';
import 'package:diary/src/features/auth/presentation/register/register_screen.dart';
import 'package:diary/src/features/diary/presentation/overview/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        automaticallyImplyLeading: false,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
            create: (_) => LoginCubit(
              context.read<AuthRepository>(),
            ),
            child: _LoginContent(),
          ),
        ),
      ),
    );
  }
}

class _LoginContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.isLoginSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => const OverviewScreen(),
            ),
          );
        }
      },
      child: Column(
        children: [
          const SizedBox(height: 16),
          _EmailInput(),
          const SizedBox(height: 16),
          _PasswordInput(),
          _ForgotPasswordButton(),
          const SizedBox(height: 48),
          _SignInButton(),
          const Spacer(),
          _SignUpText(),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DiaryTextField(
      onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
      prefixIcon: const Icon(Icons.email_outlined),
      title: 'Email',
      hintText: 'test@example.com',
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<LoginCubit>().state;
    return DiaryTextField(
      onChanged: (password) =>
          context.read<LoginCubit>().passwordChanged(password),
      prefixIcon: const Icon(Icons.lock_outline),
      suffixIcon: Icon(
        state.isPasswordVisible
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
      ),
      obscureText: !state.isPasswordVisible,
      onSuffixIconPressed: () {
        context.read<LoginCubit>().togglePasswordVisibility();
      },
      title: 'Password',
      hintText: 'Password',
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text('Forgot password?'),
      ),
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DiaryActionButton(
      data: 'Login',
      onPressed: () => context.read<LoginCubit>().signIn(),
    );
  }
}

class _SignUpText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Don\'t have an account?'),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const RegisterScreen(),
              ),
            );
          },
          child: const Text('Sign up'),
        ),
      ],
    );
  }
}
