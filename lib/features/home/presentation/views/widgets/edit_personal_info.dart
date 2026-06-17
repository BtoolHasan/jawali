import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jawali/core/utils/constant.dart';

class EditPersonalInfo extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;

  const EditPersonalInfo({
    super.key,
    required this.nameController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Section header ────────────────────────────────────
        const Text(
          'Personal Information',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.cyanDark,
          ),
        ),
        const SizedBox(height: 14),

        // ── Full Name field ───────────────────────────────────
        _ProfileField(
          label: 'Full Name',
          controller: nameController,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          prefixIcon: Icons.person_outline_rounded,
        ),
        const SizedBox(height: 12),

        // ── Phone Number field ────────────────────────────────
        _ProfileField(
          label: 'Phone Number',
          controller: phoneController,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9+\- ]'))],
          prefixIcon: Icons.phone_outlined,
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}

// ── Private field widget ──────────────────────────────────────────
class _ProfileField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final IconData prefixIcon;

  const _ProfileField({
    required this.label,
    required this.controller,
    required this.keyboardType,
    required this.prefixIcon,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: AppColors.cyanDark,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          textCapitalization: textCapitalization,
          inputFormatters: inputFormatters,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.cyanDark,
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon, color: AppColors.cyan, size: 18),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            filled: true,
            fillColor: AppColors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.border, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.cyan, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}