import 'package:flutter/material.dart';

class DiaryTextButton extends StatelessWidget {
  const DiaryTextButton({
    super.key,
    required this.data,
    this.onPressed,
  });

  final String data;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          data,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
