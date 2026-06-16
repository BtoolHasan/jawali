import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/core/widgets/app_button_nav_bar.dart';
import 'package:jawali/core/widgets/app_top_bar.dart';
import 'package:jawali/features/shop/data/models/cart_item.dart';
import 'package:jawali/features/shop/presentation/views/widgets/order_confirmed_body.dart';

// ── OrderConfirmedView ────────────────────────────────────────────
class OrderConfirmedView extends StatelessWidget {
  static const name = '/order-confirmed';

  /// البيانات القادمة من صفحة Cart
  final List<CartItem> items;
  final String orderNumber;
  final String deliveryFrom;
  final String deliveryTo;

  const OrderConfirmedView({
    super.key,
    required this.items,
    this.orderNumber = 'JW-10293',
    this.deliveryFrom = 'Oct 24',
    this.deliveryTo = 'Oct 26',
  });

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.white,
    appBar: AppTopBar(onNotificationTap: () {}),
    bottomNavigationBar: const AppBottomNavBar(currentIndex: 3),
    body: OrderConfirmedBody(
      items: items,
      orderNumber: orderNumber,
      deliveryFrom: deliveryFrom,
      deliveryTo: deliveryTo,
    ),
  );
}
