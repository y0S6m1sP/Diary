import 'package:diary/src/features/auth/presentation/onboard/widgets/spinning_star.dart';
import 'package:flutter/material.dart';

class WavyBackground extends StatelessWidget {
  const WavyBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final starRadius = MediaQuery.of(context).size.height * 0.6;

    return Scaffold(
      body: Stack(children: [
        Container(
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        Positioned(
          top: 8,
          right: -starRadius * 0.55,
          child: SpinningStar(
            color: Theme.of(context).colorScheme.tertiary,
            radius: starRadius,
            points: 11,
            duration: const Duration(seconds: 3),
          ),
        )
      ]),
    );
  }
}
