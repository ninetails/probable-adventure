import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        leading: IconButton(
          icon: Icon(Icons.favorite),
          onPressed: () {},
        ),
        backgroundColor: Colors.black54,
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
      ),
    );
  }
}
