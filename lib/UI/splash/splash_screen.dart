import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpresshealthdev/UI/splash/user_or_manager.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future changeScreen() async {
    // SharedPreferences shdPre = await SharedPreferences.getInstance();
    // bool _isLoggedin = (shdPre.getBool(SharedPrefKeys.isUserLoggedIn) ?? false);
    // // int _loginType = (shdPre.getInt(SharedPrefKeys.loginType));
    // if (_isLoggedin) {
    //   if (_loginType == 2) {
    //     Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => HomeScreen()));
    //   } else {
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) => FieldExeHomeScreen()));
    //   }
    // } else {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => UserOrManager()));
    //
    //
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => OpenFormScreen(
    //             loadUrl:
    //             "https://app.banqmart.com/show-Form",
    //             fieldExId:
    //             23,
    //             formId:
    //             10,
    //             leadId:
    //             10287)));
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
