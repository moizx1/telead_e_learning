import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.width,
      required this.label,
      this.isTextCenter = true,
      this.onPress});
  final String? label;
  final double? width;
  final bool isTextCenter;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(left: isTextCenter ? 7.5 : 28, right: 7.5),
        height: 60,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xff0961F5),
          borderRadius: BorderRadius.circular(30),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          if (isTextCenter) const SizedBox(width: 48),
          Text(
            label ?? 'label',
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.arrow_forward_rounded,
              size: 21.0,
              color: Color(0xff0961F5),
            ),
          ),
        ]),
      ),
    );
  }
}
