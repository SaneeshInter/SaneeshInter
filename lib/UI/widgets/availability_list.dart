import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../utils/constants.dart';
import '../../utils/utils.dart';
import 'buttons/build_button.dart';
import 'buttons/home_button.dart';
import 'buttons/login_button.dart';
import 'buttons/submit_button.dart';

class AvailabilityListWidget extends StatefulWidget {
  final String name;
  final String startTime;
  final String endTime;
  final String price;
  final Function onTapBooking;
  final Function onTapMap;
  final Function onTapCall;
  final Function onTapView;

  const AvailabilityListWidget(
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
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<AvailabilityListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  child: Wrap(
                    spacing: screenWidth(context, dividedBy: 16),
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.start,
                    children: [
                      SvgPicture.asset('assets/images/icon/sunny-day.svg'),
                      AutoSizeText(
                        "DAY",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SvgPicture.asset('assets/images/icon/check.svg'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth(context, dividedBy: 40),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: screenWidth(context, dividedBy: 16),
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/icon/moon.svg'),
                      Text(
                        "NIGHT",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SvgPicture.asset('assets/images/icon/check.svg'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth(context, dividedBy: 40),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: Wrap(
                    spacing: screenWidth(context, dividedBy: 16),
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/icon/turn-off.svg'),
                      Text(
                        "OFF",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SvgPicture.asset('assets/images/icon/check.svg'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight(context, dividedBy: 120)),
            ]),
          ]),
          SizedBox(height: screenHeight(context, dividedBy: 50)),
          SubmitButton(
              onPressed: () {


              },
              label: "Submit",
              textColors: Constants.colors[0],
              color1: Constants.colors[3],
              color2: Constants.colors[4]),
        ],
      ),
    );
  }
}
