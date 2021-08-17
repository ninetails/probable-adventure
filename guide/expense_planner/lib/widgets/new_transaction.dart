import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  final Function addTx;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate = null;

  void _submitData() {
    if (this._amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = this._titleController.text;
    final enteredAmount = double.parse(this._amountController.text);

    if (enteredAmount <= 0 || this._selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      this._selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presetnDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              controller: this._titleController,
              onSubmitted: (_) => this._submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: this._amountController,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
              onSubmitted: (_) => this._submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      this._selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked Date: ${DateFormat.yMd().format(this._selectedDate as DateTime)}',
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                        TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    onPressed: () => this._presetnDatePicker(context),
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
              onPressed: this._submitData,
            )
          ],
        ),
      ),
    );
  }
}
