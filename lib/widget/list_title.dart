import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  const ListTitle({super.key, this.title});
  final String? title;

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
        const Text(
          'SEE ALL >',
          style: TextStyle(
            color: Color(0xff0961F5),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
