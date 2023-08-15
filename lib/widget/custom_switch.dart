import 'package:flutter/material.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({super.key, this.value = false, required this.onTap});
  final bool value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        width: 52,
        height: 32,
        decoration: BoxDecoration(
          color: const Color(0xffE8F1FF),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color.fromARGB(255, 212, 215, 218),
            width: 2,
          ),
        ),
        child: Align(
          alignment:
              value == true ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 22,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff0961F5),
            ),
          ),
        ),
      ),
    );
  }
}
