import 'package:diary/src/config/app_route.dart';
import 'package:diary/src/core/system_design/diary_outline_button.dart';
import 'package:diary/src/features/auth/presentation/onboard/widgets/wavy_background.dart';
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
                      Navigator.of(context).pushReplacementNamed(Routes.login);
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
