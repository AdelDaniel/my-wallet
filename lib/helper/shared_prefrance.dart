// import '../constants.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class Prefrance {
//   factory Prefrance() => _instance;
//   Prefrance._internal();

//   static final Prefrance _instance = Prefrance._internal();
//   static SharedPreferences _prefs;

//   Future<SharedPreferences> createSharedPrefrance() async {
//     if (_prefs != null) {
//       return _prefs;
//     } else {
//       _prefs = await SharedPreferences.getInstance();
//     }
//     return _prefs;
//   }

//   addValues({double payVal, double getVal, double totalVal}) async {
//     _prefs = await createSharedPrefrance();
//     _prefs.setDouble(payMoneyText, payVal);
//     _prefs.setDouble(getMoneyText, getVal);
//     _prefs.setDouble(totalMoneyText, totalVal);

//     print('aaaadk;akjalfjk;alfjk;aaaaaaaaaaaa');
//     print(_prefs.getDouble(getMoneyText));
//     print(_prefs.getDouble(totalMoneyText));
//   }

//   Future<double> getPayMoney() async {
//     _prefs = await createSharedPrefrance();
//     return _prefs.getDouble(payMoneyText) == null
//         ? 0
//         : _prefs.getDouble(payMoneyText);
//   }

//   Future<double> getGetMoney() async {
//     _prefs = await createSharedPrefrance();
//     return _prefs.getDouble(getMoneyText) == null
//         ? 0
//         : _prefs.getDouble(getMoneyText);
//   }

//   Future<double> getTotalMoney() async {
//     _prefs = await createSharedPrefrance();
//     print(_prefs.getDouble(totalMoneyText));
//     print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
//     return _prefs.getDouble(totalMoneyText) == null
//         ? 0
//         : _prefs.getDouble(totalMoneyText);
//   }
// }
