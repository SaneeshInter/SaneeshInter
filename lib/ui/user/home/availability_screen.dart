import 'package:clickable_list_wheel_view/clickable_list_wheel_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../blocs/shift_confirmed_bloc.dart';
import '../../../model/shift_list_response.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../Widgets/availability_list.dart';
import '../../Widgets/my_booking_list_widget.dart';
import '../../datepicker/date_picker_widget.dart';
import '../app_bar.dart';
import '../side_menu.dart';

class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({Key? key}) : super(key: key);

  @override
  _AvailabilityState createState() => _AvailabilityState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _AvailabilityState extends State<AvailabilityScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime _selectedValue;
  var itemSelected = 0;
  var listSelected = 0;
  var daysCount = 500;

  @override
  void didUpdateWidget(covariant AvailabilityScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    confirmBloc.fetchConfirm();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FixedExtentScrollController _controller =
        FixedExtentScrollController();

    final FixedExtentScrollController itemController =
        FixedExtentScrollController();
    double width = MediaQuery.of(context).size.width;

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
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context, dividedBy: 40)),
                child: Column(
                  children: [
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
                        // New date selected
                        setState(() {
                          _selectedValue = date;
                          _controller.animateToItem(x,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linear);
                          print(date);
                        });
                      },
                    ),
                    SizedBox(height: 2.h),
                    Container(
                      height: 52.w,
                      child: RotatedBox(
                          quarterTurns: -1,
                          child: ClickableListWheelScrollView(
                            itemCount: 100,

                            scrollController: _controller,
                            onItemTapCallback: (index) {
                              print("onItemTapCallback index: $index");
                            },
                            itemHeight: 50.w,
                            child: ListWheelScrollView(
                              controller: _controller,
                              diameterRatio: 4,
                              onSelectedItemChanged: (x) {
                                setState(() {
                                  itemSelected = x;
                                  print("selected");
                                  itemController.animateToItem(x,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.linear);
                                  print(x);
                                });
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
                                                  value: 0,
                                                  startTime: "11.00 AM",
                                                  endTime: "12.00 PM",
                                                  price: "32",
                                                  onTapView: () {
                                                    print("position");
                                                    print(x);
                                                    listSelected = x;
                                                  },
                                                  onTapCall: () {
                                                    print("position");
                                                    print(x);
                                                    listSelected = x;
                                                  },
                                                  onTapMap: () {
                                                    print("position");
                                                    print(x);
                                                    listSelected = x;
                                                  },
                                                  onTapBooking: () {
                                                    print("Tapped");
                                                    showBookingAlert(context,
                                                        date:
                                                            "Saturday 19th February 2022");
                                                  },
                                                  key: null,
                                                  name: 'DAY',
                                                );
                                              }),
                                        ),
                                      )),
                              itemExtent: 200,
                            ),
                          )),
                    ),
                  ],
                )),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                "Upcoming Shifts",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "SFProMedium",
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                child: Column(children: [
              StreamBuilder(
                  stream: confirmBloc.allShift,
                  builder: (BuildContext context,
                      AsyncSnapshot<SliftListRepso> snapshot) {
                    if (snapshot.hasData) {
                      return buildList(snapshot);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ])),
          ],
        ),
      ),
    );
  }
}


Widget buildList(AsyncSnapshot<SliftListRepso> snapshot) {
  return ListView.builder(
    itemCount: snapshot.data?.response?.data?.category?.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      var name = "Shift Confirmed";
      var description = " Confirmed";

      var category = snapshot.data?.response?.data?.category![index];
      if (category != null) {
        name = category.categoryname!;
        name = category.categoryname!;
      }

      return Column(
        children: [
          MyBookingListWidget(
            date: name,
            jobTittle: description,
            startTime: "11.00 AM",
            endTime: "12.00 PM",
            price: "32",
            position: 10,
            onTapView: () {
              showFeactureAlert(context, date: "");
            },
            onTapCall: () {},
            onTapMap: () {
              showFeactureAlert(context, date: "");
            },
            onTapBooking: () {
              print("Tapped");
              showAddTimeSheet(context, date: "");
            },
            key: null,
          ),
        ],
      );
    },
  );
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
