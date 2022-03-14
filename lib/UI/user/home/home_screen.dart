import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../widgets/buttons/drawable_button.dart';
import '../../widgets/buttons/home_button.dart';
import '../app_bar.dart';
import '../detail/shift_detail.dart';
import '../side_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreentate createState() => _HomeScreentate();
}
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
class _HomeScreentate extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int devicePixelRatio = 3;
  int perPageItem = 3;
  int pageCount = 0;
  int selectedIndex = 0;
  int lastPageItemLength = 0;

  late PageController pageController;

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
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
      key: _scaffoldKey,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: SideMenu(),
      ),
      appBar: AppBarCommon(_scaffoldKey, scaffoldKey: _scaffoldKey,),
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
                  AutoSizeText(
                    'Next Shift',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SFProMedium",
                    ),
                  ),
                  SizedBox(height: screenHeight(context, dividedBy: 100)),
                  Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0.0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 22, 5, 22),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 10, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                height: 17.w,
                                width: 17.w,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      AutoSizeText(
                                        '18',
                                        textAlign: TextAlign.center,
                                        minFontSize: 0,
                                        stepGranularity: 0.2,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontFamily: "SFProBold",
                                            fontWeight: FontWeight.w800),
                                      ),
                                      AutoSizeText(
                                        'Jan,21',
                                        minFontSize: 0,
                                        stepGranularity: 0.2,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: "SFProMedium",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: screenWidth(context, dividedBy: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  'Springfeild Hospital',
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 22,
                                      fontFamily: "SFProMedium",
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                AutoSizeText(
                                  'Jan 18,2022 | 11.00Am - 2.00PM',
                                  maxLines: 1,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 14,
                                      fontFamily: "S",
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    DrawableButton(
                                      onPressed: () {},
                                      label: "SW#IP 3RT",
                                      asset:
                                          "assets/images/icon/swipe-to-right.svg",
                                      backgroundColor: Constants.colors[2],
                                      textColors: Constants.colors[4],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    DrawableButton(
                                      onPressed: () {},
                                      label: "Ward 7",
                                      asset: "assets/images/icon/ward.svg",
                                      backgroundColor: Constants.colors[2],
                                      textColors: Constants.colors[6],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Container(
                              alignment: Alignment.centerRight,
                              transformAlignment: Alignment.centerRight,
                              child: SvgPicture.asset(
                                  'assets/images/icon/righarrow.svg')),
                          SizedBox(width: 5),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight(context, dividedBy: 100)),
                  equalSizeButtons(),
                  SizedBox(height: screenHeight(context, dividedBy: 100)),
                  imageCard(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * .4,
                      child: AutoSizeText(
                        "Important Update",
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 21,
                          fontFamily: "SFProMedium",
                        ),
                      ),
                    ),
                  ),
                  horizontalList(),
                  horizontalIndiCator(),
                  gridView(),
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
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShiftDetailScreen()),
                );

              },
              label: "Shift Details",
              asset: "assets/images/icon/availability.svg",
              textColors: Constants.colors[0],
              color1: Constants.colors[3],
              color2: Constants.colors[4]),
        ),
        SizedBox(width: screenHeight(context, dividedBy: 100)),
        Expanded(
          child: HomeButton(
              onPressed: () {},
              label: "Add to Calender",
              asset: "assets/images/icon/availability.svg",
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
      constraints: new BoxConstraints(
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
            child:   Card(
              elevation: 0.0,
              child: Container(
                width: screenWidth(context, dividedBy: 1.3),
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
                          fontSize: 20,
                          fontFamily: "SFProMedium",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,5,0,0),
                        child: Container(
                            width: screenHeight(context, dividedBy: 2.2),
                            child: AutoSizeText("Jan 18,2022 | 11.00AM-12.00Pm",maxLines: 1, style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,

                            ),)),
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
          Card(
            elevation: 0.0,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: const AutoSizeText(
                        "My\nAvailability ",
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "SFProMedium",
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: SvgPicture.asset(
                          'assets/images/icon/availability.svg',
                          height: 20,
                          width: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 0.0,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: const AutoSizeText(
                        "Submit\nTimeSheets ",
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "SFProMedium",
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: SvgPicture.asset(
                          'assets/images/icon/availability.svg',
                          height: 20,
                          width: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 0.0,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: const AutoSizeText(
                        "Find Shift",
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "SFProMedium",
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: SvgPicture.asset(
                          'assets/images/icon/availability.svg',
                          height: 20,
                          width: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            elevation: 0.0,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        "My\nBooking ",
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "SFProMedium",
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: SvgPicture.asset(
                          'assets/images/icon/availability.svg',
                          height: 20,
                          width: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
