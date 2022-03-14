import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpresshealthdev/UI/dashboard_screen.dart';
import 'package:xpresshealthdev/utils/utils.dart';

import '../../../Constants/strings.dart';
import '../../../Constants/toast.dart';
import '../../../utils/constants.dart';
import '../../widgets/buttons/login_button.dart';

class CreateShiftScreen extends StatefulWidget {

  const CreateShiftScreen({Key? key}) : super(key: key);
  @override
  _CreateShiftState createState() => _CreateShiftState();
}

class _CreateShiftState extends State<CreateShiftScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  ToastMsg toastMsg = ToastMsg();
  bool isLoading = false;
  TextEditingController location = new TextEditingController();
  TextEditingController jobtitle = new TextEditingController();
  TextEditingController jobDescri = new TextEditingController();
  TextEditingController date = new TextEditingController();
  TextEditingController dateFrom = new TextEditingController();
  TextEditingController dateTo = new TextEditingController();
  TextEditingController resourceType = new TextEditingController();

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
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Form(
                          key: formKey,
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [

                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: ClipRRect(
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
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(16.0,0,0,0),
                                              child: AutoSizeText(
                                                'File the form',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "SFProMedium",
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  child: textInputFileds(
                                                      controlr: jobtitle,
                                                      hintText: Txt.jobtitle,
                                                      keyboadType:
                                                          TextInputType.text,
                                                      isPwd: false),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  child: textInputFileds(
                                                      controlr: location,
                                                      hintText: Txt.location,
                                                      keyboadType:
                                                          TextInputType.text,
                                                      isPwd: false),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  child: textInputFileds(
                                                      controlr: jobDescri,
                                                      hintText: Txt.jobDescri,
                                                      keyboadType: TextInputType
                                                          .visiblePassword,
                                                      isPwd: true),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  child: textInputFileds(
                                                      controlr: jobDescri,
                                                      hintText: Txt.date,
                                                      keyboadType: TextInputType
                                                          .visiblePassword,
                                                      isPwd: true),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  child: textInputFileds(
                                                      controlr: dateFrom,
                                                      hintText: Txt.timeFrom,
                                                      keyboadType: TextInputType
                                                          .visiblePassword,
                                                      isPwd: true),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  child: textInputFileds(
                                                      controlr: dateTo,
                                                      hintText: Txt.timeTo,
                                                      keyboadType: TextInputType
                                                          .visiblePassword,
                                                      isPwd: true),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),

                                            Column(
                                              children: [
                                                Container(
                                                  child: textInputFileds(
                                                      controlr: resourceType,
                                                      hintText:
                                                          Txt.selectResourceType,
                                                      keyboadType: TextInputType
                                                          .visiblePassword,
                                                      isPwd: true),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            signUpBtn(),
                                        const SizedBox(
                                          height: 15,
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
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
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
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => DashBoard()),
                      // );
                    },
                    label: "Create Shifts")
              ],
            ),
          )),
        ),
        SizedBox(
          height: 5,
        ),
        // Padding(
        //   padding: EdgeInsets.only(top: 5, bottom: 0, left: 20, right: 20),
        //   child: Container(
        //     child: Row(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Flexible(
        //           child: Text(
        //             Txt.nopAccunt,
        //             style: TextStyle(
        //                   fontWeight: FontWeight.w700,
        //                   fontSize: 18,
        //                   color: Colors.black
        //             ),),
        //         ),
        //         InkWell(
        //             onTap: (){
        //               // print('Button Clicked');
        //               // Navigator.push(
        //               //   context,
        //               //   MaterialPageRoute(builder: (context) => SignUpScreen()),
        //               // );
        //             },
        //             child: Padding(
        //               padding: const EdgeInsets.all(8.0),
        //               child: Text(Txt.createAccunt,
        //
        //                 style: TextStyle(color: Colors.blue,
        //                       fontSize: 15,fontWeight: FontWeight.bold
        //                 ),),
        //             )
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // InkWell(
        //     onTap: (){
        //       print('Button Clicked');
        //     },
        //     child: Padding(
        //       padding: const EdgeInsets.all(8.0),
        //       child: Text(Txt.forgotPassword,
        //         style: TextStyle(color: Colors.blue,
        //               fontSize: 15,fontWeight: FontWeight.bold
        //         ),),
        //     )
        // ),
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
