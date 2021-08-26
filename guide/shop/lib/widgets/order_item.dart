import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../providers/orders.dart' as OrdersProvider;

class OrderItem extends StatelessWidget {
  final OrdersProvider.OrderItem order;

  const OrderItem({
    required this.order,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${this.order.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
