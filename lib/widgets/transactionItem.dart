import 'package:flutter/material.dart';
import '../Class/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  Transaction transaction;
  final Function deleteTx;
  TransactionItem(this.transaction, this.deleteTx, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(child: Text('\$${transaction.amount}')),
          ),
        ),
        title: Text(transaction.title),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 450
            ? FlatButton.icon(
                //button with icon attached
                onPressed: () => deleteTx(transaction.id),
                icon: const Icon(Icons.delete),
                textColor: Colors.red,
                label: const Text('Delete'))
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => deleteTx(transaction.id),
                color: Colors.red),
      ),
    );
  }
}
