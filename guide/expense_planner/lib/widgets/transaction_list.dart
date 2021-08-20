import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * .6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        // : ListView.builder(
        //     itemBuilder: (ctx, index) {
        //       return TransactionItem(
        //         transaction: this.transactions[index],
        //         deleteTransaction: this.deleteTransaction,
        //       );
        //     },
        //     itemCount: this.transactions.length,
        //   );
        : ListView(
            children: this
                .transactions
                .map(
                  (transaction) => TransactionItem(
                    // key: UniqueKey(),
                    key: ValueKey(transaction.id),
                    transaction: transaction,
                    deleteTransaction: this.deleteTransaction,
                  ),
                )
                .toList(),
          );
  }
}
