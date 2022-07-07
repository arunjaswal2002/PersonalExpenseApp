import 'package:flutter/material.dart';
import '../Class/transaction.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class TransactionItem extends StatefulWidget {
  Transaction transaction;
  final Function deleteTx;
  TransactionItem({Key? key, required this.transaction, required this.deleteTx})
      : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color? _bgColor;
  @override
  void initState() {
    const colors = [Colors.green, Colors.red, Colors.orange, Colors.cyan];
    _bgColor = colors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(child: Text('\$${widget.transaction.amount}')),
          ),
        ),
        title: Text(widget.transaction.title),
        subtitle: Text(DateFormat.yMMMd().format(widget.transaction.date)),
        trailing: MediaQuery.of(context).size.width > 450
            ? FlatButton.icon(
                //button with icon attached
                onPressed: () => widget.deleteTx(widget.transaction.id),
                icon: const Icon(Icons.delete),
                textColor: Colors.red,
                label: const Text('Delete'))
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => widget.deleteTx(widget.transaction.id),
                color: Colors.red),
      ),
    );
  }
}
