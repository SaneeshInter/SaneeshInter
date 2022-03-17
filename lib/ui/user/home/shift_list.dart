import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/blocs/shift_list_bloc.dart';

import '../../../UI/datepicker/date_picker_widget.dart';
import '../../../UI/user/app_bar.dart';
import '../../../UI/user/detail/shift_detail.dart';
import '../../../UI/user/side_menu.dart';
import '../../../UI/widgets/shift_list_widget.dart';
import '../../../model/shift_list_response.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';

class ShiftList extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late String date;

  @override
  Widget build(BuildContext context) {
    final FixedExtentScrollController itemController =
        FixedExtentScrollController();

    date = DateTime.now().toString();

    bloc.fetchAllList(date);
    return Scaffold(
      key: _scaffoldKey,
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
      backgroundColor: Constants.colors[9],
      body: SingleChildScrollView(
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
                },
              ),
              StreamBuilder(
                  stream: bloc.allShift,
                  builder: (BuildContext context,
                      AsyncSnapshot<SliftListRepso> snapshot) {
                    if (snapshot.hasData) {
                      return buildList(snapshot);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Center(child: CircularProgressIndicator());
                  }),

              SizedBox(height: screenHeight(context, dividedBy: 60)),
              // StreamBuilder(builder: (context,Asy))
            ])),
      ),
    );
  }

  Widget buildList(AsyncSnapshot<SliftListRepso> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data?.response?.data?.category?.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var name;
        var startTime = "11.00 AM";
        var endTime = "12.00 PM";
        var price = "32";
        var category = snapshot.data?.response?.data?.category![index];
        if (category != null) {
          name = category.categoryname;
        }

        return Column(
          children: [
            ShiftListWidget(
              name: name,
              startTime: startTime,
              endTime: endTime,
              price: price,
              onTapView: () {},
              onTapCall: () {},
              onTapMap: () {},
              onTapBooking: () {
                print("Tapped");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShiftDetailScreen()),
                );
              },
              key: null,
            ),
            SizedBox(height: screenHeight(context, dividedBy: 100)),
          ],
        );
      },
    );
  }
}
