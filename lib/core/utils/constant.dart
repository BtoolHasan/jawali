/*
import 'package:flutter/material.dart';

// Colors
const kPrimeryColor = Color(0xff06b6d4);
const kWhiteColor = Color(0xffF4F4F8);
const kSecondaryColor = Color(0xff2563eb);
const kCardColor = Color(0xffEAEDFF);
const kTextColor = Color(0xff131B2E);
const kSecondaryTextColor = Color(0xff3D494C);
const kDangerColor = Color(0xffBA1A1A);
*/

// ════════════════════════════════════════════════════════════════
//  app_theme.dart
//  Design Tokens — single source of truth for the whole app.
//  Import this file wherever you need colors, spacing, or radius.
// ════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';

// ── Colors ───────────────────────────────────────────────────────
abstract class AppColors {
  // Brand
  static const cyan = Color(0xff06b6d4);
  static const cyanLight = Color(0xFFE0F9FA);
  static const cyanDark = Color(0xFF009DA5);

  // Text
  static const textPrimary = Color(0xff131B2E);
  static const textMuted = Color(0xFF8A93A2);

  // Surface
  static const white = Color(0xffF4F4F8);
  static const inputBg = Color(0xFFF7F9FC);
  static const border = Color(0xFFE4E8EE);

  // Semantic
  static const error = Color(0xffBA1A1A);
  static const success = Color(0xFF38A169);
}

// ── Radius ───────────────────────────────────────────────────────
abstract class AppRadius {
  static const double xs = 6;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 14;
  static const double xl = 20;
}

// ── Spacing ──────────────────────────────────────────────────────
abstract class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 28;
  static const double xxl = 32;
}

// ── Typography ───────────────────────────────────────────────────
abstract class AppTextStyles {
  static const _base = TextStyle(fontFamily: 'Cairo');

  static final screenTitle = _base.copyWith(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
    height: 1.2,
  );

  static final subtitle = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static final label = _base.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.textMuted,
    letterSpacing: 0.8,
  );

  static final inputText = _base.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static final hintText = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
  );

  static final buttonLabel = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    letterSpacing: 0.2,
  );

  static final roleTab = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static final bodySmall = _base.copyWith(
    fontSize: 13,
    color: AppColors.textMuted,
    height: 1.5,
  );

  static final link = _base.copyWith(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.cyan,
    decoration: TextDecoration.underline,
  );

  static final footerText = _base.copyWith(
    fontSize: 14,
    color: AppColors.textMuted,
  );

  static final footerLink = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.cyan,
  );
}

// ── Input Decoration Theme ────────────────────────────────────────
abstract class AppInputDecoration {
  static OutlineInputBorder _border(Color color, {double width = 1.0}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.md),
        borderSide: BorderSide(color: color, width: width),
      );

  static InputDecoration field({
    required String hint,
    required IconData prefixIcon,
    Widget? suffix,
  }) => InputDecoration(
    hintText: hint,
    hintStyle: AppTextStyles.hintText,
    prefixIcon: Icon(prefixIcon, color: AppColors.textMuted, size: 20),
    suffixIcon: suffix,
    filled: true,
    fillColor: AppColors.inputBg,
    contentPadding: const EdgeInsets.symmetric(
      vertical: 14,
      horizontal: AppSpacing.md,
    ),
    border: _border(AppColors.border),
    enabledBorder: _border(AppColors.border),
    focusedBorder: _border(AppColors.cyan, width: 1.5),
    errorBorder: _border(AppColors.error),
    focusedErrorBorder: _border(AppColors.error, width: 1.5),
    errorStyle: const TextStyle(fontSize: 11, color: AppColors.error),
  );
}
