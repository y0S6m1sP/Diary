import 'package:diary/core/system_design/diary_outline_button.dart';
import 'package:diary/features/auth/login/login_screen.dart';
import 'package:diary/features/auth/onboard/widgets/wavy_background.dart';
import 'package:flutter/material.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const WavyBackground(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'the\nbest\napp\nfor your\ndiary',
                    style: TextStyle(fontSize: 88),
                  ),
                  const Spacer(),
                  DiaryOutlineButton(
                    data: 'start',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => const LoginScreen(),
                        ),
                      );
                    },
                    backgroundColor: Theme.of(context).colorScheme.surface,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
