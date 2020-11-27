import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/transction_controller.dart';

import 'chart_single_bar.dart';
import '../models/transaction.dart';

class BarChart extends StatelessWidget {
  final TransactionController controller = Get.put(TransactionController());
  // final List<Transaction> recentTransactions;
  // BarChart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < controller.transactions.length; i++) {
        if (controller.transactions[i].date.day == weekDay.day &&
            controller.transactions[i].date.month == weekDay.month &&
            controller.transactions[i].date.year == weekDay.year) {
          totalSum += controller.transactions[i].money.toDouble();
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'cost': totalSum.toDouble(),
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactionValues.fold(0.0, (sum, _data) {
      return sum + _data['cost'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactionValues.map((data) {
          return Flexible(
            // fit: FlexFit.tight,
            child: ChartSingleBar(
              label: data['day'],
              spendingAmount: data['cost'] as double,
              spendingPecOfTotal: controller.transactions.isEmpty
                  ? 0
                  : (data['cost'] as double) / maxSpending,
            ),
          );
        }).toList(),
      ),
    );
  }
}
