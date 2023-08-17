import 'package:flutter/material.dart';

import 'custom_switch.dart';

class LabelledSwitchRow extends StatelessWidget {
  const LabelledSwitchRow(
      {super.key,
      this.title,
      this.switchValue,
      this.switchTap,
      this.switchEnabled = true});
  final String? title;
  final bool? switchValue, switchEnabled;
  final Function(bool)? switchTap;

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
          value: switchValue,
          onTap: switchTap,
          enabled: switchEnabled,
        ),
      ],
    );
  }
}
