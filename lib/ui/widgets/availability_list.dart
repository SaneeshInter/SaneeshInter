import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants.dart';
import '../../utils/utils.dart';
import 'buttons/submit_button.dart';

class AvailabilityListWidget extends StatefulWidget {
  final String name;
  final String startTime;
  final String endTime;
  final String price;
  final int value;
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
      required this.startTime,
      required this.value})
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
        color: Colors.red,
      ),
      child: GestureDetector(
        onTap: () {
          print("dadsd");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                print("dadsd");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
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
                            child: Visibility(
                              visible: widget.value == 2,
                              child: Container(
                                child: SvgPicture.asset(
                                    'assets/images/icon/check.svg'),
                              ),
                            ),
                            flex: 1)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                print("dadsd");
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child:
                                SvgPicture.asset('assets/images/icon/moon.svg'),
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
                            child: Visibility(
                              visible: widget.value == 0,
                              child: Container(
                                child: SvgPicture.asset(
                                    'assets/images/icon/check.svg'),
                              ),
                            ),
                            flex: 1)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: SvgPicture.asset(
                                'assets/images/icon/turn-off.svg'),
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
                            child: Visibility(
                              visible: widget.value == 1,
                              child: Container(
                                child: SvgPicture.asset(
                                    'assets/images/icon/check.svg'),
                              ),
                            ),
                            flex: 1)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight(context, dividedBy: 50)),
            SubmitButton(
                onPressed: () {


                  print("jfgf");
                },
                label: "Submit",
                textColors: Constants.colors[0],
                color1: Constants.colors[3],
                color2: Constants.colors[4]),
          ],
        ),
      ),
    );
  }
}
