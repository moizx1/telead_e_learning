import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.hintText,
      this.isTextVisible = false,
      this.onPress,
      this.prefixIcon,
      this.suffixIcon});
  final String? hintText;
  final bool isTextVisible;
  final VoidCallback? onPress;
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
          obscureText: isTextVisible,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 7.5),
              child: Icon(
                prefixIcon,
                size: 25,
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 7.5),
              child: IconButton(
                onPressed: onPress,
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
            contentPadding: const EdgeInsets.only(right: 10),
          ),
        ),
      ),
    );
  }
}
