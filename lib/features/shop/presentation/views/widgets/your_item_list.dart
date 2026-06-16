
// ── YourItemsList ─────────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:jawali/features/shop/data/models/cart_item.dart';
import 'package:jawali/features/shop/presentation/views/widgets/product_card.dart';
import 'package:jawali/features/shop/presentation/views/widgets/up_sec.dart';

class YourItemsList extends StatelessWidget {
  final List<CartItem> items;
  final VoidCallback onEmptyCart;
  final void Function(String id) onRemove;
  final void Function(String id) onIncrement;
  final void Function(String id) onDecrement;

  const YourItemsList({
    super.key,
    required this.items,
    required this.onEmptyCart,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UpSec(onEmptyCart: onEmptyCart),
          ...items.map(
            (item) => ProductCard(
              key: ValueKey(item.id),
              item: item,
              onRemove: () => onRemove(item.id),
              onIncrement: () => onIncrement(item.id),
              onDecrement: () => onDecrement(item.id),
            ),
          ),
        ],
      );
}