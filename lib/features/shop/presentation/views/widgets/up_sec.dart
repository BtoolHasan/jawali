import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

// ── UpSec ─────────────────────────────────────────────────────────
class UpSec extends StatelessWidget {
  final VoidCallback onEmptyCart;

  const UpSec({super.key, required this.onEmptyCart});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.sm,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'YOUR ITEMS',
                  style: AppTextStyles.label,
                ),
                const SizedBox(height: 2),
                Text(
                  'Shopping Cart',
                  style: AppTextStyles.screenTitle,
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: onEmptyCart,
              child: Row(
                children: [
                  const Icon(
                    Icons.delete_outline_rounded,
                    color: AppColors.error,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Empty Cart',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.error,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
