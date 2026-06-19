import 'package:flutter/material.dart';
import 'package:jawali/core/providers/cart_provider.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/features/home/data/models/home_model.dart';
import 'package:jawali/features/shop/presentation/views/widgets/add_to_cart_button.dart';
import 'package:jawali/features/shop/presentation/views/widgets/description_sec.dart';
import 'package:jawali/features/shop/presentation/views/widgets/photo_sec.dart';
import 'package:jawali/features/shop/presentation/views/widgets/rating_sec.dart';
import 'package:provider/provider.dart';

class ProductDetailsBody extends StatelessWidget {
  final PhoneModel phone;
 
  const ProductDetailsBody({super.key, required this.phone});
 
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  PhotoSec(imageUrls: [phone.imageUrl]),
                  const SizedBox(height: 8),
                  DescriptionSec(
                    name: phone.name,
                    price: phone.price,
                    rating: phone.rating,
                    reviewCount: phone.reviewCount,
                    description:
                        'Experience the future of mobile technology with the '
                        '${phone.name}. Engineered for maximum performance and '
                        'efficiency with a stunning display and advanced camera '
                        'system. The aerospace-grade frame ensures durability '
                        'while maintaining a lightweight feel.',
                        
                  ),
                  const SizedBox(height: 8),
                  const RatingSec(),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
 
        
          AddToCartButton(
            onTap: () {
              context.read<CartProvider>().add(phone);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${phone.name} added to cart',
                    style: AppTextStyles.bodySmall
                        .copyWith(color: Colors.white),
                  ),
                  backgroundColor: AppColors.cyanDark,
                  duration: const Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                  ),
                ),
              );
            },
          ),
        ],
      );
}
 