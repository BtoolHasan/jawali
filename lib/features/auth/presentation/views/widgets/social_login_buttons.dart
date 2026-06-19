import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawali/features/auth/presentation/manager/login_cubit/login_cubit.dart';

/// زر سوشيال واحد (Google أو Apple) مع دعم حالة التحميل
class _SocialButton extends StatelessWidget {
  final String label;
  final Widget logo;
  final bool isLoading;
  final VoidCallback onTap;

  const _SocialButton({
    required this.label,
    required this.logo,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: isLoading ? null : onTap,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 13),
          side: const BorderSide(color: Color(0xFFE2E8F0)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
        ),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF06B6D4)),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logo,
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(
                      color: Color(0xFF0F172A),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

/// ─── Google Logo SVG-free (حروف G بألوان Google) ────────────────────────────
class _GoogleLogo extends StatelessWidget {
  const _GoogleLogo();

  @override
  Widget build(BuildContext context) {
    // TODO: استبدل بـ SvgPicture.asset('assets/icons/google.svg') عند إضافة الأصول
    return const Text(
      'G',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF4285F4),
      ),
    );
  }
}

/// ─── Apple Logo ──────────────────────────────────────────────────────────────
class _AppleLogo extends StatelessWidget {
  const _AppleLogo();

  @override
  Widget build(BuildContext context) {
    // TODO: استبدل بـ Icon(Icons.apple) أو SvgPicture.asset('assets/icons/apple.svg')
    return const Icon(
      Icons.apple,
      size: 20,
      color: Color(0xFF0F172A),
    );
  }
}

/// ─── الكلاس الرئيسي المُصدَّر ────────────────────────────────────────────────
class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();

        return Column(
          children: [
            // ─── فاصل "Or continue with" ─────────────────────────
            Row(
              children: [
                const Expanded(child: Divider(color: Color(0xFFE2E8F0))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Or continue with',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: const Color(0xFF94A3B8),
                        ),
                  ),
                ),
                const Expanded(child: Divider(color: Color(0xFFE2E8F0))),
              ],
            ),
            const SizedBox(height: 16),

            // ─── Google + Apple ──────────────────────────────────
            /*
            Row(
              children: [
                _SocialButton(
                  label: 'Google',
                  logo: const _GoogleLogo(),
                  isLoading: state.isGoogleLoading,
                  onTap: cubit.onGoogleSignIn,
                ),
                const SizedBox(width: 12),
                _SocialButton(
                  label: 'Apple',
                  logo: const _AppleLogo(),
                  isLoading: state.isAppleLoading,
                  onTap: cubit.onAppleSignIn,
                ),
              ],
            ),
            */
          ],
        );
      },
    );
  }
}