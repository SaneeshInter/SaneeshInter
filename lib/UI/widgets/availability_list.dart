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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth(context, dividedBy: 2.5),
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: SvgPicture.asset(
                            'assets/images/icon/sunny-day.svg'),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          child: AutoSizeText(
                            "DAY",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        flex: 2),
                    Expanded(
                        child: Container(
                          child:
                          SvgPicture.asset('assets/images/icon/check.svg'),
                        ),
                        flex: 1)
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth(context, dividedBy: 2.5),
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: SvgPicture.asset('assets/images/icon/moon.svg'),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          child: AutoSizeText(
                            "NIGHT",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        flex: 2),
                    Expanded(
                        child: Container(
                          child:
                          SvgPicture.asset('assets/images/icon/check.svg'),
                        ),
                        flex: 1)
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth(context, dividedBy: 2.5),
                height: 40,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child:
                        SvgPicture.asset('assets/images/icon/turn-off.svg'),
                      ),
                      flex: 1,
                    ),
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 15),
                          //color: Colors.green,
                          child: AutoSizeText(
                            "OFF",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        flex: 2),
                    Expanded(
                        child: Container(
                          child:
                          SvgPicture.asset('assets/images/icon/check.svg'),
                        ),
                        flex: 1)
                  ],
                ),
              )
            ],
          ),
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
