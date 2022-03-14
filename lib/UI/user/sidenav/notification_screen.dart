import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../datepicker/date_picker_widget.dart';
import '../../widgets/notification_widget.dart';
import '../../widgets/shift_list_widget.dart';
import '../app_bar.dart';
import '../side_menu.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _NotificationState extends State<NotificationScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime _selectedValue;

  @override
  void didUpdateWidget(covariant NotificationScreen oldWidget) {
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
                ListView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        NotificationWidget(
                          name: "Shift Reminder",
                          startTime:
                              "Your shift at Beneavin Manor is in  1 hour",
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
