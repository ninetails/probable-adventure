import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final Product product;
  static const routeName = '/product-detail';

  const ProductDetailScreen({
    // required this.product,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final product = Provider.of<ProductsProvider>(
      context,
      listen: false,
    ).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
