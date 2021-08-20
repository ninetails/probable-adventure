import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  late Color _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.black,
      Colors.blue,
      Colors.purple,
    ];

    this._bgColor = availableColors[Random().nextInt(availableColors.length)];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: this._bgColor,
        radius: 30,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: FittedBox(
            child: Text('\$${this.widget.transaction.amount}'),
          ),
        ),
      ),
      title: Text(
        this.widget.transaction.title,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(
        DateFormat.yMMMd().format(this.widget.transaction.date),
      ),
      trailing: MediaQuery.of(context).size.width > 460
          ? TextButton.icon(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(Theme.of(context).errorColor),
              ),
              onPressed: () =>
                  this.widget.deleteTransaction(this.widget.transaction.id),
              icon: const Icon(Icons.delete),
              label: const Text('Delete'),
            )
          : IconButton(
              onPressed: () =>
                  this.widget.deleteTransaction(this.widget.transaction.id),
              icon: const Icon(Icons.delete),
              color: Theme.of(context).errorColor,
            ),
    );
  }
}
