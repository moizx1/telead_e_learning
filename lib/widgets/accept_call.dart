import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/dashboard/inbox/voice_call_screen.dart';

class AcceptCall extends StatelessWidget {
  const AcceptCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 62,
              width: 62,
              decoration: const BoxDecoration(
                  color: Colors.green, shape: BoxShape.circle),
              child: IconButton(
                onPressed: () {
                  Get.off(VoiceCallScreen());
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
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
