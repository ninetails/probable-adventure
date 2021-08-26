import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {...this._items};
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (this._items.containsKey(productId)) {
      this._items.update(
            productId,
            (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              price: existingCartItem.price,
              quantity: existingCartItem.quantity + 1,
            ),
          );
    } else {
      this._items.putIfAbsent(
            productId,
            () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1,
            ),
          );
    }
    this.notifyListeners();
  }
}
