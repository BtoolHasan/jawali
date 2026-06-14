
// ── Login Link ───────────────────────────────────────────────────
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

class LoginLink extends StatelessWidget {
  final VoidCallback onTap;
  final String text1 ;
  final String text2 ;
  const LoginLink({super.key, required this.onTap,required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: AppTextStyles.footerText,
          children: [
            TextSpan(text: text1),
            TextSpan(
              text: text2,
              style: AppTextStyles.footerLink,
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
