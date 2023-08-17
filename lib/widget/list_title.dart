import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({super.key, this.title, this.trailingText, this.onTap});
  final String? title;
  final String? trailingText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? '',
          style: const TextStyle(
            color: Color(0xff202244),
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            trailingText != null ? trailingText ?? '' : 'SEE ALL >',
            style: const TextStyle(
              color: Color(0xff0961F5),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
