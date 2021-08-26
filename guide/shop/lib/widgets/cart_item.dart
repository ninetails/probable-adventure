import 'package:flutter/material.dart';
import '../providers/product.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartItem({
    required this.product,
    required this.quantity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: FittedBox(
                child: Text('\$${this.product.price}'),
              ),
            ),
          ),
          title: Text(this.product.title),
          subtitle: Text('Total: \$${this.product.price * this.quantity}'),
          trailing: Text('${quantity} x'),
        ),
      ),
    );
  }
}
