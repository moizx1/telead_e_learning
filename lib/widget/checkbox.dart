import 'package:flutter/material.dart';
class CheckBox extends StatelessWidget {
  const CheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}