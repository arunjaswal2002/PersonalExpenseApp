import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Class/transaction.dart';

class TransactionList extends StatelessWidget {
  List < Transaction > transactions;
  Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transactions.isEmpty ?
      Column(children: < Widget > [
        const Text('No transactions added yet!',
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 20)),
          const SizedBox(height: 20),
            Container(
              height: 200,
              child: Image.asset('Assets/Images/waiting.png',
                fit: BoxFit.cover))
      ]) :
      ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            elevation: 6,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('\$${transactions[index].amount}')),
                ),
              ),
              title: Text(transactions[index].title),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
              trailing: IconButton(icon: Icon(Icons.delete), onPressed: () => deleteTransaction(transactions[index].id), color: Colors.red),

            ),
          );
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
        },
        itemCount: transactions.length,
        // children: transactions.map((tx) {

        // }).toList(),
      ),
    );
  }
}