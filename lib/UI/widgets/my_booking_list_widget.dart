import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../../utils/utils.dart';
import 'buttons/book_button.dart';
import 'buttons/build_button.dart';

class MyBookingListWidget extends StatefulWidget {
  final String date;
  final String jobTittle;
  final String startTime;
  final String endTime;
  final String price;
  final int position;
  final Function onTapBooking;
  final Function onTapMap;
  final Function onTapCall;
  final Function onTapView;

  const MyBookingListWidget(
      {Key? key,
      required this.date,
      required this.jobTittle,
      required this.price,
      required this.onTapView,
      required this.endTime,
      required this.onTapBooking,
      required this.onTapCall,
      required this.onTapMap,
      required this.startTime,
      required this.position})
      : super(key: key);

  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBookingListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: screenWidth(context, dividedBy: 1),
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context, dividedBy: 25),
            vertical: screenHeight(context, dividedBy: 70)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 2,
                  spreadRadius: 2,
                  color: Constants.colors[7].withOpacity(0.15))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  widget.date,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: screenHeight(context, dividedBy: 180)),
                Text(
                  widget.jobTittle,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: screenHeight(context, dividedBy: 180)),
                Text(
                  "From " + widget.startTime + " To " + widget.endTime,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: screenHeight(context, dividedBy: 180)),
                Text(
                  "At st george Hosp",
                  style: TextStyle(
                      fontSize: 13,
                      color: Constants.colors[3],
                      fontWeight: FontWeight.w500),
                ),
              ]),
              Spacer(),
            ]),
            SizedBox(height: screenHeight(context, dividedBy: 180)),
            buttonList(context, widget)
          ],
        ),
      ),
    );
  }
}

Widget buttonList(BuildContext context, MyBookingListWidget widget) {
  if (widget.position == 1) {
    return Row(
      children: [
        BookButton(
          label: "Add Timesheet",
          onPressed: () {
            widget.onTapView();
            print("Cards booking");
          },
          key: null,
        ),
        Spacer(),
      ],
    );
  } else {
    return Row(
      children: [
        BuildButton(
          label: "View Map",
          onPressed: () {
            widget.onTapMap();
            print("Cards booking");
          },
          key: null,
        ),
        SizedBox(width: screenWidth(context, dividedBy: 40)),
        BookButton(
          label: "Cancel",
          onPressed: () {
            widget.onTapMap();
            print("Cards booking");
          },
          key: null,
        ),
      ],
    );
  }
}
