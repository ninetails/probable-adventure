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
            Container(
              height: 70,
              child: Row(
                children: [
                  Text('No Date Chosen!'),
                  TextButton(
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text('Choose Date'),
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
                textStyle: MaterialStateProperty.all(TextStyle(
                  color:
                      Theme.of(context).textTheme.button?.color ?? Colors.white,
                )),
              ),
              child: Text('Add Transaction'),
              onPressed: this.submitData,
            )
          ],
        ),
      ),
    );
  }
}
