import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  final Function addTx;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = this.titleController.text;
    final enteredAmount = double.parse(this.amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: this.titleController,
              onSubmitted: (_) => this.submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: this.amountController,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) => this.submitData(),
            ),
            TextButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
              onPressed: this.submitData,
            )
          ],
        ),
      ),
    );
  }
}
