import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/blocs/shift_viewbooking_bloc.dart';

import '../../../Constants/sharedPrefKeys.dart';
import '../../../model/viewbooking_response.dart';
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
  String dateValue = "";

  @override
  void didUpdateWidget(covariant MyBookingScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    var date = DateTime.now();
    dateValue = formatDate(date);
    getDataFromUi();
    super.initState();
  }

  Future getDataFromUi() async {
    SharedPreferences shdPre = await SharedPreferences.getInstance();
    String? token = shdPre.getString(SharedPrefKey.AUTH_TOKEN);
    print(token);
    print(dateValue);
    viewbookingBloc.fetchViewbooking(token!, dateValue);
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
          preferredSize: Size.fromHeight(10.h),
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
              width: 18.w,
              height: 22.w,
              deactivatedColor: Colors.blue,
              monthTextStyle: TextStyle(color: Colors.transparent),
              dateTextStyle: TextStyle(
                  color: Constants.colors[7],
                  fontWeight: FontWeight.w800,
                  fontSize: 16.sp),
              dayTextStyle: TextStyle(
                  color: Constants.colors[7],
                  fontWeight: FontWeight.w500,
                  fontSize: 4.sp),
              selectedDateStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp),
              selectedDayStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 4.sp),
              itemController: itemController,
              onDateChange: (date, x) {
                // New date selected
                setState(() {
                  _selectedValue = date;
                  dateValue = formatDate(date);
                  getDataFromUi();
                });
              },
            ),
            SizedBox(height: 2.h),
            StreamBuilder(
                stream: viewbookingBloc.allShift,
                builder: (BuildContext context,
                    AsyncSnapshot<ManagerScheduleListResponse> snapshot) {
                  if (snapshot.hasData) {
                    return buildList(snapshot);
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return const Center(child: CircularProgressIndicator());
                })
          ])),
    );
  }

  String formatDate(DateTime date) {
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(date);
    return formatted;
  }
}

Widget buildList(AsyncSnapshot<ManagerScheduleListResponse> snapshot) {
  return ListView.builder(
    itemCount: snapshot.data?.response?.data?.items?.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      var row_id;
      String? type = "";
      String? userType = "";
      var category;
      String? jobTitle = "";
      String? hospital = "";
      String? date = "";
      String? timeFrom = "";
      String? timeTo = "";
      String? jobDetails = "";
      var price;
      var allowances;
      var description = " boooking";
      var items = snapshot.data?.response?.data?.items![index];
      if (items != null) {
        print("RESPONSE");
        row_id = items.rowId;
        type = items.type;
        userType = items.userType;
        category = items.category;
        jobTitle = items.jobTitle;
        hospital = items.hospital;
        date = items.date;
        timeFrom = items.timeFrom;
        timeTo = items.timeTo;
        jobDetails = items.jobDetails;
        price = items.price;
        allowances = items.allowances;
      }
      return Column(
        children: [
          ManagerBookingListWidget(
            jobTittle: type!,
            place: hospital!,
            userType: userType!,
            startTime: timeFrom!,
            endTime: timeTo!,
            price: price,
            onTapView: () {},
            onTapCall: () {},
            onTapMap: () {},
            onTapBooking: () {
              print("Tapped");
              showBookingAlert(context, date: "Item deleted");
            },
            key: null,
          ),
        ],
      );
    },
  );
}
