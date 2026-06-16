import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/core/widgets/app_button_nav_bar.dart';
import 'package:jawali/core/widgets/app_top_bar.dart';
import 'package:jawali/features/shop/presentation/views/widgets/cart_body.dart';

class CartView extends StatelessWidget {
  static const name = '/cart';
 
  const CartView({super.key});
 
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppTopBar(onNotificationTap: () {}),
        bottomNavigationBar: const AppBottomNavBar(currentIndex: 2),
        body: const CartBody(),
      );
}
