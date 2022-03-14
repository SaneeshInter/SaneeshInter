import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/constants.dart';
import '../../utils/utils.dart';
import 'buttons/book_button.dart';
import 'buttons/build_button.dart';
import 'buttons/call_button.dart';
import 'buttons/view_button.dart';

class TimeSheetListWidget extends StatefulWidget {
  final String name;
  final String startTime;
  final String endTime;
  final String price;
  final Function onTapBooking;
  final Function onTapMap;
  final Function onTapCall;
  final Function onTapView;

  const TimeSheetListWidget(
      {Key? key,
      required this.name,
      required this.price,
      required this.onTapView,
      required this.endTime,
      required this.onTapBooking,
      required this.onTapCall,
      required this.onTapMap,
      required this.startTime})
      : super(key: key);

  @override
  _TimeSheetListState createState() => _TimeSheetListState();
}

class _TimeSheetListState extends State<TimeSheetListWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          Row(children: [
            Container(
              alignment: Alignment.topLeft,
              transformAlignment: Alignment.topLeft ,
              child: Checkbox(

                checkColor: Colors.white,
                fillColor: MaterialStateProperty.resolveWith(getColor),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                },
              ),
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                widget.name,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: screenHeight(context, dividedBy: 120)),

              Text(
                "Job tittle",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: screenHeight(context, dividedBy: 120)),

              Text(
                "From " + widget.startTime + " To " + widget.endTime,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: screenHeight(context, dividedBy: 120)),
              Text(
                "Vacancy 2",
                style: TextStyle(
                    fontSize: 13,
                    color: Constants.colors[3],
                    fontWeight: FontWeight.w500),
              ),
            ]),
            Spacer(),
          ]),
          SizedBox(height: screenHeight(context, dividedBy: 120)),
        ],
      ),
    );
  }
}


Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return Constants.colors[3];
}