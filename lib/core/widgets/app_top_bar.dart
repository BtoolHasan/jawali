import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onNotificationTap;

  const AppTopBar({super.key, this.onNotificationTap});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leadingWidth: 44,
      leading: Builder(
        builder:
            (ctx) => IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                color: AppColors.cyanDark,
                size: 22,
              ),
              onPressed: () => Scaffold.of(ctx).openDrawer(),
              tooltip: 'Menu',
            ),
      ),
      title: Image.asset(
        'assets/images/logo.png',

        height: 50,
        fit: BoxFit.contain,
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.cyanDark,
            size: 22,
          ),
          onPressed: onNotificationTap,
          tooltip: 'Notifications',
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
