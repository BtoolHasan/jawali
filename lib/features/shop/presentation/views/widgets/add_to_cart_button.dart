
// ── AddToCartButton ──────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

class AddToCartButton extends StatelessWidget {
  final VoidCallback? onTap;
  const AddToCartButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.sm,
          AppSpacing.md,
          AppSpacing.lg,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 54,
          child: ElevatedButton.icon(
            onPressed: onTap ?? () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.cyan,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.xl),
              ),
            ),
            icon: const Icon(Icons.shopping_cart_rounded, size: 22),
            label: Text('Add to Cart', style: AppTextStyles.buttonLabel),
          ),
        ),
      );
}