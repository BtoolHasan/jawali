import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/features/home/presentation/views/home_view.dart';
import 'package:jawali/features/home/presentation/views/profile_view.dart';
import 'package:jawali/features/home/presentation/views/search_view.dart';
import 'package:jawali/features/shop/presentation/views/cart_view.dart';

/// Reusable bottom navigation bar for all screens.
/// Pass [currentIndex] to highlight the active tab.
/// Navigation is handled internally via [Navigator.pushReplacementNamed].
class AppBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  static const _items = [
    _NavItem(
      icon: Icons.home_outlined,
      activeIcon: Icons.home_rounded,
      label: 'Home',
      routeName: HomeView.name,
    ),
    _NavItem(
      icon: Icons.search_outlined,
      activeIcon: Icons.search_rounded,
      label: 'Search',
      routeName: SearchView.name,
    ),
    _NavItem(
      icon: Icons.shopping_cart_outlined,
      activeIcon: Icons.shopping_cart_rounded,
      label: 'Cart',
      routeName: CartView.name,
    ),
    _NavItem(
      icon: Icons.person_outline_rounded,
      activeIcon: Icons.person_rounded,
      label: 'Profile',
      routeName: ProfileView.name,
    ),
  ];

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.border, width: 0.5)),
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 60,
            child: Row(
              children: List.generate(
                _items.length,
                (i) => _NavButton(
                  item: _items[i],
                  isActive: currentIndex == i,
                  onTap: () {
                    // لا تتنقل إذا كنت على نفس الصفحة
                    if (currentIndex == i) return;
                    Navigator.pushReplacementNamed(
                      context,
                      _items[i].routeName,
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      );
}

// ── Models ────────────────────────────────────────────────────────
class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final String routeName;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.routeName,
  });
}

class _NavButton extends StatelessWidget {
  final _NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _NavButton({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Expanded(
        child: InkWell(
          onTap: onTap,
          splashColor: AppColors.cyan.withOpacity(0.08),
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  isActive ? item.activeIcon : item.icon,
                  key: ValueKey(isActive),
                  color: isActive ? AppColors.cyan : const Color(0xFF64748B),
                  size: 22,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                item.label,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 10,
                  fontWeight:
                      isActive ? FontWeight.w600 : FontWeight.w400,
                  color:
                      isActive ? AppColors.cyan : const Color(0xFF64748B),
                ),
              ),
            ],
          ),
        ),
      );
}