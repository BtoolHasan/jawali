// ════════════════════════════════════════════════════════════════
//  signup_screen.dart
//  View layer — MVVM.
//
//  Responsibilities:
//    ✓ Render UI from ViewModel state
//    ✓ Forward user events to ViewModel intents
//    ✗ No business logic
//    ✗ No validators (delegated to ViewModel)
//    ✗ No direct state mutation
//
//  To use: wrap with ChangeNotifierProvider<SignupViewModel>
//  in your router or parent widget.
// ════════════════════════════════════════════════════════════════

import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/features/auth/presentation/manager/signup_cubit/signup_viewmodel.dart';
import 'package:jawali/features/auth/presentation/views/widgets/app_text_field.dart';
import 'package:jawali/features/auth/presentation/views/widgets/login_link.dart';
import 'package:jawali/features/auth/presentation/views/widgets/passwort_field.dart';
import 'package:jawali/features/auth/presentation/views/widgets/role_toggle.dart';
import 'package:jawali/features/auth/presentation/views/widgets/sectionl_label.dart';
import 'package:jawali/features/auth/presentation/views/widgets/signup_header.dart';
import 'package:jawali/features/auth/presentation/views/widgets/signup_logo.dart';
import 'package:jawali/features/auth/presentation/views/widgets/submit_button.dart';
import 'package:jawali/features/auth/presentation/views/widgets/terms_row.dart';
import 'package:jawali/features/home/presentation/views/home_view.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  // Navigation callbacks — injected by router, not hard-coded.
  final VoidCallback onLoginTap;
  final VoidCallback onTermsTap;
  final VoidCallback onPrivacyTap;

  const SignupScreen({
    super.key,
    required this.onLoginTap,
    required this.onTermsTap,
    required this.onPrivacyTap,
  });

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Controllers live in the View because they are UI concerns (cursor,
  // selection). The ViewModel reads values only when onSubmit is called.
  final _formKey = GlobalKey<FormState>();
  final _fullNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  @override
  void dispose() {
    _fullNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmCtrl.dispose();
    super.dispose();
  }

  // ── Submit ────────────────────────────────────────────────────
  void _onSubmit(SignupViewModel vm) {
    final isValid = _formKey.currentState?.validate() ?? false;
    vm.onSubmit(formIsValid: isValid);
  }

  // ── Build ────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SignupViewModel(),
      child: Consumer<SignupViewModel>(
        builder: (context, vm, _) {
          // React to success / failure
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _handleStatusChange(vm);
          });

          return Scaffold(
            backgroundColor: const Color(0xFFF0F9FF),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.xxl,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ── Logo & Header ─────────────────────────
                      const SignupLogo(),
                      const SizedBox(height: 20),
                      const SignupHeader(),
                      const SizedBox(height: AppSpacing.lg),

                      // ── Role Toggle ───────────────────────────
                      RoleToggle(
                        initialRole: vm.role,
                        onChanged: vm.onRoleChanged,
                      ),
                      const SizedBox(height: AppSpacing.xl),

                      // ── Full Name ─────────────────────────────
                      const SectionLabel('FULL NAME'),
                      const SizedBox(height: AppSpacing.sm),
                      AppTextField(
                        controller: _fullNameCtrl,
                        hint: 'Enter your full name',
                        prefixIcon: Icons.person_outline_rounded,
                        validator: SignupViewModel.validateFullName,
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // ── Email ────────────────────────────────
                      const SectionLabel('EMAIL ADDRESS'),
                      const SizedBox(height: AppSpacing.sm),
                      AppTextField(
                        controller: _emailCtrl,
                        hint: 'name@example.com',
                        prefixIcon: Icons.mail_outline_rounded,
                        keyboardType: TextInputType.emailAddress,
                        validator: SignupViewModel.validateEmail,
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // ── Phone ────────────────────────────────
                      const SectionLabel('PHONE NUMBER'),
                      const SizedBox(height: AppSpacing.sm),
                      AppTextField(
                        controller: _phoneCtrl,
                        hint: '+1 (555) 000-0000',
                        prefixIcon: Icons.phone_outlined,
                        keyboardType: TextInputType.phone,
                        validator: SignupViewModel.validatePhone,
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // ── Password ─────────────────────────────
                      const SectionLabel('PASSWORD'),
                      const SizedBox(height: AppSpacing.sm),
                      PasswordField(
                        controller: _passwordCtrl,
                        obscure: vm.obscurePassword,
                        onToggle: vm.onTogglePassword,
                        validator: SignupViewModel.validatePassword,
                      ),
                      const SizedBox(height: AppSpacing.md),

                      // ── Confirm Password ──────────────────────
                      const SectionLabel('CONFIRM PASSWORD'),
                      const SizedBox(height: AppSpacing.sm),
                      PasswordField(
                        controller: _confirmCtrl,
                        obscure: vm.obscureConfirm,
                        onToggle: vm.onToggleConfirm,
                        validator:
                            (v) => vm.validateConfirm(v, _passwordCtrl.text),
                      ),
                      const SizedBox(height: 20),

                      // ── Terms ─────────────────────────────────
                      TermsRow(
                        agreed: vm.agreedToTerms,
                        onChanged: vm.onTermsChanged,
                        onTermsTap: widget.onTermsTap,
                        onPrivacyTap: widget.onPrivacyTap,
                      ),

                      // ── Global error (terms / server) ─────────
                      if (vm.errorMessage != null) ...[
                        const SizedBox(height: 10),
                        _ErrorBanner(message: vm.errorMessage!),
                      ],

                      const SizedBox(height: AppSpacing.xl),

                      // ── Submit ───────────────────────────────
                      SubmitButton(
                        isLoading: vm.isLoading,
                        onTap: () => _onSubmit(vm),
                        text: "Create Account",
                      ),
                      const SizedBox(height: AppSpacing.lg),

                      // ── Login Link ───────────────────────────
                      LoginLink(
                        onTap: widget.onLoginTap,
                        text1: 'Already have an account? ',
                        text2: 'Login',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // ── Status Side-Effects ───────────────────────────────────────
  SignupStatus? _lastStatus;

  void _handleStatusChange(SignupViewModel vm) {
    if (vm.status == _lastStatus) return;
    _lastStatus = vm.status;

    switch (vm.status) {
      case SignupStatus.success:
        // TODO: navigate to home / onboarding
        break;
      case SignupStatus.failure:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(vm.errorMessage ?? 'Something went wrong.'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
            ),
          ),
        );
        break;
      default:
        break;
    }
  }
}

// ── Error Banner ─────────────────────────────────────────────────
class _ErrorBanner extends StatelessWidget {
  final String message;
  const _ErrorBanner({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.error.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppRadius.sm),
        border: Border.all(color: AppColors.error.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          const Icon(Icons.info_outline, color: AppColors.error, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(fontSize: 12, color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }
}
