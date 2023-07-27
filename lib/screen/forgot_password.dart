import 'package:flutter/material.dart';
import 'package:telead_e_learning/widget/app_bar.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Forgot Password'),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xffE8F1FF),
                  border: Border.all(
                    color: const Color(0xff167F71),
                    width: 2,
                  ),
                ),
                child: const Icon(
                  Icons.email_outlined,
                  color: Color(0xff167F71),
                  size: 20,
                ),
              ),
              const SizedBox(width: 14),
              const Column(
                children: [
                  Text(
                    'Via Email',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff505050),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'priscilla.frank26@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff202244),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
