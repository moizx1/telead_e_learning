import 'package:flutter/material.dart';
import 'package:telead_e_learning/widgets/custom_checkbox.dart';

class LanguageRadioTile extends StatelessWidget {
  const LanguageRadioTile(
      {super.key,
      required this.language,
      this.isChecked = true,
      required this.onChanged});
  final String language;
  final bool? isChecked;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          language,
          style: const TextStyle(
            color: Color(0xff202244),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        Container(),
        CustomCheckBox.square(isChecked: isChecked,onChanged: onChanged),

      ],
    );
  }
}
