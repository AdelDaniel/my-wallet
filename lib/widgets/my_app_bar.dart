import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text('My Wallet'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
