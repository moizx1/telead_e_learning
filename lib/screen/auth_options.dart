import 'package:flutter/material.dart';
import 'package:telead_e_learning/widget/custom_button.dart';

class AuthOptions extends StatelessWidget {
  const AuthOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double spacing = screenHeight * 0.02;

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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Image.asset('assets/images/googleLogo.png'),
                          ),
                          const Text(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Image.asset('assets/images/appleLogo.png'),
                          ),
                          const Text(
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
                    const CustomButton(
                      isTextCenter: false,
                      label: 'Sign In with Your Account',
                    ),
                    SizedBox(height: spacing * 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an Account? ",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff545454)),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff0961F5),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
