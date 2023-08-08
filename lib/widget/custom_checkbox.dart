import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({super.key, this.isChecked = false});
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return isChecked
        ? Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: const Color(0xff50B748),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 14,
            ),
          )
        : const Icon(
            Icons.crop_square_outlined,
            color: Color(0xff167F71),
            size: 22,
          );
  }
}
