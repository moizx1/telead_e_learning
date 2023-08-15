import 'package:flutter/material.dart';

import 'custom_switch.dart';

class LabelledSwitchRow extends StatelessWidget {
  const LabelledSwitchRow(
      {super.key, this.title, this.switchValue, this.switchTap});
  final String? title;
  final bool? switchValue;
  final VoidCallback? switchTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title ?? '',
          style: const TextStyle(
            color: Color(0xff202244),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Switch(value: true, onChanged: (onChanged) {}),
        CustomSwitch(
          value: switchValue ?? false,
          onTap: switchTap,
        ),
      ],
    );
  }
}
