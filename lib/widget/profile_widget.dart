import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, this.leading, this.title, this.trailing});
  final IconData? leading;
  final Widget? trailing;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                leading,
                size: 26,
              ),
              const SizedBox(width: 10),
              Text(
                title ?? '',
                style: const TextStyle(
                  color: Color(0xff202244),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              trailing ?? const SizedBox(),
              const SizedBox(width: 7.5),
              const Icon(Icons.arrow_forward_ios_rounded, size: 24),
            ],
          ),
        ],
      ),
    );
  }
}
