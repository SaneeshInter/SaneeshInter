import 'package:flutter/material.dart';
import 'package:xpresshealthdev/UI/user/app_bar.dart';
import 'package:xpresshealthdev/UI/user/detail/shift_detail.dart';

import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../datepicker/date_picker_widget.dart';
import '../../widgets/shift_list_widget.dart';
import '../side_menu.dart';

class FindShiftScreen extends StatefulWidget {
  const FindShiftScreen({Key? key}) : super(key: key);

  @override
  _FindShifttate createState() => _FindShifttate();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _FindShifttate extends State<FindShiftScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime _selectedValue;

  @override
  void didUpdateWidget(covariant FindShiftScreen oldWidget) {
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
    return SafeArea(
      child: Scaffold(
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
        backgroundColor: Constants.colors[2],
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
                        ShiftListWidget(
                          name: "At St george Hospital",
                          startTime: "11.00 AM",
                          endTime: "12.00 PM",
                          price: "32",
                          onTapView: () {},
                          onTapCall: () {},
                          onTapMap: () {

                          },
                          onTapBooking: () {
                            print("Tapped");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShiftDetailScreen()),
                            );
                          },
                          key: null,
                        ),
                        SizedBox(height: screenHeight(context, dividedBy: 100)),
                      ],
                    );
                  },
                )
              ])),
        ),
      ),
    );
  }
}
