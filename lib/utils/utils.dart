import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../UI/Widgets/booking_alert_box.dart';
import '../UI/widgets/add_time_sheet_alert_box.dart';
import '../UI/widgets/feacture_implementation_dialog.dart';

double screenHeight(context, {required double dividedBy}) {
  return MediaQuery.of(context).size.height / dividedBy;
}

double commonButtonHeight(context) {
  return 5.5.h;
}

double screenWidth(context, {required double dividedBy}) {
  return MediaQuery.of(context).size.width / dividedBy;
}

void push(context, Widget route) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => route));
}

void pop(context) {
  Navigator.pop(context);
}

void showBookingAlert(
  context, {
  required String date,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 2), () {
        // Navigator.of(context).pop(true);
      });
      return Center(
        child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(
              horizontal: screenWidth(context, dividedBy: 30),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            content: BookingAlertBox(
              date: date,
              key: null,
            )),
      );
    },
  );
}

void showFeactureAlert(
  context, {
  required String date,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 2), () {
        // Navigator.of(context).pop(true);
      });
      return Center(
        child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(
              horizontal: screenWidth(context, dividedBy: 30),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            content: FeactureAlertBox(
              date: date,
              key: null,
            )),
      );
    },
  );
}

void showAddTimeSheet(
  context, {
  required String date,
}) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 2), () {
        // Navigator.of(context).pop(true);
      });
      return Center(
        child: AlertDialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.symmetric(
              horizontal: screenWidth(context, dividedBy: 30),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            content: AddTimeSheetAlertBox(
              date: date,
              key: null,
            )),
      );
    },
  );
}
