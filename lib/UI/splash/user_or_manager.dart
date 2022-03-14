import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/UI/Login/login_screen.dart';

import '../../Constants/strings.dart';
import '../../Constants/toast.dart';
import '../../utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserOrManager extends StatefulWidget {
  @override
  _UserOrManagerScreenState createState() => _UserOrManagerScreenState();
}

class _UserOrManagerScreenState extends State<UserOrManager> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ToastMsg toastMsg = ToastMsg();

  bool isLoading = false;
  TextEditingController email = new TextEditingController();
  TextEditingController pwd = new TextEditingController();
  bool visible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_loginResponse();
  }

  @override
  void dispose() {
    // _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          key: _scaffoldKey,
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/icon/Bg1.png"),
                    fit: BoxFit.fill)),
            child: Container(
                child: Stack(
              children: <Widget>[
                Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        logoImage(),
                        userButton(),
                        managerButton(),
                        SizedBox(
                          height: screenWidth(context, dividedBy: 6),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 25, top: 0),
                          child: Text(
                            "Powered By Xpress Health",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    )),
              ],
            )),
          ),
        ),
      ],
    );
  }

  Widget textInputFileds(
      {required String hintText,
      validator,
      required TextEditingController controlr,
      required TextInputType keyboadType,
      required bool isPwd}) {
    return Container(
      // height: 100,
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextFormField(
        cursorWidth: 1.0,
        controller: controlr,
        validator: validator,
        textAlign: TextAlign.justify,
        obscureText: isPwd,
        maxLines: 1,
        keyboardType: keyboadType,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            labelStyle: TextStyle(
                // fontFamily: 'Abel',
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.grey),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                // fontFamily: 'Abel',
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.grey)),
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            decoration: TextDecoration.none,
            color: Colors.brown),
      ),
    );
  }

  Widget forgotpasswordnadLogin() {
    return Row(
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Container(
              child: InkWell(
                  onTap: () {
                    print("forgot password pressed");
                  },
                  child: Text(Txt.forgotPwd,
                      style: TextStyle(
                          // fontFamily: 'Abel',
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Colors.grey))),
            )),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 38),
          child: Container(
            width: 50,
            height: 50,
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  )
                : InkWell(
                    onTap: () {},
                    child: Image(image: AssetImage("assets/images/login.png")),
                  ),
          ),
        ),
      ],
    );
  }

  Widget managerButton() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(top: 10, left: 35, right: 35),
            child: Stack(
              children: [
                Visibility(
                  visible: !visible,
                  child: Container(
                    color: Colors.transparent,
                    height: commonButtonHeight(context),
                    width: screenWidth(context, dividedBy: 1),
                    child: ElevatedButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('user', false);
                        print('Button Clicked');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child:
                          const Text('Manager', style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              side:
                                  BorderSide(color: Colors.white, width: 2.0))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Visibility(
                      visible: visible,
                      child: Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 0, bottom: 0),
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  CustColors.Green),
                            )),
                      )),
                ),
              ],
            ),
          )),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget userButton() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(top: 10, left: 35, right: 35),
            child: Stack(
              children: [
                Visibility(
                  visible: !visible,
                  child: Container(
                    height: commonButtonHeight(context),
                    width: screenWidth(context, dividedBy: 1),
                    child: RaisedButton(
                      onPressed: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('user', true);
                        print('Button Clicked');
                        print('Button Clicked');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: const Text('User', style: TextStyle(fontSize: 18)),
                      color: Colors.white,
                      //HexColor('#6587da'),
                      textColor: Colors.black,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(7.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Visibility(
                      visible: visible,
                      child: Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 0, bottom: 0),
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  CustColors.Green),
                            )),
                      )),
                ),
              ],
            ),
          )),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Widget logoImage() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(top: 0, left: 20, right: 20),
            child: Stack(
              children: [
                Visibility(
                  visible: true,
                  child: Container(
                      alignment: Alignment.center,
                      height: 40.h,
                      width: 65.w,
                      child: SvgPicture.asset(
                        'assets/images/icon/whitelogo.svg',
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Visibility(
                      visible: visible,
                      child: Center(
                        child: Container(
                            margin: EdgeInsets.only(top: 0, bottom: 0),
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  CustColors.Green),
                            )),
                      )),
                ),
              ],
            ),
          )),
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class HexColor extends Color {
  static int _getColor(String hex) {
    String formattedHex = "FF" + hex.toUpperCase().replaceAll("#", "");
    return int.parse(formattedHex, radix: 16);
  }
  HexColor(final String hex) : super(_getColor(hex));
}
class CustColors {
  static const DarkBlue = Color(0xff4e1d56);
  static const Green = Color(0xff6386da);
  static const Blue1 = Color(0xffa4bcf7);
  static const Green1 = Color(0xffdaf2a5);
  static const White = Color(0xffffffff);
}
