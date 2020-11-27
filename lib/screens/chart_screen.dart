import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/bar_chart.dart';
import '../widgets/my_app_bar.dart';

// enum Charts {
//   bars,
// }

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final double width = Get.width;
  final double height = Get.height;
  final double appBarHeight = MyAppBar().preferredSize.height;
  bool _showBars = true;
  @override
  Widget build(BuildContext context) {
    bool isLandScape = context.isLandscape;
    final EdgeInsets mQueryPadding = context.mediaQueryPadding;

    List<Widget> barsAndTransactionList = [
      _showBars
          ? Container(
              width: isLandScape ? (width / 2) : (width),
              height: !isLandScape
                  ? (height - appBarHeight - mQueryPadding.top) * 0.20
                  : (height - appBarHeight - mQueryPadding.top),
              child: BarChart())
          : const SizedBox(),
    ];

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CupertinoSwitch(
                  activeColor: Theme.of(context).primaryColor,
                  value: _showBars,
                  onChanged: (value) {
                    setState(() {
                      _showBars = value;
                      //_showBars(value, Charts.bars);
                    });
                  }),
            ],
          ),
          Wrap(
            children: barsAndTransactionList,
          ),
          // TransactionList(selectOthersOnly: true)
        ],
      ),
    );
  }

  // void _showBars(bool value, Charts bars) {}
}
