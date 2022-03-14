import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xpresshealthdev/UI/manager/home/approved_timesheet_screen.dart';
import 'package:xpresshealthdev/UI/manager/home/manager_home_screen.dart';
import 'package:xpresshealthdev/UI/manager/home/my_booking_screen.dart';
import 'package:xpresshealthdev/utils/constants.dart';

import '../utils/colors_util.dart';
import 'manager/home/create_shift_screen.dart';

class ManagerDashBoard extends StatefulWidget {
  const ManagerDashBoard({Key? key}) : super(key: key);

  @override
  State<ManagerDashBoard> createState() => _ManagerDashBoardWidgetState();
}

class _ManagerDashBoardWidgetState extends State<ManagerDashBoard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    ManagerHomeScreen(),
    CreateShiftScreen(),
    MyBookingScreen(),
    ApprovedTimeSheetScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.3,
              0.6,
              0.9,
              0.12,
            ],
            colors: [
              HexColor("#04b654"),
              HexColor("#049e95"),
              HexColor("#049e95"),
              HexColor("#058dbf"),
            ],
          )),
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 200,
                child: Container(
                  height: 50,
                  width: 50,

                ),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        leading: Container(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              'assets/images/icon/menu.svg',
              fit: BoxFit.contain,
            )),
        bottomOpacity: 0.0,
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
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          showSelectedLabels: true,
          iconSize: 3,
          showUnselectedLabels: true,
          selectedIconTheme: IconThemeData(color: Colors.red, opacity: 10),
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/icon/home.svg'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/icon/shiftblack.svg'),
              label: 'Create Shift',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/icon/booking.svg'),
              label: 'View Booking',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/images/icon/availability.svg'),
              label: 'Apporve TimeSheets',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: HexColor("#259ee7"),
          backgroundColor: HexColor("#FFFFFFFF"),
          unselectedItemColor: HexColor("#a4adb6"),
          onTap: _onItemTapped,
        ),
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
