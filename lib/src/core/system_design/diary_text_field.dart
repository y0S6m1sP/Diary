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
    this.isBorder = true,
    this.singleLine = true,
    this.fontSize,
  });

  final String? title;
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final Function()? onSuffixIconPressed;
  final bool obscureText;
  final bool isBorder;
  final bool singleLine;
  final double? fontSize;

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
          style: TextStyle(fontSize: fontSize ?? 14),
          obscureText: obscureText,
          autocorrect: false,
          enableSuggestions: false,
          maxLines: singleLine ? 1 : null,
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
            border: isBorder
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                : InputBorder.none,
          ),
        )
      ],
    );
  }
}
