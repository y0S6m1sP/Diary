import 'package:flutter/material.dart';

class DiaryOutlineButton extends StatelessWidget {
  const DiaryOutlineButton({
    super.key,
    required this.data,
    this.onPressed,
    this.backgroundColor,
  });

  final Function()? onPressed;
  final String data;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primaryContainer,
        side: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
        minimumSize: const Size(double.infinity, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
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
      ),
    );
  }
}
