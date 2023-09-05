import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.hintText,
      this.isObsecure,
      this.onTap,
      this.onSuffixPress,
      this.prefixIcon,
      this.suffixIcon,
      this.isReadOnly,
      this.controller,
      this.onChanged});
  final TextEditingController? controller;
  final String? hintText;
  final bool? isObsecure, isReadOnly;
  final VoidCallback? onSuffixPress, onTap;
  final void Function(String)? onChanged;
  final IconData? prefixIcon, suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Center(
        child: TextFormField(
          onChanged: onChanged,
          controller: controller,
          onTap: onTap,
          readOnly: isReadOnly ?? false,
          obscureText: isObsecure ?? false,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 7.5),
                    child: Icon(prefixIcon, size: 25),
                  )
                // : const Padding(padding: EdgeInsets.only(left: 1.5)),
                : null,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 7.5),
              child: IconButton(
                onPressed: onSuffixPress,
                icon: Icon(
                  suffixIcon,
                  size: 25,
                ),
              ),
            ),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff505050),
            ),
            contentPadding:
                EdgeInsets.only(left: prefixIcon == null ? 21 : 0, right: 10),
          ),
        ),
      ),
    );
  }
}
