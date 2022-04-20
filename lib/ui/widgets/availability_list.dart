import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants.dart';
import '../../utils/utils.dart';
import 'buttons/submit_button.dart';

class AvailabilityListWidget extends StatefulWidget {
  final String name;
  final String startTime;
  final String endTime;
  final String price;
  final int value;
  final Function onTapView;
  final Function onSumbmit;

  const AvailabilityListWidget(
      //list
      {Key? key,
      required this.name,
      required this.price,
      required this.onTapView,
      required this.endTime,
      required this.startTime,
      required this.onSumbmit,
      required this.value})
      : super(key: key);

  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<AvailabilityListWidget> {
  var selectedValue = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55.w,
      height: 55.w,
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(context, dividedBy: 25),
          vertical: screenHeight(context, dividedBy: 70)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  selectedValue = 1;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        print("1=Day");
                      },
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
                                visible: selectedValue == 1,
                                child: Container(
                                  child: SvgPicture.asset(
                                      'assets/images/icon/check.svg'),
                                ),
                              ),
                              flex: 1)
                        ],
                      ),
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
                setState(() {
                  selectedValue = 2;
                });
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
                              visible: selectedValue == 2,
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
                setState(() {
                  selectedValue = 0;
                });
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
                              visible: selectedValue == 0,
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
                  widget.onSumbmit(selectedValue);
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
