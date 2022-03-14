import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../datepicker/date_picker_widget.dart';
import '../../widgets/manager/my_booking_list_widget.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBookingScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime _selectedValue;

  @override
  void didUpdateWidget(covariant MyBookingScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FixedExtentScrollController itemController =
        FixedExtentScrollController();
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Constants.colors[9],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: TabBar(
                  unselectedLabelColor: Constants.colors[1],
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Constants.colors[3], Constants.colors[4]]),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  tabs: [
                    Tab(
                      child: Container(
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     backgroundBlendMode: BlendMode.colorDodge,
                        //     color: Colors.green),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("HCAs"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     backgroundBlendMode: BlendMode.colorDodge,
                        //     color: Constants.colors[0]),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Nurses"),
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
        body: TabBarView(children: [bookingList(0), bookingList(1)]),
      ),
    );
  }

  Widget bookingList(int position) {
    final FixedExtentScrollController itemController =
        FixedExtentScrollController();
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context, dividedBy: 35)),
          child: Column(children: [
            SizedBox(height: screenHeight(context, dividedBy: 60)),
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectionColor: Constants.colors[3],
              selectedTextColor: Colors.white,
              width: 65,
              height: 80,
              deactivatedColor: Colors.blue,
              monthTextStyle: TextStyle(color: Colors.transparent),
              dateTextStyle: TextStyle(
                  color: Constants.colors[7],
                  fontWeight: FontWeight.w800,
                  fontSize: 22),
              dayTextStyle: TextStyle(
                  color: Constants.colors[7],
                  fontWeight: FontWeight.w700,
                  fontSize: 13),
              selectedDateStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 23),
              selectedDayStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 13),
              itemController: itemController,
              onDateChange: (date, x) {
                // New date selected
                setState(() {
                  _selectedValue = date;
                  print(date);
                });
              },
            ),
            SizedBox(height: screenHeight(context, dividedBy: 60)),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ManagerBookingListWidget(
                      name: "At St george Hospital",
                      startTime: "11.00 AM",
                      endTime: "12.00 PM",
                      price: "32",
                      onTapView: () {},
                      onTapCall: () {},
                      onTapMap: () {},
                      onTapBooking: () {
                        print("Tapped");
                        showBookingAlert(context, date: "Item deleted");
                      },
                      key: null,
                    ),
                    SizedBox(height: screenHeight(context, dividedBy: 100)),
                  ],
                );
              },
            )
          ])),
    );
  }
}
