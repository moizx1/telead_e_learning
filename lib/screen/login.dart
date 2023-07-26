import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/controller/login_controller.dart';
import 'package:telead_e_learning/widget/checkbox.dart';
import 'package:telead_e_learning/widget/custom_rich_text.dart';
import 'package:telead_e_learning/widget/custom_button.dart';
import 'package:telead_e_learning/widget/custom_text_field.dart';

import '../widget/auth_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double spacing = screenHeight * 0.01;
    return GetBuilder<LoginController>(
        init: LoginController(),
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
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Let\'s Sign In!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff202244),
                        ),
                      ),
                    ),
                    SizedBox(height: spacing * 2),
                    const Text(
                      'Login to Your Account to Continue your Courses',
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
                      isObsecure: controller.isTextVisible,
                      onSuffixPress: controller.toggleVisibility,
                    ),
                    SizedBox(height: spacing * 2),
                    Row(
                      children: [
                        InkWell(
                          onTap: controller.toggleCheckBox,
                          child: CheckBox(isChecked: controller.isChecked),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'Remember Me',
                          style: TextStyle(
                            color: Color(0xff545454),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                                onTap: () {},
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Color(0xff545454),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                )),
                          ),
                        )
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
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(),
                        AuthButton(iconPath: 'assets/images/googleLogo.png'),
                        AuthButton(iconPath: 'assets/images/appleLogo.png'),
                        SizedBox(),
                      ],
                    ),
                    SizedBox(height: spacing * 5),
                    const CustomRichText(
                        text: 'Don\'t have an Account? ',
                        buttonText: 'SIGN UP'),
                    SizedBox(height: spacing * 2),
                  ],
                ),
              ),
            ),
          );
        });
  }
}