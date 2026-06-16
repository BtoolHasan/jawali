
// ── OrderConfirmedBody ────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/features/shop/data/models/cart_item.dart';
import 'package:jawali/features/shop/presentation/views/widgets/continue_shopping_button.dart';
import 'package:jawali/features/shop/presentation/views/widgets/delivery_done.dart';
import 'package:jawali/features/shop/presentation/views/widgets/order_summary.dart';

class OrderConfirmedBody extends StatelessWidget {
  final List<CartItem> items;
  final String orderNumber;
  final String deliveryFrom;
  final String deliveryTo;

  const OrderConfirmedBody({
    super.key,
    required this.items,
    required this.orderNumber,
    required this.deliveryFrom,
    required this.deliveryTo,
  });

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ① Thank You + Estimated Delivery
            DeliveryDone(
              orderNumber: orderNumber,
              deliveryFrom: deliveryFrom,
              deliveryTo: deliveryTo,
            ),

            // ② Order Summary
            OrderSummary(items: items),

            const SizedBox(height: AppSpacing.lg),

            // ③ Continue Shopping
            const ContinueShoppingButton(),

            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      );
}