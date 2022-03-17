import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';


import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../user/detail/home_card_item.dart';
import '../../widgets/buttons/home_button.dart';

class ManagerHomeScreen extends StatefulWidget {
  const ManagerHomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreentate createState() => _HomeScreentate();
}

class _HomeScreentate extends State<ManagerHomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int devicePixelRatio = 3;
  int perPageItem = 3;
  int pageCount = 0;
  int selectedIndex = 0;
  int lastPageItemLength = 0;

  late PageController pageController;

  @override
  void didUpdateWidget(covariant ManagerHomeScreen oldWidget) {
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
    return Scaffold(
      backgroundColor: Constants.colors[9],
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .4,
                      child: AutoSizeText(
                        "Important Update",
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontFamily: "SFProMedium",
                        ),
                      ),
                    ),
                  ),
                  horizontalList(),
                  horizontalIndiCator(),
                  gridView(),
                  equalSizeButtons()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget equalSizeButtons() {
    return Row(
      children: <Widget>[
        Expanded(
          child: HomeButton(
              onPressed: () {},
              label: "Send Mail",
              asset: "assets/images/icon/email.svg",
              textColors: Constants.colors[0],
              color1: Constants.colors[3],
              color2: Constants.colors[4]),
        ),
        SizedBox(width: screenHeight(context, dividedBy: 100)),
        Expanded(
          child: HomeButton(
              onPressed: () {},
              label: "Contact",
              asset: "assets/images/icon/phone.svg",
              textColors: Constants.colors[0],
              color1: Constants.colors[6],
              color2: Constants.colors[5]),
        ),
      ],
    );
    ;
  }

  Widget imageCard() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
          child: Row(
            children: [
              Expanded(
                child: const AutoSizeText(
                  "Premium / Immediate \nShifts",
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  transformAlignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width / 3,
                  child: SvgPicture.asset('assets/images/icon/logo.svg')),
            ],
          ),
        ),
      ),
    );
  }

  Widget horizontalList() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 110,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (_, index) {
          return GestureDetector(
            onTap: () {
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            },
            child: Card(
              elevation: 0.0,
              child: Container(
                width: 65.w,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AutoSizeText(
                        "Please ensure time sheets are submited befire sunday deadline",
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontFamily: "SFProMedium",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Container(
                            width: screenHeight(context, dividedBy: 2.2),
                            child: AutoSizeText(
                              "Jan 18,2022 | 11.00AM-12.00Pm",
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 8.sp,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget horizontalIndiCator() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 0.0),
      child: SizedBox(
        height: 15,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                pageController.animateToPage(index,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.blue
                        .withOpacity(selectedIndex == index ? 1 : 0.5)),
                margin: EdgeInsets.all(5),
                width: 10,
                height: 10,
              ),
            );
          },
        ),
      ),
    );
  }



  Widget gridView() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: GridView.count(
        shrinkWrap: true,
        childAspectRatio: 2,
        primary: false,
        crossAxisCount: 2,
        children: [
          HomeCardItem(label: "Create Shifts ", asset: "assets/images/icon/availability.svg"),
          HomeCardItem(label: "View\nMy Booking ", asset: "assets/images/icon/availability.svg"),
          HomeCardItem(label: "Approve Timesheets", asset: "assets/images/icon/availability.svg"),
        ],
      ),
    );
  }


}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
