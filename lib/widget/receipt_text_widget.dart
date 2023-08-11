import 'package:flutter/material.dart';

class ReceiptTextWidget extends StatelessWidget {
  const ReceiptTextWidget({super.key, this.title, this.value, this.trailing});
  final String? title, value;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (title != null)
          Text(
            title!,
            style: const TextStyle(
              color: Color(0xff202244),
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        Row(
          children: [
            if (value != null)
              Text(
                value!,
                style: const TextStyle(
                  color: Color(0xff545454),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            const SizedBox(width: 6),
            trailing ?? const SizedBox(),
          ],
        ),
      ],
    );
  }
}
