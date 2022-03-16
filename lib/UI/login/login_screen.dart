import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/utils/utils.dart';

import '../../Constants/strings.dart';
import '../../Constants/toast.dart';
import '../../utils/constants.dart';
import '../../utils/validator.dart';
import '../dashboard_screen.dart';
import '../manager_dashboard_screen.dart';
import '../widgets/buttons/login_button.dart';
import '../widgets/input_text.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ToastMsg toastMsg = ToastMsg();
  bool isLoading = false;
  TextEditingController email = new TextEditingController();
  TextEditingController pwd = new TextEditingController();

  // LoginBloc _loginBloc = LoginBloc();
  // ToastMsg toastMsg = ToastMsg();
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
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Constants.colors[9],
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/icon/Bg2.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
            fit: BoxFit.fill,
          ),
          Container(
            child: Stack(
              children: [
                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 70.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Form(
                            // autovalidateMode: AutovalidateMode.always,
                            key: formKey,
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    child: Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            logoImage(),
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  20.0, 0, 0, 0),
                                              child: AutoSizeText(
                                                Txt.login,
                                                textAlign: TextAlign.start,
                                                maxLines: 3,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.w800,
                                                    fontFamily: "SFProBold"),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  child: TextInputFileds(
                                                    controlr: email,
                                                    validator: (email) {
                                                      if (validEmail(email))
                                                        return null;
                                                      else
                                                        return 'Enter a valid email address';
                                                    },
                                                    hintText: Txt.email,
                                                    keyboadType: TextInputType
                                                        .emailAddress,
                                                    isPwd: false, onTapDate: (){},
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  child: TextInputFileds(
                                                    controlr: pwd,
                                                    validator: (password) {
                                                      if (validPassword(
                                                          password))
                                                        return null;
                                                      else
                                                        return 'Enter a valid password';
                                                    },
                                                    hintText: Txt.pwd,
                                                    keyboadType: TextInputType
                                                        .visiblePassword,
                                                    isPwd: true, onTapDate: (){},
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            signUpBtn(),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                            // Platform.isIOS ? AppleSignInButton(
                                            // //style: ButtonStyle.black,
                                            // type: ButtonType.continueButton,
                                            // onPressed: appleLogIn,):Container(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 25, top: 0),
                    child: Text(
                      "Powered By Xpress Health",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: "SFProMedium"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget textInputFileds(
      {required String hintText,
      required validator,
      required TextEditingController controlr,
      required TextInputType keyboadType,
      required bool isPwd}) {
    return Container(
      // height: 100,

      height: 45,
      width: screenWidth(context, dividedBy: 1),
      padding: EdgeInsets.only(top: 0, left: 20, right: 20),
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
                fontFamily: 'SFProRegular',
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
                fontFamily: 'SFProRegular',
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
                    child:
                        Image(image: AssetImage("assets/images/whitelogo.png")),
                  ),
          ),
        ),
      ],
    );
  }

  Widget signUpBtn() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
              child: Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Stack(
              children: [
                LoginButton(
                    onPressed: () async {
                      var validate = formKey.currentState?.validate();
                      if (null != validate) {
                        if (validate) {
                          final prefs = await SharedPreferences.getInstance();
                          if (prefs.getBool("user") != null) {
                            if (prefs.getBool("user") == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashBoard()),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ManagerDashBoard()),
                              );
                            }
                          }
                        }
                        // use the information provided
                      }
                    },
                    label: "Login")
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
        Center(
            child: Stack(
          children: [
            Visibility(
              visible: true,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 0, right: 0, bottom: 0),
                child: Container(
                    height: MediaQuery.of(context).size.width / 5,
                    width: MediaQuery.of(context).size.width / 2,
                    child: SvgPicture.asset(
                      'assets/images/icon/logo.svg',
                    )),
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
        )),
      ],
    );
  }
}

class CustColors {
  static const DarkBlue = Color(0xff4e1d56);
  static const Green = Color(0xff6386da);
  static const Blue1 = Color(0xffa4bcf7);
  static const Green1 = Color(0xffdaf2a5);

  static const White = Color(0xffffffff);
}
