import 'package:flutter/material.dart';
import 'package:telead_e_learning/widget/custom_text_field.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F9FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset('assets/images/TeleadLogo.png'),
            CustomTextField(
                hintText: 'Password',
                prefixIcon: Icons.lock_outline_rounded,
                suffixIcon: Icons.visibility_off_outlined),
          ],
        ),
      ),
    );
  }
}
