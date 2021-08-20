import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: FittedBox(
            child: Text('\$${this.transaction.amount}'),
          ),
        ),
      ),
      title: Text(
        this.transaction.title,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(
        DateFormat.yMMMd().format(this.transaction.date),
      ),
      trailing: MediaQuery.of(context).size.width > 460
          ? TextButton.icon(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all(Theme.of(context).errorColor),
              ),
              onPressed: () => this.deleteTransaction(this.transaction.id),
              icon: const Icon(Icons.delete),
              label: const Text('Delete'),
            )
          : IconButton(
              onPressed: () => this.deleteTransaction(this.transaction.id),
              icon: const Icon(Icons.delete),
              color: Theme.of(context).errorColor,
            ),
    );
  }
}
