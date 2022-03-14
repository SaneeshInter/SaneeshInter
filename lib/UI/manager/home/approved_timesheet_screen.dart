import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../Widgets/approve_timesheet_list_widget.dart';
import '../../datepicker/date_picker_widget.dart';

class ApprovedTimeSheetScreen extends StatefulWidget {
  const ApprovedTimeSheetScreen({Key? key}) : super(key: key);

  @override
  _ApprovedTimeSheetState createState() => _ApprovedTimeSheetState();
}

class _ApprovedTimeSheetState extends State<ApprovedTimeSheetScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime _selectedValue;

  @override
  void didUpdateWidget(covariant ApprovedTimeSheetScreen oldWidget) {
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
        backgroundColor: Constants.colors[2],
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 35)),
              child: Column(children: [
                SizedBox(height: screenHeight(context, dividedBy: 60)),
                ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        TimeSheetApproveListWidget(
                          name: "At St george Hospital",
                          startTime: "21/02/2022",
                          endTime: "12.00 PM - 20:00 PM",
                          price: "32",
                          onTapView: () {},
                          onTapCall: () {},
                          onTapMap: () {},
                          onTapBooking: () {
                            print("Tapped");
                            showBookingAlert(context, date: "Show Timesheet");
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
