import 'package:flutter/cupertino.dart';
import 'package:personal_expense/constants.dart';

enum TransactionType {
  Get,
  Pay,
  Other,
}

class TransactionModel {
  final String _id;
  final String _title;
  final TransactionType _transactionType;
  final double _money;
  final DateTime _date;

  String get id => _id;
  String get title => _title;
  double get money => _money;
  TransactionType get transactionType => _transactionType;
  DateTime get date => _date;

//  set id(String value) => _id = value;
//  set title(String value) => _title = value;
//  set amountOfProduct(int value) => _amountOfProduct = value;
//  set cost(double value) => _cost = value;
// set date(DateTime value) => _date = value;

  const TransactionModel({
    String id,
    String title,
    TransactionType transactionType,
    double money,
    DateTime date,
  })  : _id = id,
        _title = title,
        _transactionType = transactionType,
        _money = money,
        _date = date;

  Color get color {
    if (_transactionType == TransactionType.Get) {
      return kGetMoneyColor;
    } else if (_transactionType == TransactionType.Pay) {
      return kPayMoneyColor;
    }
    return kOtherMoneyColor;
  }
}
