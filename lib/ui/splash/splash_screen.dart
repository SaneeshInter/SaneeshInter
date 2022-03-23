import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpresshealthdev/Constants/sharedPrefKeys.dart';
import 'package:xpresshealthdev/ui/login/login_screen.dart';
import 'package:xpresshealthdev/ui/manager_dashboard_screen.dart';

import '../../UI/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future changeScreen() async {
    SharedPreferences shdPre = await SharedPreferences.getInstance();
    bool _isLoggedin = shdPre.getString(SharedPrefKey.AUTH_TOKEN) != null;
    var _loginType = shdPre.getInt(SharedPrefKey.USER_TYPE);
    print("_loginType");
    print(_loginType);

    if (_isLoggedin && _loginType != null) {
      if (_loginType == 0) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashBoard()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ManagerDashBoard()));
      }
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(new Duration(seconds: 2), () {
      changeScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        //change status bar icon color
        // statusBarColor: Colors.white, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/icon/Bg1.png"),
                fit: BoxFit.cover)),
        child: Center(
          child: SvgPicture.asset(
            "assets/images/icon/whitelogo.svg",
            width: MediaQuery.of(context).size.width / 1.4,
          ),
        ),
      ),
    );
  }
}
