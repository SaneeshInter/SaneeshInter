import 'package:flutter/material.dart';
import 'package:xpresshealthdev/blocs/shift_completed_bloc.dart';

import '../../../model/shift_list_response.dart';
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
    completeBloc.fetchcomplete();
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
                StreamBuilder(
                    stream: completeBloc.allShift,
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
        var name = "Shift Reminder";
        var description = "Completed shift";
        var category = snapshot.data?.response?.data?.category![index];
        if (category != null) {
          name = category.categoryname!;
          name = category.categoryname!;
        }

        return Column(
          children: [
            TimeSheetListWidget(
              name: name,
              startTime: "",
              endTime: description,
              price: "",
              onTapView: () {},
              onTapCall: () {},
              onTapMap: () {},
              onTapBooking: () {
                print("Tapped");
                showBookingAlert(context, date: "Saturday 19th February 2022");
              },
            ),
            SizedBox(height: screenHeight(context, dividedBy: 100)),
          ],
        );
      },
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

