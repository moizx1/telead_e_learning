import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:telead_e_learning/widgets/custom_button.dart';
import '../../controllers/auth/start_controller.dart';
import '../../widgets/start_screen_content.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartController>(
      init: StartController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xFFF5F9FF),
          body: Padding(
            padding:
                const EdgeInsets.only(left: 28.0, right: 28.0, bottom: 10.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                        onPressed: controller.onSkip,
                        child: const Text(
                          'Skip',
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: PageView(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    children: const [
                      StartScreenWidget(
                          heading: 'Online Learning',
                          text:
                              'We Provide Classes, Onlone Classes and Pre-Recorded'),
                      StartScreenWidget(
                          heading: 'Learn From Anytime',
                          text: 'Booked or Save the Lectures for Future'),
                      StartScreenWidget(
                          heading: 'Get Online Certificate',
                          text: 'Analyse your scores and Track your results'),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DotsIndicator(
                        dotsCount: controller.totalDots,
                        position: controller.currentPosition,
                        axis: Axis.horizontal,
                        reversed: false,
                        decorator: DotsDecorator(
                          size: const Size.square(9.0),
                          color: const Color(0xffD5E2F5),
                          activeColor: const Color(0xff0961F5),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                      controller.currentPosition == 2
                          ? CustomButton(
                              label: 'Get Started',
                              width: 200.0,
                              isTextCenter: false,
                              onPress: controller.onNextPressed,
                            )
                          : FloatingActionButton(
                              backgroundColor: const Color(0xFF0961F5),
                              shape: const CircleBorder(),
                              onPressed: controller.onNextPressed,
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
