

// ── Terms Row ────────────────────────────────────────────────────
// Checkbox auto-ticks on Terms tap; blocks submit until agreed.
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

class TermsRow extends StatelessWidget {
  final bool agreed;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyTap;

  const TermsRow({
    super.key,
    required this.agreed,
    required this.onChanged,
    required this.onTermsTap,
    required this.onPrivacyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 22,
          height: 22,
          child: Checkbox(
            value: agreed,
            onChanged: onChanged,
            activeColor: AppColors.cyan,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            side: const BorderSide(color: AppColors.border, width: 1.5),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.bodySmall,
              children: [
                const TextSpan(
                  text: "By creating an account, I agree to Jawali's ",
                ),
                // Tapping "Terms of Service" also ticks the checkbox
                TextSpan(
                  text: 'Terms of Service',
                  style: AppTextStyles.link,
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          onChanged(
                            !agreed
                                ? true
                                : agreed
                                ? null
                                : true,
                          );
                          onTermsTap();
                        },
                ),
                const TextSpan(text: ' and '),
                TextSpan(
                  text: 'Privacy Policy',
                  style: AppTextStyles.link,
                  recognizer:
                      TapGestureRecognizer()
                        ..onTap = () {
                          onChanged(
                            !agreed
                                ? true
                                : agreed
                                ? null
                                : true,
                          );
                          onPrivacyTap();
                        },
                ),
                const TextSpan(text: '.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
