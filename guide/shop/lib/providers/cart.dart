import 'package:flutter/foundation.dart';
import './product.dart';

class CartItem {
  final String id;
  final Product product;
  final int quantity;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {...this._items};
  }

  int get itemCount {
    return this._items.length;
  }

  double get totalAmount {
    return this._items.values.fold(
          .0,
          (previousValue, cartItem) =>
              previousValue + (cartItem.quantity * cartItem.product.price),
        );
  }

  void addItem(Product product) {
    if (this._items.containsKey(product.id)) {
      this._items.update(
            product.id,
            (existingCartItem) => CartItem(
              id: existingCartItem.id,
              product: existingCartItem.product,
              quantity: existingCartItem.quantity + 1,
            ),
          );
    } else {
      this._items.putIfAbsent(
            product.id,
            () => CartItem(
              id: DateTime.now().toString(),
              product: product,
              quantity: 1,
            ),
          );
    }
    this.notifyListeners();
  }
}
