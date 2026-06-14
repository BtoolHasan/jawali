import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

import '../../../data/models/home_model.dart';

class PhoneCard extends StatelessWidget {
  final PhoneModel phone;
  final VoidCallback? onTap;

  const PhoneCard({super.key, required this.phone, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.border,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border, width: 0.8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Image area ─────────────────────────────────
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.inputBg,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.phone_android_rounded,
                        color: AppColors.cyanDark,
                        size: 52,
                      ),
                      // TODO: replace with Image.asset(phone.imageUrl)
                    ),
                  ),

                  // Stock badge
                  Positioned(
                    top: 8,
                    left: 8,
                    child: _StockBadge(inStock: phone.inStock),
                  ),

                  // Add to cart button
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: _CartButton(onTap: () {}),
                  ),
                ],
              ),
            ),

            // ── Info area ──────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    phone.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Color(0xFFF59E0B),
                        size: 13,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '${phone.rating} (${phone.reviewCount})',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 10,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${phone.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF06B6D4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StockBadge extends StatelessWidget {
  final bool inStock;

  const _StockBadge({required this.inStock});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color:
            inStock
                ? const Color(0xFF16A34A).withOpacity(0.9)
                : const Color(0xFFDC2626).withOpacity(0.9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        inStock ? 'IN STOCK' : 'SOLD OUT',
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 8,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

class _CartButton extends StatelessWidget {
  final VoidCallback onTap;

  const _CartButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: const Color(0xFF2563EB),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.shopping_cart_outlined,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}
