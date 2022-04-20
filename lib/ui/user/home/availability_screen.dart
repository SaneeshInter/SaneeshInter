import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/blocs/user_availability_bloc.dart';
import 'package:xpresshealthdev/ui/widgets/availability_list.dart';

import '../../../model/user_availability_btw_date.dart';
import '../../../resources/token_provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../datepicker/date_picker_widget.dart';
import '../app_bar.dart';
import '../side_menu.dart';

class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({Key? key}) : super(key: key);

  @override
  _AvailabilityState createState() => _AvailabilityState();
}

final FixedExtentScrollController _controller = FixedExtentScrollController();

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _AvailabilityState extends State<AvailabilityScreen> {
  String token = "";
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var _selectedValue;
  var itemSelected = 0;
  var daysCount = 500;
  var startDate;
  var endDate;
  PageController? pageController;

  double viewportFraction = 0.8;

  double? pageOffset = 0;

  @override
  void didUpdateWidget(covariant AvailabilityScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    startDate = DateTime.now();
    var today = DateTime.now();
    endDate = today.add(const Duration(days: 30));
    getDatatoken();
    availabilitybloc.fetchuserAvailability(token, startDate, endDate);
    pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    availabilitybloc.fetchuserAvailability(token, startDate, endDate);
    double width = MediaQuery.of(context).size.width;
    final PageController ctrl = PageController(
      viewportFraction: .612,
    );
    final FixedExtentScrollController itemController =
        FixedExtentScrollController();
    DatePicker date;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Constants.colors[9],
      drawer: Drawer(
        child: SideMenu(),
      ),
      appBar: AppBarCommon(
        _scaffoldKey,
        scaffoldKey: _scaffoldKey,
      ),
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
                width: 25.w,
                height: 25.w,
                deactivatedColor: Colors.blue,
                monthTextStyle: TextStyle(color: Colors.transparent),
                dateTextStyle: TextStyle(
                    color: Constants.colors[7],
                    fontWeight: FontWeight.w700,
                    fontSize: 23.sp),
                dayTextStyle: TextStyle(
                    color: Constants.colors[7],
                    fontWeight: FontWeight.w600,
                    fontSize: 8.sp),
                selectedDateStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 23.sp),
                selectedDayStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 8.sp),
                itemController: itemController,
                daysCount: 30,
                onDateChange: (date, x) {
                  print(date);
                  // New date selected
                  ctrl?.animateToPage(x,
                      duration: Duration(milliseconds: 100),
                      curve: Curves.ease);
                  _selectedValue = date.toString();
                },
              ),
              SizedBox(height: 2.h),
              Container(
                  height: 60.w,
                child: StreamBuilder(
                    stream: availabilitybloc.useravailabilitiydate,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<AvailabilityList>> snapshot) {
                      print("stream");
                      if (snapshot.hasData) {
                        return PageView.builder(
                          controller: ctrl,
                          onPageChanged: (page) {
                            print("page");
                            print(page);
                            itemController.animateToItem(page,
                                duration: Duration(milliseconds: 100),
                                curve: Curves.linear);
                          },
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            var item = snapshot.data![index];
                            return Container(
                              padding: EdgeInsets.only(
                                right: 0,
                                left: 0,
                                top: 10,
                                bottom: 10,
                              ),
                              child: Stack(
                                children: <Widget>[
                                  AvailabilityListWidget(
                                    item: item,
                                    onTapView: () {},
                                    key: null,
                                    value: 1,
                                    onSumbmit: (selectedShfit) {
                                      print("selectd shift");
                                      print(selectedShfit);

                                      updateShiftAvailabaity(selectedShfit);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return Container();
                    }),
              ),
            ])),
      ),
    );
  }

  Future getDatatoken() async {
    token = (await TokenProvider().getToken())!;
  }

  void updateShiftAvailabaity(int selectedShfit) {
    print(token);
    print(_selectedValue);
    print(selectedShfit.toString());
    availabilitybloc.addUserAvailability(
        token, _selectedValue.toString(), selectedShfit.toString());
  }
}
