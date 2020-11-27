import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatePickerButtomSheetCupertino extends StatefulWidget {
  final Function setDateTime;
  final TextEditingController dateController;
  DatePickerButtomSheetCupertino({this.dateController, this.setDateTime});

  @override
  _DatePickerButtomSheetCupertinoState createState() =>
      _DatePickerButtomSheetCupertinoState();
}

class _DatePickerButtomSheetCupertinoState
    extends State<DatePickerButtomSheetCupertino> {
  DateTime changingDate;
  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 10,
      builder: (ctx) => ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          height: Get.height * 0.44,
          //width: 150,
          color: Colors.white,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.dateAndTime,
                    onDateTimeChanged: (DateTime date) {
                      if (date != null) {
                        setState(() {
                          widget.dateController.text =
                              DateFormat('EEE dd/MMMM/yyyy @hh:mm aaa')
                                  .format(date);
                          changingDate = date;
                        });
                      }
                    }),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipOval(
                        child: Material(
                          elevation: 10,
                          color: Colors.green,
                          child: IconButton(
                            icon: const Icon(Icons.check),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                widget.setDateTime(changingDate);
                                Get.back();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipOval(
                        child: Material(
                          elevation: 10,
                          color: Colors.red,
                          child: IconButton(
                            icon: const Icon(Icons.close),
                            color: Colors.white,
                            onPressed: () {
                              setState(() {
                                widget.dateController.text =
                                    DateFormat('EEE dd/MMMM/yyyy @hh:mm aaa')
                                        .format(DateTime.now());
                                widget.setDateTime(DateTime.now());
                                Get.back();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onDragEnd: (details, {isClosing}) {},
      onClosing: () {
        setState(() {
          widget.dateController.text =
              DateFormat('EEE dd/MMMM/yyyy @hh:mm aaa').format(DateTime.now());
          widget.setDateTime(DateTime.now());
        });
      },
    );
  }
}
