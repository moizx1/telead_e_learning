import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:telead_e_learning/controller/start_controller.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StartController>(
      init: StartController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Color(0xFFF5F9FF),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Text('Skip'),
                ),
              ),
              Expanded(child: PageView(children: []),),
              Expanded(
                child: Row(
                  children: [
                    DotsIndicator(
                      dotsCount: controller.totalDots,
                      position: controller.currentPosition,
                      axis: Axis.horizontal,
                      reversed: false,
                    ),
                    FloatingActionButton(
                      backgroundColor: const Color(0xFF0961F5),
                      shape: const CircleBorder(),
                      onPressed: () {
                        controller.onNextPressed();
                      },
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
        );
      },
    );
  }
}
