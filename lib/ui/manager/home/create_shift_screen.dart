import 'dart:core';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/blocs/createshift_manager_bloc.dart';
import 'package:xpresshealthdev/model/schedule_categegory_list.dart';
import 'package:xpresshealthdev/model/schedule_hospital_list.dart';
import 'package:xpresshealthdev/model/shift_type_list.dart';
import 'package:xpresshealthdev/model/viewbooking_response.dart';
import 'package:xpresshealthdev/utils/validator.dart';

import '../../../Constants/sharedPrefKeys.dart';
import '../../../Constants/strings.dart';
import '../../../Constants/toast.dart';
import '../../../blocs/shift_dropdown.dart';
import '../../../model/user_type_list.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../widgets/buttons/login_button.dart';
import '../../widgets/input_text.dart';
import '../../widgets/input_text_description.dart';

class CreateShiftScreen extends StatefulWidget {
  final Items? shiftItem;

  const CreateShiftScreen({Key? key, this.shiftItem}) : super(key: key);

  @override
  _CreateShiftState createState() => _CreateShiftState();
}

class _CreateShiftState extends State<CreateShiftScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var typeId = 0;
  var categoryId = 0;
  var usertypeId = 0;

  var hospitalId = 0;

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
    if (widget.shiftItem != null) {
      var item = widget.shiftItem;
      if (item != null) {
        jobtitle.text = item.jobTitle!;
        jobDescri.text = item.jobDetails!;
      }
    }
    observerResponse();
    // TODO: implement initState
    dropdownBloc.addItem();
    managerBloc.getDropDownValues();

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
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 18),
                                                        child: Container(
                                                          width: 400,
                                                          child: StreamBuilder(
                                                            stream: managerBloc
                                                                .typeStream,
                                                            builder: (context,
                                                                AsyncSnapshot<
                                                                        List<
                                                                            ShiftTypeList>>
                                                                    snapshot) {
                                                              print(
                                                                  "snapshot.data?.length");
                                                              print(snapshot
                                                                  .data
                                                                  ?.length);
                                                              if (null ==
                                                                      snapshot
                                                                          .data ||
                                                                  snapshot.data
                                                                          ?.length ==
                                                                      0) {
                                                                return Container();
                                                              }

                                                              return DropdownButtonFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(5)),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.grey),
                                                                  ),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              8.0)),
                                                                      borderSide: BorderSide(
                                                                          color: Colors
                                                                              .grey,
                                                                          width:
                                                                              1)),
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              3.0),
                                                                  labelText:
                                                                      "Type",
                                                                ),
                                                                items: snapshot
                                                                    .data
                                                                    ?.map(
                                                                        (item) {
                                                                  return DropdownMenuItem(
                                                                    child:
                                                                        new Text(
                                                                      item.type!,
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize: 8
                                                                              .sp,
                                                                          decoration: TextDecoration
                                                                              .none,
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                    value: item,
                                                                  );
                                                                }).toList(),
                                                                onChanged:
                                                                    (Object?
                                                                        value) {
                                                                  if (value
                                                                      is ShiftTypeList) {
                                                                    print(
                                                                        "value");
                                                                    print(value
                                                                        ?.type);
                                                                    print(value
                                                                        ?.rowId);

                                                                    typeId = value
                                                                        .rowId!;
                                                                  }
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 18),
                                                        child: Container(
                                                          width: 400,
                                                          child: StreamBuilder(
                                                            stream: managerBloc
                                                                .categoryStream,
                                                            builder: (context,
                                                                AsyncSnapshot<
                                                                        List<
                                                                            ScheduleCategoryList>>
                                                                    snapshot) {
                                                              print(
                                                                  "snapshot.data?.length");
                                                              print(snapshot
                                                                  .data
                                                                  ?.length);
                                                              if (null ==
                                                                      snapshot
                                                                          .data ||
                                                                  snapshot.data
                                                                          ?.length ==
                                                                      0) {
                                                                return Container();
                                                              }

                                                              return DropdownButtonFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(5)),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.grey),
                                                                  ),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              8.0)),
                                                                      borderSide: BorderSide(
                                                                          color: Colors
                                                                              .grey,
                                                                          width:
                                                                              1)),
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              3.0),
                                                                  labelText:
                                                                      "Category",
                                                                ),
                                                                items: snapshot
                                                                    .data
                                                                    ?.map(
                                                                        (item) {
                                                                  return DropdownMenuItem(
                                                                    child:
                                                                        new Text(
                                                                      item.category!,
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize: 8
                                                                              .sp,
                                                                          decoration: TextDecoration
                                                                              .none,
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                    value: item,
                                                                  );
                                                                }).toList(),
                                                                onChanged:
                                                                    (Object?
                                                                        value) {
                                                                  if (value
                                                                      is ScheduleCategoryList) {
                                                                    print(
                                                                        "value");
                                                                    print(value
                                                                        ?.rowId);
                                                                    print(value
                                                                        ?.userType);

                                                                    categoryId =
                                                                        value
                                                                            .rowId!;
                                                                  }
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
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
                                                          width: 400,
                                                          child: StreamBuilder(
                                                            stream: managerBloc
                                                                .usertypeStream,
                                                            builder: (context,
                                                                AsyncSnapshot<
                                                                        List<
                                                                            UserTypeList>>
                                                                    snapshot) {
                                                              print(
                                                                  "snapshot.data?.length");
                                                              print(snapshot
                                                                  .data
                                                                  ?.length);
                                                              if (null ==
                                                                      snapshot
                                                                          .data ||
                                                                  snapshot.data
                                                                          ?.length ==
                                                                      0) {
                                                                return Container();
                                                              }

                                                              return DropdownButtonFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(5)),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.grey),
                                                                  ),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              8.0)),
                                                                      borderSide: BorderSide(
                                                                          color: Colors
                                                                              .grey,
                                                                          width:
                                                                              1)),
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              3.0),
                                                                  labelText:
                                                                      "User Type",
                                                                ),
                                                                items: snapshot
                                                                    .data
                                                                    ?.map(
                                                                        (item) {
                                                                  return DropdownMenuItem(
                                                                    child:
                                                                        new Text(
                                                                      item.type!,
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize: 8
                                                                              .sp,
                                                                          decoration: TextDecoration
                                                                              .none,
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                    value: item,
                                                                  );
                                                                }).toList(),
                                                                onChanged:
                                                                    (Object?
                                                                        value) {
                                                                  if (value
                                                                      is UserTypeList) {
                                                                    print(
                                                                        "value");
                                                                    print(value
                                                                        ?.rowId);
                                                                    print(value
                                                                        ?.type);

                                                                    usertypeId =
                                                                        value
                                                                            .rowId!;
                                                                  }
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 18),
                                                        child: Container(
                                                          width: 400,
                                                          child: StreamBuilder(
                                                            stream: managerBloc
                                                                .hospitalStream,
                                                            builder: (context,
                                                                AsyncSnapshot<
                                                                        List<
                                                                            HospitalList>>
                                                                    snapshot) {
                                                              print(
                                                                  "snapshot.data?.length");
                                                              print(snapshot
                                                                  .data
                                                                  ?.length);
                                                              if (null ==
                                                                      snapshot
                                                                          .data ||
                                                                  snapshot.data
                                                                          ?.length ==
                                                                      0) {
                                                                return Container();
                                                              }

                                                              return DropdownButtonFormField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(5)),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.grey),
                                                                  ),
                                                                  focusedBorder: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(Radius.circular(
                                                                              8.0)),
                                                                      borderSide: BorderSide(
                                                                          color: Colors
                                                                              .grey,
                                                                          width:
                                                                              1)),
                                                                  contentPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              3.0),
                                                                  labelText:
                                                                      "Hospital",
                                                                ),
                                                                items: snapshot
                                                                    .data
                                                                    ?.map(
                                                                        (item) {
                                                                  return DropdownMenuItem(
                                                                    child:
                                                                        new Text(
                                                                      item.name!,
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          fontSize: 8
                                                                              .sp,
                                                                          decoration: TextDecoration
                                                                              .none,
                                                                          color:
                                                                              Colors.grey),
                                                                    ),
                                                                    value: item,
                                                                  );
                                                                }).toList(),
                                                                onChanged:
                                                                    (Object?
                                                                        value) {
                                                                  if (value
                                                                      is HospitalList) {
                                                                    print(
                                                                        "value");
                                                                    print(value
                                                                        ?.rowId);

                                                                    hospitalId =
                                                                        value
                                                                            .rowId!;
                                                                  }
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
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
                                                          child:
                                                              TextInputFileds(
                                                                  controlr:
                                                                      dateFrom,
                                                                  validator:
                                                                      (dateTo) {
                                                                    if (validDate(
                                                                        dateTo))
                                                                      return null;
                                                                    else
                                                                      return "select time";
                                                                  },
                                                                  onTapDate:
                                                                      () {
                                                                    _selectTime(
                                                                        context,
                                                                        dateFrom);
                                                                  },
                                                                  hintText: Txt
                                                                      .timeFrom,
                                                                  keyboadType:
                                                                      TextInputType
                                                                          .none,
                                                                  isPwd: false),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: TextInputFileds(
                                                          controlr: dateTo,
                                                          validator: (dateTo) {
                                                            if (validDate(
                                                                dateTo))
                                                              return null;
                                                            else
                                                              return "select time";
                                                          },
                                                          onTapDate: () {
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus();
                                                            _selectTime(context,
                                                                dateTo);
                                                          },
                                                          hintText: Txt.timeTo,
                                                          keyboadType:
                                                              TextInputType
                                                                  .none,
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
                                                Container(
                                                  child:
                                                      TextInputFiledDescription(
                                                          controlr: jobDescri,
                                                          onTapDate: () {},
                                                          validator:
                                                              (jobDescri) {
                                                            if (validDescription(
                                                                jobDescri))
                                                              return null;
                                                            else
                                                              return "enter job decscription";
                                                          },
                                                          hintText:
                                                              Txt.jobDescri,
                                                          keyboadType:
                                                              TextInputType
                                                                  .visiblePassword,
                                                          isPwd: false),
                                                ),
                                              ],
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
                              typeId,
                              categoryId,
                              usertypeId,
                              jobtitle.text,
                              hospitalId,
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
        hospital.text = "";
        date.text = "";
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
}
