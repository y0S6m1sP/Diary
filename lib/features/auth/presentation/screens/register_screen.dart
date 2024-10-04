import 'package:diary/core/system_design/diary_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              DiaryTextField(
                prefixIcon: Icon(Icons.person_outline),
                title: 'Username',
                hintText: 'Bob',
              ),
              SizedBox(height: 16),
              DiaryTextField(
                prefixIcon: Icon(Icons.email_outlined),
                title: 'Email',
                hintText: 'test@example.com',
              ),
              SizedBox(height: 16),
              DiaryTextField(
                prefixIcon: Icon(Icons.lock_outline),
                suffixIcon: Icon(Icons.visibility_off_outlined),
                title: 'Password',
                hintText: 'Password',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
