import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/transction_controller.dart';
import './transaction_list_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  // final TransactionController  = Get.put(TransactionController());
  final bool selectOthersOnly;
  TransactionList({this.selectOthersOnly});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionController>(
      init: TransactionController(),
      builder: (controller) => FutureBuilder(
          future: controller.getTransactionsFromDbHelper(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator()),
              );
            }
            //if (snapshot.data) Center(child: Text("NO TRANSACTION YET.."));
            print(controller.transactions.length );
            print("0000000000000000000000000000000000000000000000");
            return controller.transactions.length == 0
                ? Center(child: Text("NO TRANSACTION YET"))
                : ListView(
                    // physics: NeverScrollableScrollPhysics(),
                    children: controller.transactions.map((tx) {
                      //print("a=================================================a");
                    return !selectOthersOnly
                        ? tx.transactionType == TransactionType.Other
                            ? SizedBox()
                            : ListItem(transaction: tx)
                        : tx.transactionType != TransactionType.Other
                            ? SizedBox()
                            : ListItem(transaction: tx);
                  }).toList());
          }),
    );
  }
}

