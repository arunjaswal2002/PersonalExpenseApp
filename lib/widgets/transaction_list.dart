import 'package:flutter/material.dart';
import './transactionItem.dart';
import '../Class/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> transactions;
  Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(children: <Widget>[
              const Text('No transactions added yet!',
                  style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black)),
              SizedBox(height: constraints.maxHeight * 0.05),
              Container(
                  height: constraints.maxHeight * 0.4,
                  child: Image.asset('Assets/Images/waiting.png',
                      fit: BoxFit.cover))
            ]);
          })
        : ListView.builder(
            itemBuilder: (context, index) {
              return TransactionItem(transactions[index], deleteTransaction);
            },
            itemCount: transactions.length,
            // children: transactions.map((tx) {

            // }).toList(),
          );
  }
}
 // return Card(
              //   child: Row(
              //     children: <Widget>[
              //       Container(
              //         margin: const EdgeInsets.symmetric(
              //           vertical: 10.0,
              //           horizontal: 15.0,
              //         ),
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //             color: Theme.of(context).primaryColorLight,
              //             width: 2,
              //           ),
              //         ),
              //         padding: EdgeInsets.all(10),
              //         child: Text(
              //           '\$${transactions[index].amount.toStringAsFixed(2)}',
              //           style: TextStyle(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 20,
              //             color: Theme.of(context).primaryColor,
              //           ),
              //         ),
              //       ),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: <Widget>[
              //           Text(
              //             transactions[index].title,
              //             style: const TextStyle(

              //               fontSize: 16,
              //               fontWeight: FontWeight.bold,
              //             ),
              //           ),
              //           Text(
              //             DateFormat.yMMMd().format(transactions[index].date),
              //             style: const TextStyle(
              //               color: Colors.grey,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // );
            