import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

// ── DeliveryDone ──────────────────────────────────────────────────
class DeliveryDone extends StatelessWidget {
  final String orderNumber;
  final String deliveryFrom;
  final String deliveryTo;

  const DeliveryDone({
    super.key,
    required this.orderNumber,
    required this.deliveryFrom,
    required this.deliveryTo,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SizedBox(height: AppSpacing.xl),

          // ── Check circle ──────────────────────────────────────
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.cyanLight,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 72,
                height: 72,
                decoration: const BoxDecoration(
                  color: AppColors.cyan,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 36,
                ),
              ),
              // Decorative dot top-right
              Positioned(
                top: 4,
                right: 8,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: AppColors.cyanDark,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSpacing.lg),

          // ── Thank You ─────────────────────────────────────────
          Text(
            'Thank You!',
            style: AppTextStyles.screenTitle.copyWith(fontSize: 28),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Your order #$orderNumber has been\nsuccessfully placed.',
            style: AppTextStyles.bodySmall.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: AppSpacing.lg),

          // ── Estimated Delivery card ───────────────────────────
          Container(
            margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.md,
            ),
            decoration: BoxDecoration(
              color: AppColors.inputBg,
              borderRadius: BorderRadius.circular(AppRadius.lg),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.cyanLight,
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                  child: const Icon(
                    Icons.local_shipping_outlined,
                    color: AppColors.cyan,
                    size: 22,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ESTIMATED DELIVERY',
                      style: AppTextStyles.label,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$deliveryFrom – $deliveryTo',
                      style: AppTextStyles.inputText.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),
        ],
      );
}
