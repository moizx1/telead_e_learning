import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/controller/register_controller.dart';
import 'package:telead_e_learning/widget/custom_button.dart';
import 'package:telead_e_learning/widget/custom_text_field.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double spacing = screenHeight * 0.01;
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: const Color(0xffF5F9FF),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: spacing * 10),
                    Image.asset('assets/images/TeleadLogo.png'),
                    SizedBox(height: spacing * 4),
                    const Text(
                      'Getting Started!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff202244),
                      ),
                    ),
                    SizedBox(height: spacing * 2),
                    const Text(
                      'Create an Account to Continue your all Courses',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff545454),
                      ),
                    ),
                    SizedBox(height: spacing * 6),
                    const CustomTextField(
                      hintText: 'Email',
                      prefixIcon: Icons.email_outlined,
                    ),
                    SizedBox(height: spacing * 2),
                    CustomTextField(
                      hintText: 'Password',
                      prefixIcon: Icons.lock_outline_rounded,
                      suffixIcon: controller.isTextVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      isTextVisible: controller.isTextVisible,
                      onPress: controller.toggleVisibility,
                    ),
                    SizedBox(height: spacing * 2),
                    Row(
                      children: [
                        Container(
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                            color: const Color(0xff50B748),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'Agree to Terms & Conditions',
                          style: TextStyle(
                            color: Color(0xff545454),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: spacing * 4),
                    const CustomButton(label: 'Sign Up'),
                    SizedBox(height: spacing * 2),
                    const Text(
                      'Or Continue With',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff545454),
                      ),
                    ),
                    SizedBox(height: spacing * 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(),
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Image.asset('assets/images/googleLogo.png'),
                        ),
                        Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Image.asset('assets/images/appleLogo.png'),
                        ),
                        const SizedBox(),
                      ],
                    ),
                    SizedBox(height: spacing * 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an Account? ",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff545454)),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0961F5),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: spacing * 2),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
