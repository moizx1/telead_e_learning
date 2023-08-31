import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telead_e_learning/controller/call_controller.dart';
import 'package:telead_e_learning/widget/custom_app_bar.dart';

class VoiceCallScreen extends StatelessWidget {
  VoiceCallScreen(
      {super.key,
      required this.boolHost,
      required this.boolJoined,
      required this.receiverId});
  bool boolHost, boolJoined;
  String receiverId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VoiceCallController>(
      init: VoiceCallController(isHost: boolHost, receiverId: receiverId),
      builder: (controller) {
        return Scaffold(
          appBar: CustomAppBar(),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(),
                Column(
                  children: [
                    Container(
                      height: 220,
                      width: 220,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Scott R. Shoemake',
                      style: TextStyle(
                        color: Color(0xff202244),
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '04:50 Minutes',
                      style: TextStyle(
                        color: Color(0xff545454),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(),
                boolJoined == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 62,
                            width: 62,
                            decoration: const BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                            child: IconButton(
                              onPressed: () {
                                boolJoined = true;
                                controller.update();
                                controller.join();
                                controller.update();
                              },
                              icon: const Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ),
                          Container(
                            height: 62,
                            width: 62,
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: IconButton(
                              onPressed: controller.leave,
                              icon: const Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(),
                          Container(
                            height: 62,
                            width: 62,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: const Color(0xffB4BDC4)),
                              shape: BoxShape.circle,
                              color: const Color(0xffE8F1FF),
                            ),
                            child: const Icon(
                              Icons.mic_off,
                              size: 26,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: 62,
                            width: 62,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffFF001E),
                            ),
                            child: IconButton(
                              onPressed: controller.leave,
                              icon: const Icon(Icons.phone,
                                  color: Colors.white, size: 26),
                            ),
                          ),
                          Container(
                            height: 62,
                            width: 62,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff0961F5),
                            ),
                            child: const Icon(
                                IconData(0xe6a9, fontFamily: 'MaterialIcons'),
                                color: Colors.white,
                                size: 26),
                          ),
                          const SizedBox(),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
