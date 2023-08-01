import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({super.key, this.onChanged});
  final void Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      flagsButtonPadding: const EdgeInsets.only(left: 10),
      dropdownIcon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        size: 28,
      ),
      dropdownIconPosition: IconPosition.trailing,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: 'Phone Number',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
      initialCountryCode: 'US',
      onChanged: onChanged,
    );
  }
}
