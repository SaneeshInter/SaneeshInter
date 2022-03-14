import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/constants.dart';
import '../../utils/utils.dart';
import '../user/detail/shift_detail.dart';
import 'buttons/book_button.dart';
import 'buttons/build_button.dart';
import 'buttons/call_button.dart';
import 'buttons/view_button.dart';

class ShiftListWidget extends StatefulWidget {
  final String name;
  final String startTime;
  final String endTime;
  final String price;
  final Function onTapBooking;
  final Function onTapMap;
  final Function onTapCall;
  final Function onTapView;

  const ShiftListWidget({Key? key,
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
  _HomePageCardState createState() => _HomePageCardState();
}

class _HomePageCardState extends State<ShiftListWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // widget.onTapMap;

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ShiftDetailScreen()),
        );
      },
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
                  widget.name,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: screenWidth(context, dividedBy: 25),
                          height: screenWidth(context, dividedBy: 25),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Constants.colors[8]),
                          child: Center(
                              child: SvgPicture.asset(
                                  "assets/images/icon/rank.svg",
                                  width: screenWidth(context, dividedBy: 30),
                                  height: screenWidth(context, dividedBy: 30),
                                  fit: BoxFit.cover))),
                      SizedBox(
                        width: screenWidth(context, dividedBy: 40),
                      ),
                      Text(
                        "\$" + widget.price,
                        style: TextStyle(
                            fontSize: 20,
                            color: Constants.colors[3],
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  SizedBox(height: screenHeight(context, dividedBy: 70)),
                  ViewButton(
                    label: "View",
                    onPressed: widget.onTapView,
                    key: null,
                  )
                ],
              )
            ]),
            SizedBox(height: screenHeight(context, dividedBy: 120)),
            Row(
              children: [
                BuildButton(
                  label: "View Map",
                  onPressed: widget.onTapMap,
                  key: null,
                ),
                SizedBox(width: screenWidth(context, dividedBy: 40)),
                BookButton(
                  label: "Book This",
                  onPressed: () {


                    print("Tapped");
                    showBookingAlert(context, date: "Saturday 19th February 2022");

                    // widget.onTapBooking;
                  },
                  key: null,
                ),
                Spacer(),
                CallButton(
                  onPressed: widget.onTapCall,
                  key: null,
                ),
              ],
            ),
            SizedBox(height: screenHeight(context, dividedBy: 120)),
          ],
        ),
      ),
    );
  }
}
