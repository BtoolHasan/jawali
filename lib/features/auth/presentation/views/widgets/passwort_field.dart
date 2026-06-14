// ── Password Field ───────────────────────────────────────────────
// Bundles AppTextField + EyeToggle for reuse across the app.
import 'package:flutter/material.dart';
import 'package:jawali/features/auth/presentation/views/widgets/app_text_field.dart';
import 'package:jawali/features/auth/presentation/views/widgets/eye_toggle.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final bool obscure;
  final VoidCallback onToggle;
  final String? Function(String?)? validator;

  const PasswordField({
    super.key,
    this.controller,
    this.hint = '••••••••',
    required this.obscure,
    required this.onToggle,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hint: hint,
      prefixIcon: Icons.lock_outline_rounded,
      obscureText: obscure,
      suffixIcon: EyeToggle(obscure: obscure, onTap: onToggle),
      validator: validator,
    );
  }
}
