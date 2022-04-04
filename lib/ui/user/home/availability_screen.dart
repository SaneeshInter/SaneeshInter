import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../Widgets/availability_list.dart';
import '../../datepicker/date_picker_widget.dart';
import '../app_bar.dart';
import '../side_menu.dart';

class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({Key? key}) : super(key: key);

  @override
  _AvailabilityState createState() => _AvailabilityState();
}

final FixedExtentScrollController _controller = FixedExtentScrollController();

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _AvailabilityState extends State<AvailabilityScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime _selectedValue;
  var itemSelected = 0;
  var daysCount = 500;

  PageController? pageController;

  double viewportFraction = 0.8;

  double? pageOffset = 0;

  @override
  void didUpdateWidget(covariant AvailabilityScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final PageController ctrl = PageController(
      viewportFraction: .612,
    );


    final FixedExtentScrollController itemController =
    FixedExtentScrollController();
    DatePicker date;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Constants.colors[9],
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: SideMenu(),
      ),
      appBar: AppBarCommon(
        _scaffoldKey,
        scaffoldKey: _scaffoldKey,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth(context, dividedBy: 40)),
            child: Column(children: [
              SizedBox(height: screenHeight(context, dividedBy: 40)),
             DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Constants.colors[3],
                selectedTextColor: Colors.white,
                width: 25.w,
                height: 25.w,
                deactivatedColor: Colors.blue,
                monthTextStyle: TextStyle(color: Colors.transparent),
                dateTextStyle: TextStyle(
                    color: Constants.colors[7],
                    fontWeight: FontWeight.w700,
                    fontSize: 23.sp),
                dayTextStyle: TextStyle(
                    color: Constants.colors[7],
                    fontWeight: FontWeight.w600,
                    fontSize: 8.sp),
                selectedDateStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 23.sp),
                selectedDayStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 8.sp),
                itemController: itemController,
                onDateChange: (date, x) {
                  print(date);
                  // New date selected
                  ctrl?.animateToPage(x, duration: Duration(milliseconds: 100), curve: Curves.ease);
                  // setState(() {
                  //   _selectedValue = date;
                  //   // pageController.animateToPage(page, duration: duration, curve: curve);
                  //
                  //   // _controller.animateToItem(x,
                  //   //     duration: Duration(milliseconds: 500),
                  //   //     curve: Curves.linear);
                  //   print(date);
                  // });
                },
              ),
              SizedBox(height: 2.h),
              Container(
                height: 60.w,
                child: PageView.builder(
                  controller: ctrl,
                  onPageChanged: (page)
                  {
                    print("page");
                    print(page);
                      itemController.animateToItem(page,
                          duration: Duration(milliseconds: 100),
                          curve: Curves.linear);

                  },
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                        right: 0,
                        left: 0,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Stack(
                        children: <Widget>[
                          AvailabilityListWidget(
                            startTime: "11.00 AM",
                            endTime: "12.00 PM",
                            price: "32",
                            onTapView: () {},
                            onTapCall: () {},
                            onTapMap: () {},
                            onTapBooking: () {
                              print("Tapped");
                              showBookingAlert(context,
                                  date: "Saturday 19th February 2022");
                            },
                            key: null,
                            name: 'DAY',
                            value: 1,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 20,
                ),
              ),
            ])),
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  final Color color;

  BodyWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: color,
      alignment: Alignment.center,
    );
  }
}

Widget bottom() {
  return Container(
    height: 52.w,
    child: RotatedBox(
        quarterTurns: -1,
        child: ListWheelScrollView(
          controller: _controller,
          diameterRatio: 4,
          onSelectedItemChanged: (x) {
            // setState(() {
            //   itemSelected = x;
            //   print("selected");
            //   itemController.animateToItem(x,
            //       duration: Duration(milliseconds: 500),
            //       curve: Curves.linear);
            //   print(x);
            // });
          },
          children: List.generate(
              100,
              (x) => RotatedBox(
                  quarterTurns: 1,
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 100),
                      child: StreamBuilder<Object>(
                          stream: null,
                          builder: (context, snapshot) {
                            // Return the Date Widget
                            return AvailabilityListWidget(
                              startTime: "11.00 AM",
                              endTime: "12.00 PM",
                              price: "32",
                              onTapView: () {},
                              onTapCall: () {},
                              onTapMap: () {},
                              onTapBooking: () {
                                print("Tapped");
                                showBookingAlert(context,
                                    date: "Saturday 19th February 2022");
                              },
                              key: null,
                              name: 'DAY',
                              value: 2,
                            );
                          })))),
          itemExtent: 200,
        )),
  );
}
