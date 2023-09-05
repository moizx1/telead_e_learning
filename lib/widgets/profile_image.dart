import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      // fit: StackFit.expand,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: CircleAvatar(
            backgroundColor: const Color(0xffE8F1FF),
            child: ClipOval(
              child: Image.asset("assets/images/dummyProfile.png"),
            ),
          ),
        ),
        Positioned(
            bottom: -7.5,
            right: -27.5,
            child: RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: const Color(0xff167F71),
              padding: const EdgeInsets.all(0.0),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.edit,
                color: Colors.white,
                size: 14,
              ),
            )),
      ],
    );
  }
}
