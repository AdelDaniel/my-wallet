import 'package:flutter/material.dart';

class ChartSingleBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPecOfTotal;

  ChartSingleBar({
    this.label,
    this.spendingAmount,
    this.spendingPecOfTotal,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: <Widget>[
            Container(
                height: constraints.maxHeight * 0.1,
                child:
                    FittedBox(child: Text(spendingAmount.toStringAsFixed(1)))),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              width: constraints.maxWidth * 0.30,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 30),
                      color: Colors.grey,
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPecOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
                height: constraints.maxHeight * 0.1,
                child: FittedBox(
                  child: Text(label),
                )),
          ],
        );
      },
    );
  }
}
