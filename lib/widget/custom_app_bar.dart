import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showSearchIcon = false,
    this.tabBar,
  });
  final String? title;
  final bool? showSearchIcon;
  final PreferredSizeWidget? tabBar;
  @override
  Size get preferredSize => Size.fromHeight(
        tabBar == null ? Get.statusBarHeight : 120,
      );
  @override
  Widget build(BuildContext context) {
    return AppBar(
        // toolbarHeight: 96,
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.arrow_back_rounded,
            size: 28,
          ),
        ),
        title: Text(title ?? ''),
        actions: showSearchIcon == true && showSearchIcon != null
            ? [
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: Icon(Icons.search_rounded),
                )
              ]
            : null,
        bottom: tabBar);
  }
}
