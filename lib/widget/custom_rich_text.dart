import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key, this.text, this.buttonText, this.onTap});
  final String? text, buttonText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff545454),
          ),
          children: <TextSpan>[
            TextSpan(
                text: buttonText,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff0961F5),
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap = onTap)
          ]),
    );
  }
}
