// ── Eye Toggle ───────────────────────────────────────────────────
// Switches between visibility_off ↔ visibility icon on tap.
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

class EyeToggle extends StatelessWidget {
  final bool obscure;
  final VoidCallback onTap;

  const EyeToggle({super.key, required this.obscure, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder:
            (child, anim) => FadeTransition(opacity: anim, child: child),
        child: Icon(
          obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          key: ValueKey(obscure), // required for AnimatedSwitcher to diff
          color: AppColors.textMuted,
          size: 20,
        ),
      ),
      splashRadius: 18,
    );
  }
}