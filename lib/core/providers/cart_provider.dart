import 'package:flutter/material.dart';
import 'package:jawali/features/home/data/models/home_model.dart';
import 'package:jawali/features/shop/data/models/cart_item.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  double get subtotal =>
      _items.fold(0, (sum, e) => sum + e.price * e.quantity);

  int get totalItems =>
      _items.fold(0, (sum, e) => sum + e.quantity);

  // ── Add ───────────────────────────────────────────────────────
  void add(PhoneModel phone) {
    final index = _items.indexWhere((e) => e.id == phone.id);
    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(
        id: phone.id,
        name: phone.name,
        subtitle: phone.name,
        price: phone.price,
        imageUrl: phone.imageUrl,
      ));
    }
    notifyListeners();
  }

  // ── Remove ────────────────────────────────────────────────────
  void remove(String id) {
    _items.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  // ── Increment ─────────────────────────────────────────────────
  void increment(String id) {
    final index = _items.indexWhere((e) => e.id == id);
    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  // ── Decrement ─────────────────────────────────────────────────
  void decrement(String id) {
    final index = _items.indexWhere((e) => e.id == id);
    if (index >= 0 && _items[index].quantity > 1) {
      _items[index].quantity--;
      notifyListeners();
    }
  }

  // ── Clear ─────────────────────────────────────────────────────
  void clear() {
    _items.clear();
    notifyListeners();
  }
}