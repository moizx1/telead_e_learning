import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widgets/custom_checkbox.dart';
import 'package:telead_e_learning/widgets/custom_rich_text.dart';
import 'package:telead_e_learning/widgets/custom_button.dart';
import 'package:telead_e_learning/widgets/custom_text_field.dart';

import '../../controllers/auth/login_controller.dart';
import '../../widgets/auth_button.dart';

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
              child: controller.isLoading == true
                  ? const Center(child: CircularProgressIndicator())
                  : Padding(
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
                          CustomTextField(
                              hintText: 'Email',
                              prefixIcon: Icons.email_outlined,
                              onChanged: controller.onEmailChanged),
                          SizedBox(height: spacing * 2),
                          CustomTextField(
                              hintText: 'Password',
                              prefixIcon: Icons.lock_outline_rounded,
                              suffixIcon: controller.isTextVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              isObsecure: controller.isTextVisible,
                              onSuffixPress: controller.toggleVisibility,
                              onChanged: controller.onPasswordChanged),
                          SizedBox(height: spacing * 2),
                          Row(
                            children: [
                              InkWell(
                                onTap: controller.toggleCheckBox,
                                child: CustomCheckBox.circle(
                                    isChecked: controller.isChecked),
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
                                      onTap: controller.onForgotTap,
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
                          CustomButton(
                              label: 'Sign In', onPress: controller.onSignIn),
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
                              InkWell(
                                  onTap: controller.googleSignIn,
                                  child: AuthButton(
                                      iconPath:
                                          'assets/images/googleLogo.png')),
                              AuthButton(
                                  iconPath: 'assets/images/appleLogo.png'),
                              const SizedBox(),
                            ],
                          ),
                          SizedBox(height: spacing * 5),
                          CustomRichText(
                            text: 'Don\'t have an Account? ',
                            buttonText: 'SIGN UP',
                            onTap: controller.onSignUpTap,
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
