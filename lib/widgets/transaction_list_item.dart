import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:personal_expense/controller/transction_controller.dart';
import '../models/transaction.dart';

class ListItem extends StatefulWidget {
  const ListItem({
    @required this.transaction,
  });

  final TransactionModel transaction;

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: Colors.black),
          child: CircleAvatar(
            backgroundColor: widget.transaction.color,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                  child: Text(
                '${widget.transaction.money}',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
            ),
            radius: 30,
          ),
        ),
        title: Text(
          '${widget.transaction.title}',
          textScaleFactor: 1.5,
        ),
        subtitle: FittedBox(
            child: Text(DateFormat('EEE dd/MMMM/yyyy   @hh:mm aaa')
                .format(widget.transaction.date))),
        trailing: (null.size.width > 400 || context.isPortrait)
            ? FlatButton.icon(
                label: const Text('Delete'),
                highlightColor: null,
                icon: const Icon(Icons.delete),
                textColor: widget.transaction.color,
                onPressed: () {
                  deleteTransaction(widget.transaction);
                },
              )
            : IconButton(
                highlightColor: null,
                icon: const Icon(Icons.delete),
                color: widget.transaction.color,
                onPressed: () {
                  deleteTransaction(widget.transaction);
                },
              ),
      ),
    );
  }

  void deleteTransaction(TransactionModel tx) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Do You Want To Delete This Transaction '),
          children: <Widget>[
            Card(
                borderOnForeground: false,
                elevation: 5,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: tx.color,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: FittedBox(child: Text('${tx.money}')),
                    ),
                    radius: 30,
                  ),
                  title: Text('${tx.title}'),
                  subtitle: FittedBox(
                      child: Text(DateFormat('EEE dd/MMMM/yyyy   @hh:mm aaa')
                          .format(tx.date))),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                    icon: const Icon(Icons.delete_forever),
                    onPressed: () {
                      final TransactionController c =
                          Get.put(TransactionController());
                      c.deleteTransaction(tx);
                      Navigator.pop(context);
                    }),
                IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
