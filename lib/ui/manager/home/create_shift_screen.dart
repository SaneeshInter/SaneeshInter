import 'dart:core';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/blocs/createshift_manager_bloc.dart';
import 'package:xpresshealthdev/utils/validator.dart';

import '../../../Constants/sharedPrefKeys.dart';
import '../../../Constants/strings.dart';
import '../../../Constants/toast.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../widgets/buttons/login_button.dart';
import '../../widgets/input_text.dart';
import '../../widgets/input_text_description.dart';

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
  TextEditingController time_from = new TextEditingController();
  TextEditingController time_to = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController job_details = new TextEditingController();
  TextEditingController token = new TextEditingController();
  TextEditingController job_title = new TextEditingController();
  TextEditingController resourceType = new TextEditingController();

  TextEditingController type = new TextEditingController();
  TextEditingController user_type = new TextEditingController();
  TextEditingController category = new TextEditingController();
  TextEditingController hospital = new TextEditingController();
  TextEditingController assigned_to = new TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  TextEditingController controller = TextEditingController();

  // LoginBloc _loginBloc = LoginBloc();
  // ToastMsg toastMsg = ToastMsg();
  bool visible = false;

  @override
  void initState() {


    observerResponse();

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
                                  padding: const EdgeInsets.all(8.0),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    child: Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(
                                              height: 25,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      16.0, 0, 0, 0),
                                              child: AutoSizeText(
                                                'Create Shift',
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
                                                  child: TextInputFileds(
                                                      controlr: jobtitle,
                                                      validator: (jobtitle) {
                                                        if (validJob(jobtitle))
                                                          return null;
                                                        else
                                                          return "enter job title";
                                                      },
                                                      hintText: Txt.jobtitle,
                                                      keyboadType:
                                                          TextInputType.text,
                                                      isPwd: false,
                                                      onTapDate: () {}),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  child: TextInputFileds(
                                                      controlr: location,
                                                      onTapDate: () {},
                                                      validator: (location) {
                                                        if (validLocation(
                                                            location))
                                                          return null;
                                                        else
                                                          return "enter your location";
                                                      },
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

                                                  child: TextInputFiledDescription(

                                                      controlr: jobDescri,
                                                      onTapDate: () {},
                                                      validator: (jobDescri) {
                                                        if (validDescription(
                                                            jobDescri))
                                                          return null;
                                                        else
                                                          return "enter job decscription";
                                                      },
                                                      hintText: Txt.jobDescri,
                                                      keyboadType: TextInputType
                                                          .visiblePassword,
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
                                                  child: TextInputFileds(
                                                      controlr: date,
                                                      validator: (date) {
                                                        if (validDate(date))
                                                          return null;
                                                        else
                                                          return "select date";
                                                      },
                                                      onTapDate: () {
                                                        _selectDate(
                                                            context, date);
                                                        print("values");
                                                      },
                                                      hintText: Txt.date,
                                                      keyboadType:
                                                          TextInputType.none,
                                                      isPwd: false),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(right: 2),
                                                        child: Container(
                                                          child: TextInputFileds(
                                                              controlr: dateFrom,
                                                              validator: (dateTo) {
                                                                if (validDate(dateTo))
                                                                  return null;
                                                                else
                                                                  return "select time";
                                                              },
                                                              onTapDate: () {
                                                                _selectTime(
                                                                    context, dateFrom);
                                                              },
                                                              hintText: Txt.timeFrom,
                                                              keyboadType:
                                                              TextInputType.none,
                                                              isPwd: false),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child:  TextInputFileds(
                                                          controlr: dateTo,
                                                          validator: (dateTo) {
                                                            if (validDate(dateTo))
                                                              return null;
                                                            else
                                                              return "select time";
                                                          },
                                                          onTapDate: () {
                                                            FocusScope.of(context)
                                                                .unfocus();
                                                            _selectTime(
                                                                context, dateTo);
                                                          },
                                                          hintText: Txt.timeTo,
                                                          keyboadType:
                                                          TextInputType.none,
                                                          isPwd: false),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),

                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(left: 18),
                                                        child: Container(
                                                          child:
                                                          DropdownButtonFormField(
                                                            hint: Text(
                                                                'Please choose one'),
                                                            decoration:
                                                            InputDecoration(
                                                              enabledBorder:
                                                              OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                    .circular(
                                                                    5)),
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          8.0)),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .grey,
                                                                      width:
                                                                      1)),
                                                              contentPadding:
                                                              EdgeInsets
                                                                  .all(3.0),
                                                              labelText:
                                                              "Select User Type",
                                                            ),
                                                            items: _genders,
                                                            onChanged: (value) {
                                                              //setState();
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child:  DropdownButtonFormField(
                                                        hint: Text(
                                                            'Please choose one'),
                                                        decoration:
                                                        InputDecoration(
                                                          enabledBorder:
                                                          OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .all(Radius
                                                                .circular(5)),
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      8.0)),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                  width:
                                                                  1)),
                                                          contentPadding:
                                                          EdgeInsets
                                                              .all(3.0),
                                                          labelText:
                                                          "Select Resource Type",
                                                        ),
                                                        items: _genders,
                                                        onChanged: (value) {
                                                          //setState();
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),



                                            SizedBox(
                                              height: 20,
                                            ),

                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets
                                                            .only(left: 18),
                                                        child: Container(
                                                          child:
                                                          DropdownButtonFormField(
                                                            hint: Text(
                                                                'Please choose one'),
                                                            decoration:
                                                            InputDecoration(
                                                              enabledBorder:
                                                              OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                    .circular(
                                                                    5)),
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                              focusedBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(
                                                                          8.0)),
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .grey,
                                                                      width:
                                                                      1)),
                                                              contentPadding:
                                                              EdgeInsets
                                                                  .all(3.0),
                                                              labelText:
                                                              "Select Category",
                                                            ),
                                                            items: _genders,
                                                            onChanged: (value) {
                                                              //setState();
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child:  DropdownButtonFormField(
                                                        hint: Text(
                                                            'Please choose one'),
                                                        decoration:
                                                        InputDecoration(
                                                          enabledBorder:
                                                          OutlineInputBorder(
                                                            borderRadius: BorderRadius
                                                                .all(Radius
                                                                .circular(5)),
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          focusedBorder: OutlineInputBorder(
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      8.0)),
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                  width:
                                                                  1)),
                                                          contentPadding:
                                                          EdgeInsets
                                                              .all(3.0),
                                                          labelText:
                                                          "Select  Hospital",
                                                        ),
                                                        items: _genders,
                                                        onChanged: (value) {
                                                          //setState();
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),

                                            SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              height: 5.5.h,
                                              width: screenWidth(context,
                                                  dividedBy: 1),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: 0,
                                                    left: 20,
                                                    right: 20),
                                                child: DropdownButtonFormField(
                                                  style: TextStyle(
                                                      fontFamily:
                                                      'SFProRegular',
                                                      fontWeight:
                                                      FontWeight.w500,
                                                      fontSize: 10.sp,
                                                      color: Colors.grey),
                                                  hint:
                                                  Text('Please choose one'),
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              5)),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey),
                                                    ),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .all(Radius
                                                            .circular(
                                                            5.0)),
                                                        borderSide:
                                                        BorderSide(
                                                            color: Colors
                                                                .grey,
                                                            width: 1)),
                                                    contentPadding:
                                                    EdgeInsets.all(8.0),
                                                    labelStyle: TextStyle(
                                                        fontFamily:
                                                        'SFProRegular',
                                                        fontWeight:
                                                        FontWeight.w500,
                                                        fontSize: 10.sp,
                                                        color: Colors.grey),
                                                    labelText:
                                                    "assigned to ",
                                                  ),
                                                  items: _genders,
                                                  onChanged: (value) {
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            signUpBtn(),
                                            const SizedBox(
                                              height: 15,
                                            ),
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
                          // managerBloc.fetchManager(token.text, jobtitle.text, category.text,
                          //     job_title.text, hospital.text, date.text, time_from.text, time_to.text,
                          //     job_details.text,price.text);
                          final prefs = await SharedPreferences.getInstance();
                          var auth_tokn =
                              prefs.getString(SharedPrefKey.AUTH_TOKEN);
                          if (null != auth_tokn) {
                            managerBloc.createShiftManager(
                              auth_tokn,
                              type.text,
                              category.text,
                              user_type.text,
                              jobtitle.text,
                              hospital.text,
                              date.text,
                              time_from.text,
                              time_to.text,
                              job_details.text,
                              price.text,
                            );
                          } else {
                            print("TOKEN NULL");
                          }
                        }
                      }
                      // showFeactureAlert(context, date: "");
                    },
                    label: "Create Shifts")
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

  void observerResponse() {
    managerBloc.getmanagerStream.listen((event) {
      print("RESPONSE FROM UI");
      print(event.response?.status?.statusMessage.toString());
      print(event.response?.status?.statusCode);
      var message = event?.response?.status?.statusMessage.toString();
      if (event.response?.status?.statusCode == 200) {

        showAlertDialoge(context, title: "Success", message: message!!);
        jobtitle.text = "";
        hospital.text="";
      date.text="";

      } else {
        showAlertDialoge(context,
            title: "Invalid", message: "Enter a valid Email and Password");
      }
    });
  }

  _selectDate(
      BuildContext context, TextEditingController dateController) async {
    print("date");
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: DateTime(2020, 11, 17),
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
      fieldHintText: "dd-MM-yyyy",
    );

    if (newDate != null) {
      print(newDate);

      var dates = DateFormat('dd-MM-yyyy').format(newDate);
      dateController.text = dates;
    }
  }

  _selectTime(BuildContext context, TextEditingController anycontroller) async {
    print("time");

    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      confirmText: "CONFIRM",
      cancelText: "NOT NOW",
      helpText: "BOOKING TIME",
    );

    if (timeOfDay != null) {
      anycontroller.text = timeOfDay.format(context);
    }
  }

  List<DropdownMenuItem<String>> _genders = [
    DropdownMenuItem(
      child: new Text("Source 1"),
      //value: "Male",
    ),
    DropdownMenuItem(
      child: new Text("Source 2"),
      value: "",
    ),
  ];
}
