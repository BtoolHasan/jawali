import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/features/home/data/models/home_model.dart';
import 'package:jawali/features/shop/presentation/views/widgets/product_details_body.dart';
import 'package:jawali/features/shop/presentation/views/widgets/product_header.dart';
class ProductDetailsView extends StatelessWidget {
  static const name = '/product-details';

  final PhoneModel phone;

  const ProductDetailsView({
    super.key,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const ProductDetailsHeader(),
      body: ProductDetailsBody(phone: phone),
    );
  }
}