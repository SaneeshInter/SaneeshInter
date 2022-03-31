import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/blocs/shift_completed_bloc.dart';
import 'package:xpresshealthdev/blocs/shift_confirmed_bloc.dart';

import '../../../model/shift_list_response.dart';
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
  void dispose() {
    // TODO: implement dispose

   print("confirmed_shift");
   //confirmBloc.fetchConfirm();
    super.dispose();
  }

  @override
  void initState() {
    confirmBloc.fetchConfirm();
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
              width: 5.w,
              height: 4.2.w,
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
                    height: 8.w,
                  )),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/icon/searchicon.svg',
                width: 5.w,
                height: 5.w,
              ), //Image.asset('assets/images/icon/searchicon.svg',width: 20,height: 20,fit: BoxFit.contain,),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(65),
            child: Container(
              color: Constants.colors[9],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                    unselectedLabelColor: Colors.black,
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
        ),
        body: TabBarView(children: [bookingList(0), bookingList(1)]),
      ),
    );
  }
}

Widget bookingList(int position) {
  return SingleChildScrollView(
    child: Container(
        child: Column(children: [
      StreamBuilder(
          stream: confirmBloc.allShift,
          builder:
              (BuildContext context, AsyncSnapshot<SliftListRepso> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          })
    ])),
  );
}

Widget buildList(AsyncSnapshot<SliftListRepso> snapshot) {
  return ListView.builder(
    itemCount: snapshot.data?.response?.data?.category?.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {


      var name = "Shift Confirmed";
      var description = " Confirmed";

      var category = snapshot.data?.response?.data?.category![index];
      if (category != null) {
        name = category.categoryname!;
        name = category.categoryname!;
      }

      return Column(
        children: [
          MyBookingListWidget(

            date: name,
            jobTittle: description,
            startTime: "11.00 AM",
            endTime: "12.00 PM",
            price: "32",
            position: 10,
            onTapView: () {
              showFeactureAlert(context, date: "");
            },
            onTapCall: () {},
            onTapMap: () {
              showFeactureAlert(context, date: "");
            },
            onTapBooking: () {
              print("Tapped");
              showAddTimeSheet(context, date: "");
            },
            key: null,
          ),
        ],
      );
    },
  );
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
