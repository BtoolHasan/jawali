import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

 
// ── ProductDetailsHeader ─────────────────────────────────────────
class ProductDetailsHeader extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailsHeader({super.key});
 
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
 
  @override
  Widget build(BuildContext context) => AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            margin: const EdgeInsets.all(AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.inputBg,
              borderRadius: BorderRadius.circular(AppRadius.sm),
              border: Border.all(color: AppColors.border),
            ),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: AppColors.textPrimary,
              size: 18,
            ),
          ),
        ),
        title: Text('Product Details', style: AppTextStyles.screenTitle.copyWith(fontSize: 18)),
        centerTitle: false,
      );
}