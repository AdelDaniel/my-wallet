import 'package:flutter/material.dart';

const InputDecoration kMoneyInputDecoration = InputDecoration(
  errorStyle: TextStyle(decorationStyle: TextDecorationStyle.wavy),
  suffix: const Text(
    "\$",
    style: TextStyle(
        color: Colors.purple, fontSize: 22, fontWeight: FontWeight.bold),
  ),
  isDense: true,
  contentPadding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
  focusColor: Colors.white,
  hoverColor: Colors.white,
  hintText: "Put Money Here",
  hintStyle: const TextStyle(fontSize: 13),
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    gapPadding: 20,
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(40),
    ),
  ),
);

const InputDecoration kInputDecoration = InputDecoration(
  hintStyle: const TextStyle(fontSize: 18),
  isDense: true,
  contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20.0),
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(40),
    ),
  ),
);
const Color kGetMoneyColor = Colors.blue;
const Color kPayMoneyColor = Colors.green;
const Color kTotalMoneyColor = Colors.purple;
const Color kOtherMoneyColor = Colors.red;

const String payMoneyText = "pay";
const String getMoneyText = "get";
const String totalMoneyText = "total";
const String otherMoneyText = "other";

const kInputTextStyle =
    TextStyle(color: Colors.purple, fontSize: 22, fontWeight: FontWeight.bold);
