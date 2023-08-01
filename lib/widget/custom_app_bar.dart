import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title});
  final String? title;
  @override
  Size get preferredSize => Size.fromHeight(Get.statusBarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.only(left: 10),
        child: Icon(
          Icons.arrow_back_rounded,
          size: 28,
        ),
      ),
      title: Text(title ?? ''),
    );
  }
}
