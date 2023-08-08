import 'package:flutter/material.dart';

class CustomToggleButtons extends StatelessWidget {
  const CustomToggleButtons(
      {super.key,
      this.title1,
      this.title2,
      this.onTap1,
      this.onTap2,
      this.currentSelectedCategory});
  final String? title1, title2;
  final int? currentSelectedCategory;
  final void Function()? onTap1, onTap2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTap1,
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: currentSelectedCategory == 0
                      ? const Color(0xff167F71)
                      : const Color(0xffE8F1FF),
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.center,
              child: Text(
                title1 ?? '',
                style: TextStyle(
                  color: currentSelectedCategory == 0
                      ? Colors.white
                      : const Color(0xff202244),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: GestureDetector(
            onTap: onTap2,
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: currentSelectedCategory == 1
                    ? const Color(0xff167F71)
                    : const Color(0xffE8F1FF),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                title2 ?? '',
                style: TextStyle(
                  color: currentSelectedCategory == 1
                      ? Colors.white
                      : const Color(0xff202244),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
