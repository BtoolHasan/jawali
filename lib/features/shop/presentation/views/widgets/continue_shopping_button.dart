
// ── ContinueShoppingButton ────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/features/home/presentation/views/home_view.dart';

class ContinueShoppingButton extends StatelessWidget {
  const ContinueShoppingButton({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton.icon(
            onPressed: () => Navigator.pushReplacementNamed(
              context,
              HomeView.name,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.cyan,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.xl),
              ),
            ),
            icon: const Icon(Icons.arrow_forward_rounded, size: 20),
            label: Text('Continue Shopping', style: AppTextStyles.buttonLabel),
          ),
        ),
      );
}