import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/features/home/data/models/home_model.dart';
import 'package:jawali/features/shop/data/models/cart_item.dart';
import 'package:jawali/features/shop/presentation/views/widgets/product_details_body.dart';
import 'package:jawali/features/shop/presentation/views/widgets/product_header.dart';

class ProductDetailsView extends StatelessWidget {
  static const name = '/product-details';

  const ProductDetailsView({
    super.key,


  });

  @override
  Widget build(BuildContext context) {
    final phone = ModalRoute.of(context)!.settings.arguments as PhoneModel;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const ProductDetailsHeader(),
      body: ProductDetailsBody(phone: phone),
    );
  }
}
