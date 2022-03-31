import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../blocs/shift_viewbooking_bloc.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../manager/home/shift_detail_manager.dart';
import '../buttons/build_button.dart';
import '../buttons/delete_button.dart';
import '../buttons/view_button.dart';

class ManagerBookingListWidget extends StatefulWidget {
  final String jobTittle;
  final String userType;
  final String place;
  final String startTime;
  final String endTime;
  final int price;
  final Function onTapBooking;
  final Function onTapMap;
  final Function onTapCall;
  final Function onTapView;

  const ManagerBookingListWidget(
      {Key? key,
      required this.jobTittle,
      required this.userType,
      required this.place,
      required this.price,
      required this.onTapView,
      required this.endTime,
      required this.onTapBooking,
      required this.onTapCall,
      required this.onTapMap,
      required this.startTime})
      : super(key: key);

  @override
  _HomePageCardState createState() => _HomePageCardState();
}

class _HomePageCardState extends State<ManagerBookingListWidget> {
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
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(
                  children: [
                    Text(
                      widget.jobTittle,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      widget.place,
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight(context, dividedBy: 120)),
                Text(
                  "From " + widget.startTime + " To " + widget.endTime,
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(height: screenHeight(context, dividedBy: 120)),
                Text(
                  widget.userType,
                  style: TextStyle(
                      fontSize: 11.sp,
                      color: Constants.colors[3],
                      fontWeight: FontWeight.w500),
                ),
              ]),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ViewButton(
                    label: "view",
                    onPressed: (){

                      print("PRINT SHIFTDETAIL SCREEN");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ShiftDetailManagerScreen()),
                      );
                    },
                    key: null,
                  )
                ],
              )
            ]),
            SizedBox(height: screenHeight(context, dividedBy: 120)),
            Row(
              children: [
                BuildButton(
                  label: "Edit",
                  onPressed: widget.onTapMap(),
                  key: null,
                ),
                SizedBox(width: screenWidth(context, dividedBy: 40)),
                DeleteButton(
                  label: "Delete",
                  onPressed: () {
                 // widget.onTapCall();
                    viewbookingBloc.fetchRemoveManager("QS80bVlEa3cyL0RLQmZac0pORloyZz09", "09");
                    print("Cards booking");
                  },
                  key: null,
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: screenHeight(context, dividedBy: 120)),
          ],
        ),
      ),
    );
  }
}
