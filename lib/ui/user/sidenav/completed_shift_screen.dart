import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../datepicker/date_picker_widget.dart';
import '../../widgets/notification_widget.dart';
import '../../widgets/shift_list_widget.dart';
import '../../widgets/timesheet_list_item.dart';
import '../app_bar.dart';
import '../side_menu.dart';



class CompletedShiftScreen extends StatefulWidget {
  const CompletedShiftScreen({Key? key}) : super(key: key);

  @override
  _CompletedShiftState createState() => _CompletedShiftState();
}

class _CompletedShiftState extends State<CompletedShiftScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime _selectedValue;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didUpdateWidget(covariant CompletedShiftScreen oldWidget) {
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
        backgroundColor: Colors.green[100],
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 35)),
              child: Column(children: [
                SizedBox(height: screenHeight(context, dividedBy: 60)),
                ListView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        TimeSheetListWidget(
                          name: "JUNE 22",
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

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Colors.blue;
  }
  return Colors.red;
}
