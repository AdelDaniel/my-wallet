import 'package:flutter/material.dart';

class TrasactionTypeButton extends StatelessWidget {
  final Function buttonPressed;
  final Color color;
  final String label;
  final bool enabled;

  const TrasactionTypeButton(
      {this.enabled, this.buttonPressed, this.color, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ButtonTheme(
        height: 40,
        minWidth: 40,
        child: RaisedButton(
            child: Text(label),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(color: Colors.white, width: 3),
            ),
            elevation: 10,
            color: color,
            onPressed: enabled ? buttonPressed : null),
      ),
    );
  }
}
