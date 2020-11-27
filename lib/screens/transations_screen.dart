import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/transction_controller.dart';
import '../constants.dart';
import '../helper/shared_prefrance.dart';
import '../widgets/transaction_list.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/main_card.dart';

class TransactionsScreen extends StatelessWidget {
  // final Prefrance pref = Prefrance();
  @override
  Widget build(BuildContext context) {
    var isLandScape =
        (MediaQuery.of(context).orientation == Orientation.landscape);

    final double width = Get.width;
    final double height = Get.height;
    final EdgeInsets mQueryPadding = context.mediaQueryPadding;
    final double appBarHeight = MyAppBar().preferredSize.height;
    final TransactionController c = Get.put(TransactionController());

    List<Widget> mainCardAndTransactionList = [
      Container(
        height: 150,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            GetBuilder<TransactionController>(
                builder: (_) => MainCard(
                    color: kGetMoneyColor, label: "Get", money: c.totalGet)),
            GetBuilder<TransactionController>(
                builder: (_) => MainCard(
                    color: kPayMoneyColor, label: "Pay", money: c.totalPay)),
            GetBuilder<TransactionController>(
                builder: (_) => MainCard(
                    color: kTotalMoneyColor,
                    label: "Total",
                    money: c.totalMoney))
          ],
        ),
      ),
      Container(
        width: isLandScape ? width / 2 : width,
        height: !isLandScape
            ? (height - appBarHeight - mQueryPadding.top) * 0.75
            : (height - appBarHeight - mQueryPadding.top),
        child: TransactionList(
          selectOthersOnly: false,
        ),
      ),
    ];

    return SingleChildScrollView(
      physics: isLandScape ? NeverScrollableScrollPhysics() : null,
      child: Column(
        children: <Widget>[
          isLandScape
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: mainCardAndTransactionList)
              : Column(children: mainCardAndTransactionList),
        ],
      ),
    );
  }
}
