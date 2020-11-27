import '../helper/shared_prefrance.dart';
import '../constants.dart';
import '../models/transaction.dart';
import 'package:get/get.dart';
import '../helper/DBHelper.dart';

class TransactionController extends GetxController {
  final DBHelper dbHelper = DBHelper();
  //                final Prefrance pref = Prefrance();

  // TransactionModel(
  //   id: '1000',
  //   title: 'milk ',
  //   transactionType: TransactionType.Get,
  //   money: 100,
  //   date: DateTime.now(),
  // ),
  // TransactionModel(
  //   id: '1000',
  //   title: 'فول وطعمية  ',
  //   transactionType: TransactionType.Pay,
  //   money: 123650,
  //   date: DateTime.now(),
  // ),
  // TransactionModel(
  //   id: '1000',
  //   title: 'بتنجان ',
  //   transactionType: TransactionType.Other,
  //   money: 10,
  //   date: DateTime.now(),
  // ),

  List<TransactionModel> transactions = List<TransactionModel>();

  double totalPay = 0.0;
  double totalGet = 0.0;
  double totalMoney = 0.0;
  // bool firstTime = true;

  Future<void> addNewTx(TransactionModel t) async {
    if (t.transactionType == TransactionType.Get) {
      totalGet += t.money;
      totalMoney += t.money;
    } else if (t.transactionType == TransactionType.Pay) {
      totalPay += t.money;
      totalMoney -= t.money;
    }
    // pref.addValues(getVal: totalGet, payVal: totalPay, totalVal: totalMoney);
    transactions.insert(0, t);
    await getTransactionsFromDbHelper();
    await dbHelper.insert(t);
    update();
  }

  void deleteTransaction(TransactionModel t) async {
    if (t.transactionType == TransactionType.Get) {
      totalGet -= t.money;
      totalMoney -= t.money;
    } else if (t.transactionType == TransactionType.Pay) {
      totalPay -= t.money;
      totalMoney += t.money;
    }
    update();
    //  pref.addValues(getVal: totalGet, payVal: totalPay, totalVal: totalMoney);
    await dbHelper.delete(t.id);
    transactions.removeAt(transactions.indexOf(t));
    update();
  }

  Future getTransactionsFromDbHelper() async {
    if (transactions.isNotEmpty) {
     //  print("isnotEmpty........................");
      // firstTime = false;
      return;
      //return true;
    }
    ///print('cccccccccccccccccccccccccccccccccccccccc');
    transactions = (await dbHelper.getAllTransactions()).map((item) {
      return TransactionModel(
          id: item["id"],
          title: item["title"],
          money: item['money'],
          transactionType: item["transactionType"] == getMoneyText
              ? TransactionType.Get
              : item["transactionType"] == payMoneyText
                  ? TransactionType.Pay
                  : TransactionType.Other,
          date: DateTime.parse(item["date"]));
    }).toList();
    if (transactions.isEmpty) {
      return ;
    }
    // print(transactions);
   // print('======================================================================');
    transactions = transactions.reversed.toList();
    update();
    transactions.forEach((item) {
      if (item.transactionType == TransactionType.Get) {
        totalGet += item.money;
        totalMoney += item.money;
      } else if (item.transactionType == TransactionType.Pay) {
        totalPay += item.money;
        totalMoney -= item.money;
      }
    });
    update();
    // totalPay = await pref.getPayMoney();
    // totalGet = await pref.getGetMoney();
    // totalMoney = await pref.getTotalMoney();
    //return true;
    return;
  }

  // get transactions => _transactions;
}
