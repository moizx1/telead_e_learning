import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showSearchIcon = false,
    this.tabBar,
    this.color,
    this.trailing,
    this.statusBarHeight,
    this.onPressed,
  });
  final String? title;
  final Color? color;
  final VoidCallback? onPressed;
  final bool? showSearchIcon;
  final PreferredSizeWidget? tabBar;
  final Widget? trailing;
  final double? statusBarHeight;
  @override
  Size get preferredSize => Size.fromHeight(
        tabBar == null && statusBarHeight == null
            ? Get.statusBarHeight
            : statusBarHeight ?? 120,
      );
  @override
  Widget build(BuildContext context) {
    return AppBar(
        // toolbarHeight: 226,
        backgroundColor: color,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: onPressed ?? () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 28,
            ),
          ),
        ),
        title: Text(title ?? ''),
        actions: [
          if (trailing != null)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: trailing ?? const SizedBox(),
            ),
          if (showSearchIcon == true && showSearchIcon != null)
            const Padding(
              padding: EdgeInsets.only(right: 24),
              child: Icon(Icons.search_rounded, size: 24),
            ),
        ],
        bottom: tabBar);
  }
}
