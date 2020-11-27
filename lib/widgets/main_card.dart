import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:get/get.dart';

class MainCard extends StatelessWidget {
  final Color color;
  final String label;
  final double money;
  //final Future<double> money;
  const MainCard({this.color, this.label, this.money});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      elevation: 10,
      color: color,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        width: 150,
        height: 120,
        child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                  child: Text(
                    label,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )),
            Expanded(
              child: Center(
                child: Align(
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: Text(
                      "$money \$ ",
                      style: kInputTextStyle.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// child: FutureBuilder<double>(
//                 future: money,
//                 builder: (context, AsyncSnapshot snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(
//                       child: Container(
//                           alignment: Alignment.center,
//                           child: CircularProgressIndicator()),
//                     );
//                   }
//                   num showValue = snapshot.data == null
//                       ? 0
//                       : snapshot.data.toStringAsFixed(2);
//                   return Center(
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: FittedBox(
//                         child: Text(
//                           "$showValue \$ ",
//                           style: kInputTextStyle.copyWith(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
