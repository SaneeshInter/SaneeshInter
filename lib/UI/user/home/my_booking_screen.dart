import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/UI/user/app_bar.dart';

import '../../../utils/colors_util.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../Widgets/my_booking_list_widget.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  _HomeScreentate createState() => _HomeScreentate();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreentate extends State<MyBookingScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int devicePixelRatio = 3;
  int perPageItem = 3;
  int pageCount = 0;
  int selectedIndex = 0;
  int lastPageItemLength = 0;
  var selected = 0;
  var itemSelected = 0;
  late PageController pageController;

  final ScrollController _controller = ScrollController();

  @override
  void didUpdateWidget(covariant MyBookingScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    pageCount = 3;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: HexColor("#ffffff"),
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/images/icon/menu.svg',
            ),
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
          ),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
            //change your color here
          ),
          backgroundColor: HexColor("#ffffff"),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/icon/logo.svg',
                    fit: BoxFit.contain,
                    height: 30,
                    width: 40,
                  )),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                  'assets/images/icon/searchicon.svg'), //Image.asset('assets/images/icon/searchicon.svg',width: 20,height: 20,fit: BoxFit.contain,),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(5.h),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                  unselectedLabelColor:Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.white,
                  indicator: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Constants.colors[3], Constants.colors[4]]),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            backgroundBlendMode: BlendMode.colorDodge,
                            color: Colors.transparent),
                        child: Align(

                          alignment: Alignment.center,
                          child: Text("Confirmed Shift"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            backgroundBlendMode: BlendMode.colorDodge,
                            color: Colors.transparent),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Completed Shift"),
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

Widget bookingList(int position) {
  return Container(
    child: ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            MyBookingListWidget(
              date: "JUNE 22",
              jobTittle: "Job tittle",
              startTime: "11.00 AM",
              endTime: "12.00 PM",
              price: "32",
              position: position,
              onTapView: () {   showFeactureAlert(context, date: "");},
              onTapCall: () {},
              onTapMap: () {   showFeactureAlert(context, date: "");},
              onTapBooking: () {
                print("Tapped");
                showAddTimeSheet(context, date: "");
              },
              key: null,
            ),
          ],
        );
      },
    ),
  );
}
