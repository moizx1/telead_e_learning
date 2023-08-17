import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar(
      {super.key, this.showLeadingIcon, this.hintText, this.trailingIcon, this.onTap});
  final bool? showLeadingIcon;
  final String? hintText;
  final IconData? trailingIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onTap: onTap,
      elevation: const MaterialStatePropertyAll(2.5),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
      surfaceTintColor: const MaterialStatePropertyAll(Color(0xffFFFFFF)),
      leading: showLeadingIcon == true && showLeadingIcon != null
          ? const Icon(Icons.search_rounded)
          : null,
      hintText: hintText,
      hintStyle: const MaterialStatePropertyAll(
        TextStyle(
            color: Color(0xffB4BDC4),
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
      trailing: <Widget>[
        Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff0961F5)),
          child: Icon(
            trailingIcon,
            color: const Color(0xffE8F1FF),
            size: 22,
          ),
        ),
      ],
    );
  }
}
