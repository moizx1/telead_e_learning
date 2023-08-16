import 'package:flutter/material.dart';

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
        // Checkbox(value: false, onChanged: (onChanged) {}),
        Checkbox(
          activeColor: const Color(0xff167F71),
          // focusColor: const Color(0xff167F71),
          fillColor: isChecked == false
              ? const MaterialStatePropertyAll(Color(0xffE8F1FF))
              : null,
          side: const BorderSide(
            color: Color(0xffB4BDC4),
            width: 2,
          ),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          value: isChecked,
          onChanged: onChanged,
        ),
        // Radio<String>(
        //     value: value, groupValue: groupValue, onChanged: onChanged,)
      ],
    );
  }
}
