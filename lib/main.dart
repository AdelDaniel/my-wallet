import 'package:flutter/material.dart';
import 'screens/my_home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Wallet',
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.purple,
        fontFamily: 'QuickSand',
      ),
      home: MyHomePage(),
    );
  }
}
