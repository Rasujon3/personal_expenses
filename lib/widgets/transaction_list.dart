import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import 'user_transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;

  TransactionList(this.transaction,this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      //height: MediaQuery.of(context).size.height - 100,
      //height: double.infinity - 50,
      child: transaction.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transaction added yet!",
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 200.0,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('\৳${transaction[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transaction[index].title,
                      // ignore: deprecated_member_use
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transaction[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transaction[index].id),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// return Card(
// child: Row(
// children: [
// Container(
// margin: EdgeInsets.symmetric(
// vertical: 10.0,
// horizontal: 15.0,
// ),
// decoration: BoxDecoration(
// border: Border.all(
// color: Theme.of(context).primaryColor,
// width: 2,
// ),
// ),
// padding: EdgeInsets.all(10.0),
// child: Text(
// '\৳${transaction[index].amount.toStringAsFixed(2)}',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 20.0,
// color: Theme.of(context).primaryColor,
// ),
// ),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// transaction[index].title,
// // ignore: deprecated_member_use
// style: Theme.of(context).textTheme.title,
// ),
// Text(
// DateFormat.yMMMd().format(transaction[index].date),
// style: TextStyle(color: Colors.grey),
// ),
// ],
// ),
// ],
// ),
// );
