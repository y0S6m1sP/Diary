import 'package:flutter/material.dart';

class DiaryTextField extends StatelessWidget {
  const DiaryTextField({
    super.key,
    this.title,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String? title;
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 4),
        ],
        TextField(
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            errorText: errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        )
      ],
    );
  }
}
