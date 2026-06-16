
// ── RatingSec ────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

class RatingSec extends StatefulWidget {
  const RatingSec({super.key});

  @override
  State<RatingSec> createState() => _RatingSecState();
}

class _RatingSecState extends State<RatingSec> {
  int _selected = 0;

  static const _labels = ['', 'Poor', 'Fair', 'Good', 'Very Good', 'Excellent'];

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rate this Product',
              style: AppTextStyles.subtitle.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 2),
            Text('How would you rate this phone?', style: AppTextStyles.bodySmall),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: List.generate(5, (i) {
                final val = i + 1;
                return GestureDetector(
                  onTap: () => setState(() => _selected = val),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.only(right: 8),
                    child: Icon(
                      val <= _selected
                          ? Icons.star_rounded
                          : Icons.star_outline_rounded,
                      color: val <= _selected
                          ? AppColors.cyan
                          : AppColors.border,
                      size: 36,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 6),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _selected == 0
                  ? Text('Tap a star to rate', style: AppTextStyles.bodySmall, key: const ValueKey(0))
                  : Text(
                      '${_labels[_selected]} ($_selected/5)',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.cyan,
                        fontWeight: FontWeight.w600,
                      ),
                      key: ValueKey(_selected),
                    ),
            ),
          ],
        ),
      );
}
