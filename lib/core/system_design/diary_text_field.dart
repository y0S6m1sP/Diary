import 'package:flutter/material.dart';

class DiaryTextField extends StatelessWidget {
  const DiaryTextField({
    super.key,
    this.title,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onSuffixIconPressed,
    this.obscureText = false,
  });

  final String? title;
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function()? onSuffixIconPressed;
  final bool obscureText;

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
          onChanged: onChanged,
          obscureText: obscureText,
          autocorrect: false,
          enableSuggestions: false,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon != null
              ? IconButton(
                onPressed: onSuffixIconPressed,
                icon: suffixIcon!,
                )
              : null,
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
