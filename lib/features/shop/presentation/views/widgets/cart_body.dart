// ── CartBody ──────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:jawali/core/providers/cart_provider.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/features/shop/presentation/views/order_confirmed_view.dart';
import 'package:jawali/features/shop/presentation/views/widgets/checkout_button.dart';
import 'package:jawali/features/shop/presentation/views/widgets/total_price_sec.dart';
import 'package:jawali/features/shop/presentation/views/widgets/your_item_list.dart';
import 'package:provider/provider.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});
 
  void _emptyCart(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        title: Text(
          'Empty Cart',
          style: AppTextStyles.inputText.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
        content: Text(
          'Are you sure you want to remove all items from your cart?',
          style: AppTextStyles.bodySmall,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text('Cancel',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w600,
                )),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text('Yes, Empty',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w700,
                )),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed == true) context.read<CartProvider>().clear();
    });
  }
 
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final items = cart.items;
 
    return Column(
      children: [
        Expanded(
          child: items.isEmpty
              ? _EmptyState()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: AppSpacing.sm),
                      YourItemsList(
                        items: items,
                        onEmptyCart: () => _emptyCart(context),
                        onRemove: (id) =>
                            context.read<CartProvider>().remove(id),
                        onIncrement: (id) =>
                            context.read<CartProvider>().increment(id),
                        onDecrement: (id) =>
                            context.read<CartProvider>().decrement(id),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      TotalPriceSec(subtotal: cart.subtotal),
                      const SizedBox(height: AppSpacing.sm),
                    ],
                  ),
                ),
        ),
        if (items.isNotEmpty)
          CheckoutButton(
            onTap: () => Navigator.pushNamed(
              context,
              OrderConfirmedView.name,
              arguments: {
                'items': items,
                'orderNumber': 'JW-10293',
                'deliveryFrom': 'Oct 24',
                'deliveryTo': 'Oct 26',
              },
            ),
          ),
      ],
    );
  }
}
 
class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart_outlined,
                size: 80, color: AppColors.border),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Your cart is empty',
              style: AppTextStyles.subtitle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Text('Add items to get started', style: AppTextStyles.bodySmall),
          ],
        ),
      );
}