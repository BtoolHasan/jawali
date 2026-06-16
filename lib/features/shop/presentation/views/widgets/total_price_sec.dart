
// ── TotalPriceSec ─────────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

class TotalPriceSec extends StatelessWidget {
  final double subtotal;
  final double discount;

  const TotalPriceSec({
    super.key,
    required this.subtotal,
    this.discount = 0,
  });

  @override
  Widget build(BuildContext context) {
    final total = subtotal - discount;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          _PriceRow(
            label: 'Subtotal',
            value: '\$${subtotal.toStringAsFixed(2)}',
            labelStyle: AppTextStyles.bodySmall,
            valueStyle: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (discount > 0) ...[
            const SizedBox(height: 8),
            _PriceRow(
              label: 'Discount',
              value: '-\$${discount.toStringAsFixed(2)}',
              labelStyle: AppTextStyles.bodySmall,
              valueStyle: AppTextStyles.bodySmall.copyWith(
                color: AppColors.success,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Divider(color: AppColors.border, height: 1),
          ),
          _PriceRow(
            label: 'Total Price',
            value: '\$${total.toStringAsFixed(2)}',
            labelStyle: AppTextStyles.inputText.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            valueStyle: AppTextStyles.screenTitle.copyWith(
              color: AppColors.cyan,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle labelStyle;
  final TextStyle valueStyle;

  const _PriceRow({
    required this.label,
    required this.value,
    required this.labelStyle,
    required this.valueStyle,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: labelStyle),
          Text(value, style: valueStyle),
        ],
      );
}
