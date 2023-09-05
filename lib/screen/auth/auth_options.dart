import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/widget/auth_button.dart';
import 'package:telead_e_learning/widget/custom_button.dart';
import 'package:telead_e_learning/widget/custom_rich_text.dart';

import '../../controller/auth/auth_options_controller.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double spacing = screenHeight * 0.02;

    return GetBuilder<AuthOptionsController>(
        init: AuthOptionsController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: const Color(0xffF5F9FF),
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    flex: 3,
                    child: SizedBox(),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Let's you in",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff202244),
                            ),
                          ),
                          SizedBox(height: spacing * 2),
                          GestureDetector(
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AuthButton(
                                    iconPath: 'assets/images/googleLogo.png'),
                                Text(
                                  'Continue with Google',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xff545454),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: spacing),
                          GestureDetector(
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AuthButton(
                                    iconPath: 'assets/images/appleLogo.png'),
                                Text(
                                  'Continue with Apple   ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xff545454),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: spacing * 3),
                          const Text(
                            '(Or)',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff545454),
                            ),
                          ),
                          SizedBox(height: spacing * 2),
                          CustomButton(
                            isTextCenter: false,
                            label: 'Sign In with Your Account',
                            onPress: controller.onSignIn,
                          ),
                          SizedBox(height: spacing * 2),
                          CustomRichText(
                            text: "Don't have an Account? ",
                            buttonText: 'SIGN UP',
                            onTap: controller.onSignUp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
