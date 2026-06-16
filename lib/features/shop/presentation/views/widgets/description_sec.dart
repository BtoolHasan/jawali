
// ── DescriptionSec ───────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

class DescriptionSec extends StatefulWidget {
  final String name;
  final double price;
  final double rating;
  final int reviewCount;
  final String description;

  const DescriptionSec({
    super.key,
    required this.name,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.description,
  });

  @override
  State<DescriptionSec> createState() => _DescriptionSecState();
}

class _DescriptionSecState extends State<DescriptionSec> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name + Price
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(widget.name, style: AppTextStyles.screenTitle),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  '\$${widget.price.toStringAsFixed(0)}',
                  style: AppTextStyles.screenTitle.copyWith(
                    color: AppColors.cyan,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            // Stars + rating count
            Row(
              children: [
                _StarDisplay(rating: widget.rating),
                const SizedBox(width: 6),
                Text(
                  widget.rating.toStringAsFixed(1),
                  style: AppTextStyles.label.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            const Divider(color: AppColors.border, height: 1),
            const SizedBox(height: AppSpacing.md),
            // Description title
            Text('Description', style: AppTextStyles.subtitle.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            )),
            const SizedBox(height: 6),
            // Description text
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 250),
              crossFadeState: _expanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              firstChild: Text(
                widget.description,
                style: AppTextStyles.bodySmall,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              secondChild: Text(
                widget.description,
                style: AppTextStyles.bodySmall,
              ),
            ),
            const SizedBox(height: 4),
            GestureDetector(
              onTap: () => setState(() => _expanded = !_expanded),
              child: Text(
                _expanded ? 'Read Less ↑' : 'Read More ↓',
                style: AppTextStyles.link,
              ),
            ),
          ],
        ),
      );
}

// ── _StarDisplay (helper) ─────────────────────────────────────────
class _StarDisplay extends StatelessWidget {
  final double rating;
  const _StarDisplay({required this.rating});

  @override
  Widget build(BuildContext context) => Row(
        children: List.generate(5, (i) {
          final filled = i < rating.floor();
          final half = !filled && i < rating;
          return Icon(
            half
                ? Icons.star_half_rounded
                : filled
                    ? Icons.star_rounded
                    : Icons.star_outline_rounded,
            color: AppColors.cyan,
            size: 18,
          );
        }),
      );
}
