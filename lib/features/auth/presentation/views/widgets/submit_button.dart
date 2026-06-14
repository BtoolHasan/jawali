// ── Submit Button ────────────────────────────────────────────────
// Flash animation on tap — subtle ripple feel without being heavy.
import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

class SubmitButton extends StatefulWidget {
  final bool isLoading;
  final VoidCallback onTap;
  final String text;

  const SubmitButton({super.key, required this.isLoading, required this.onTap, required this.text});

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _flashCtrl;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _flashCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 160),
    );
    _opacity = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.65), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.65, end: 1.0), weight: 1),
    ]).animate(CurvedAnimation(parent: _flashCtrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _flashCtrl.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    if (widget.isLoading) return;
    await _flashCtrl.forward(from: 0); // play flash
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: FadeTransition(
        opacity: _opacity,
        child: Container(
          height: 52,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.cyan, AppColors.cyanDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: [
              BoxShadow(
                color: AppColors.cyan.withOpacity(0.28),
                blurRadius: 14,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          alignment: Alignment.center,
          child:
              widget.isLoading
                  ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                  : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.text, style: AppTextStyles.buttonLabel),
                      const SizedBox(width: AppSpacing.sm),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColors.white,
                        size: 20,
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
