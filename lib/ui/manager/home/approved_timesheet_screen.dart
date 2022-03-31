import 'package:flutter/material.dart';
import 'package:xpresshealthdev/blocs/shift_timesheet_bloc.dart';

import '../../../model/shift_list_response.dart';
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
    timesheetBloc.fetchTimesheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FixedExtentScrollController itemController =
        FixedExtentScrollController();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.colors[9],
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 35)),
              child: Column(children: [
                SizedBox(height: screenHeight(context, dividedBy: 60)),
                StreamBuilder(
                    stream: timesheetBloc.allShift,
                    builder: (BuildContext context,
                        AsyncSnapshot<SliftListRepso> snapshot) {
                      if (snapshot.hasData) {
                        return buildList(snapshot);
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return Center(child: CircularProgressIndicator());
                    })
              ])),
        ),
      ),
    );
  }

  Widget buildList(AsyncSnapshot<SliftListRepso> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data?.response?.data?.category?.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        var name = "Approved time sheet";
        var description = "timesheets";


        var category = snapshot.data?.response?.data?.category![index];
        if (category != null) {
          name = category.categoryname!;
          name = category.categoryname!;
        }

        return Column(
          children: [
            TimeSheetApproveListWidget(
              name: name,
              startTime: description,
              endTime: "12.00 PM - 20:00 PM",
              price: "32",
              onTapView: () {},
              onTapCall: () {},
              onTapMap: () {},
              onTapBooking: () {
                print("Tapped");
                showBookingAlert(context, date: "Show Timesheet");
              },

            ),
            SizedBox(height: screenHeight(context, dividedBy: 100)),
          ],
        );
      },
    );
  }
}

