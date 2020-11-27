import 'dart:ffi';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as df;
import 'package:flutter/material.dart';
import '../controller/transction_controller.dart';
import '../models/transaction.dart';
import '../widgets/trasactionType_button.dart';
import '../constants.dart';
import '../widgets/cupertino_datePicker_buttomSheet.dart';

class AddNewScreen extends StatefulWidget {
  @override
  _AddNewScreenState createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  TransactionType transactionType;
  DateTime enterdDateTime;
  bool getEnabled;
  bool payEnabled;
  bool otherEnabled;

  void setDate(DateTime value) => enterdDateTime = value;

  void buttonPressed(TransactionType t) {
    if (payEnabled == true && otherEnabled == true && getEnabled == true) {
      transactionType = t;
      if (t == TransactionType.Get) {
        payEnabled = !payEnabled;
        otherEnabled = !otherEnabled;
      } else if (t == TransactionType.Pay) {
        getEnabled = !getEnabled;
        otherEnabled = !otherEnabled;
      } else if (t == TransactionType.Other) {
        payEnabled = !payEnabled;
        getEnabled = !getEnabled;
      }
    } else {
      payEnabled = true;
      otherEnabled = true;
      getEnabled = true;
      transactionType = null;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getEnabled = true;
    payEnabled = true;
    otherEnabled = true;
    dateController.text =
        df.DateFormat('EEE dd/MMMM/yyyy @hh:mm aaa').format(DateTime.now());
    enterdDateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Card(
              // padding: const EdgeInsets.only(right: 10, left: 10),
              margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 25),
              elevation: 11,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),

              // Money text Field
              child: TextFormField(
                validator: (value) {
                  double chechkVal = double.tryParse(value);
                  if (value.isEmpty ||
                      chechkVal.isNull ||
                      !chechkVal.isGreaterThan(0)) {
                    return '       Unvalid Input';
                  }
                  return null;
                },
                autofocus: true,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: kInputTextStyle,
                cursorColor: Colors.purple,
                controller: moneyController,
                decoration: kMoneyInputDecoration,
              ),
            ),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                TrasactionTypeButton(
                  buttonPressed: () => buttonPressed(TransactionType.Get),
                  color: kGetMoneyColor,
                  label: "Get",
                  enabled: getEnabled,
                ),
                TrasactionTypeButton(
                  buttonPressed: () => buttonPressed(TransactionType.Pay),
                  color: kPayMoneyColor,
                  label: "Pay",
                  enabled: payEnabled,
                ),
                TrasactionTypeButton(
                  buttonPressed: () => buttonPressed(TransactionType.Other),
                  color: kOtherMoneyColor,
                  label: "Other",
                  enabled: otherEnabled,
                ),
              ],
            ),
            Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: TextFormField(
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Unvalid Input';
                //   }
                //   return null;
                // },
                style: kInputTextStyle,
                textAlign: TextAlign.center,
                controller: titleController,
                decoration: kInputDecoration.copyWith(hintText: "Add title"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: TextField(
                readOnly: true,
                onTap: () => Get.bottomSheet(
                  DatePickerButtomSheetCupertino(
                    dateController: dateController,
                    setDateTime: setDate,
                  ),
                ),
                keyboardType: TextInputType.datetime,
                controller: dateController,
                decoration: kInputDecoration,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              elevation: 10,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
              ),
              child: CupertinoButton(
                  color: kTotalMoneyColor,
                  child: Text(
                    "Save",
                    style: kInputTextStyle.copyWith(color: Colors.white),
                  ),
                  onPressed: submitData),
            )
          ],
        ),
      ),
    );
  }

  void submitData() async {
    if (!_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      Get.snackbar('Error', 'Check You Input.',
          icon: Icon(Icons.error), colorText: Colors.red);
    } else {
      if (titleController.text.isEmpty) {
        await Get.dialog(
          AlertDialog(
            actions: [
              FlatButton(
                child: Text("Continue"),
                onPressed: () {
                  titleController.text = "no title";
                  Get.back();
                },
              ),
              FlatButton(child: Text("Cancel"), onPressed: () => Get.back())
            ],
            title: Text("No Title"),
            content: Text("Continue with 'no title' \n or Set Title "),
            elevation: 10,
          ),
        );
      } else {
        if (transactionType.isNull) {
          Get.snackbar(
            'Error',
            'Choose The Type of Transaction.',
            icon: Icon(Icons.error),
            colorText: Colors.red,
            barBlur: 20,
          );
        } else {
          save();
        }
      }
    }
    // final enterdTitle = titleController.text;
    // final enterdCast = double.parse(moneyController.text);
    //if (enterdTitle.isEmpty || enterdCast.isNaN || enterdAmount.isNaN) return;
    // if (enterdDateTime == null) enterdDateTime = DateTime.now();
    // widget.addNewTx(enterdTitle, enterdCast, enterdAmount, enterdDateTime);
    //close dailog automatically
    //Navigator.of(context).pop();
  }

  void save() {
    final TransactionController c = Get.put(TransactionController());
    c.addNewTx(
      TransactionModel(
          transactionType: transactionType,
          money: double.parse(moneyController.text),
          date: enterdDateTime,
          id: DateTime.now().toIso8601String(),
          title: titleController.text),
    );
    Get.snackbar(
      'SAVE..',
      'New Transaction Is Saved.',
      icon: Icon(Icons.check),
      colorText: Colors.red,
      barBlur: 20,
    );
  }
  // void datePicker() {
  //   showDatePicker(
  //           context: context,
  //           initialDate: DateTime.now(),
  //           firstDate: DateTime(
  //               int.parse(df.DateFormat('yyyy').format(DateTime.now())) - 1),
  //           lastDate: DateTime.now())
  //       .then((datePicked) {
  //     if (datePicked != null) {
  //       setState(() {
  //         dateController.text = df.DateFormat('EEE dd/MMMM/yyyy @hh:mm aaa')
  //             .format(datePicked);
  //         enterdDateTime = datePicked;
  //       });
  //     }
  //     return;
  //   }).then((value) => null);
  // }
}
