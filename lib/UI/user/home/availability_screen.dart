import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../Widgets/availability_list.dart';
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
  var daysCount = 500;

  @override
  void didUpdateWidget(covariant AvailabilityScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
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
      backgroundColor: Constants.colors[2],
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: SideMenu(),
      ),
      appBar: AppBarCommon(_scaffoldKey, scaffoldKey: _scaffoldKey,),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth(context, dividedBy: 40)),
            child: Column(children: [
              SizedBox(height: screenHeight(context, dividedBy: 40)),
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Constants.colors[3],
                selectedTextColor: Colors.white,
                width: screenWidth(context, dividedBy: 4),
                height: screenHeight(context, dividedBy: 8),
                deactivatedColor: Colors.blue,
                monthTextStyle: TextStyle(color: Colors.transparent),
                dateTextStyle: TextStyle(
                    color: Constants.colors[7],
                    fontWeight: FontWeight.w800,
                    fontSize: 40),
                dayTextStyle: TextStyle(
                    color: Constants.colors[7],
                    fontWeight: FontWeight.w700,
                    fontSize: 10),
                selectedDateStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 40),
                selectedDayStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 10),
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
              SizedBox(height: screenHeight(context, dividedBy: 30)),
              Container(
                height: screenHeight(context, dividedBy: 4),
                child: RotatedBox(
                    quarterTurns: -1,
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
                                          startTime: "11.00 AM",
                                          endTime: "12.00 PM",
                                          price: "32",
                                          onTapView: () {},
                                          onTapCall: () {},
                                          onTapMap: () {},
                                          onTapBooking: () {
                                            print("Tapped");
                                            showBookingAlert(context,
                                                date:
                                                    "Saturday 19th February 2022");
                                          },
                                          key: null,
                                          name: 'DAY',
                                        );
                                      })))),
                      itemExtent: 200,
                    )),
              ),
            ])),
      ),
    );
  }
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
