import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../screens/add_new_screen.dart';
import '../screens/chart_screen.dart';
import '../screens/transations_screen.dart';

import '../widgets/my_app_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  final List<Widget> pages = [
    TransactionsScreen(),
    AddNewScreen(),
    ChartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
            onTap: _onTap,
            currentIndex: currentPage,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet),
                  label: "Transactions"),
              BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.pie_chart), label: "Charts"),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pages[currentPage],
      floatingActionButton: currentPage != 1
          ? FloatingActionButton(
              elevation: 15,
              isExtended: true,
              child: const Icon(CupertinoIcons.add),
              onPressed: () => _onTap(1), // addNewTransaction(context),
            )
          : null,
    );
  }

  void _onTap(int index) {
    setState(() {
      currentPage = index;
    });
  }
}
