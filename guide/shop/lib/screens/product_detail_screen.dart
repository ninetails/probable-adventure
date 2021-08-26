import 'package:flutter/material.dart';
import '../helpers/invariant.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  // final Product product;
  static const routeName = '/product-detail';

  const ProductDetailScreen({
    // required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)?.settings.arguments as String?;
    invariant(productId, 'ProductId is not defined');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'this.product.title',
        ),
      ),
    );
  }
}
