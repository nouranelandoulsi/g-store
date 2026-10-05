import 'package:flutter/material.dart';

class CartItem {
  final String image;
  final String title;

  const CartItem({required this.image, required this.title});
}

final ValueNotifier<List<CartItem>> cart = ValueNotifier<List<CartItem>>([]);
final ValueNotifier<List<CartItem>> library = ValueNotifier<List<CartItem>>([]);

void addToCart(CartItem item) {
  if (cart.value.any((e) => e.title == item.title)) return;
  cart.value = [...cart.value, item];
}

void removeFromCart(CartItem item) {
  cart.value = cart.value.where((e) => e.title != item.title).toList();
}

/// Déplace tous les films du panier vers la bibliothèque.
void checkout() {
  final toAdd = cart.value
      .where((c) => !library.value.any((l) => l.title == c.title))
      .toList();
  library.value = [...library.value, ...toAdd];
  cart.value = [];
}