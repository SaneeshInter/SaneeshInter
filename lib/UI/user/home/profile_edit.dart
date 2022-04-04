import 'dart:core';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'package:xpresshealthdev/model/gender_list.dart';
import 'package:xpresshealthdev/utils/validator.dart';

import '../../../Constants/strings.dart';
import '../../../Constants/toast.dart';
import '../../../blocs/profile_update_bloc.dart';
import '../../../utils/constants.dart';
import '../../widgets/buttons/drawable_button.dart';
import '../../widgets/buttons/login_button.dart';
import '../../widgets/input_text.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  _CreateShiftState createState() => _CreateShiftState();
}

 List<GenderList> genderList=[];

class _CreateShiftState extends State<ProfileEditScreen> {
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

  TextEditingController gender = new TextEditingController();
  TextEditingController dob = new TextEditingController();
  TextEditingController controller = TextEditingController();
  TextEditingController phonenumber = new TextEditingController();
  TextEditingController ppsnumber = new TextEditingController();
  TextEditingController bank_iban = new TextEditingController();
  TextEditingController bank_bic = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController bank_details = new TextEditingController();
  TextEditingController first_name = new TextEditingController();
  TextEditingController last_name = new TextEditingController();
  TextEditingController nationality = new TextEditingController();
  TextEditingController home_address = new TextEditingController();
  TextEditingController visa_type = new TextEditingController();



  //updstaes
  TextEditingController permission_to_work_in_ireland =
      new TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();


  final items=["job visa","visiting visa"];
  // LoginBloc _loginBloc = LoginBloc();
  // ToastMsg toastMsg = ToastMsg();
  bool visible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileBloc.getUserInfo();
    // profileBloc.getGenderList();
    listner();
    observerResponse();
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
                                                      16.0, 10, 0, 0),
                                              child: AutoSizeText(
                                                'Update Profile ',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "SFProMedium",
                                                ),
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 150),
                                              child: Column(
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.22,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                          child: AspectRatio(
                                                            aspectRatio: 1 / 1,
                                                            child:
                                                                Image.network(
                                                              'https://i.imgur.com/PJpPD6S.png',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                65, 70, 0, 0),
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.05,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0),
                                                                child:
                                                                    AspectRatio(
                                                                  aspectRatio:
                                                                      1 / 1,
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/images/icon/edittool.png'),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 20,
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 150),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.18,
                                                    child: Column(
                                                      children: [
                                                        // displayImage(),
                                                        SizedBox(height: 30),
                                                        // DrawableButton(
                                                        //   onPressed: () {
                                                        //     showOptionsDialog(
                                                        //         context);
                                                        //   },
                                                        //   label: "Edit",
                                                        //   asset:
                                                        //       "assets/images/icon/swipe-to-right.svg",
                                                        //   backgroundColor:
                                                        //       Constants
                                                        //           .colors[4],
                                                        //   textColors: Constants
                                                        //       .colors[0],
                                                        // ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 25,
                                            ),

                                            ////TextFeilds//////////

                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                        flex: 1,
                                                        child: TextInputFileds(
                                                            controlr:
                                                                first_name,
                                                            onTapDate: () {},
                                                            validator: (name) {
                                                              if (validfirstname(
                                                                  name))
                                                                return null;
                                                              else {
                                                                return "enter firstname";
                                                              }
                                                            },
                                                            hintText:
                                                                Txt.first_name,
                                                            keyboadType:
                                                                TextInputType
                                                                    .text,
                                                            isPwd: false)),
                                                    Expanded(
                                                      flex: 1,
                                                      child: TextInputFileds(
                                                        controlr: last_name,
                                                        validator: (name) {
                                                          if (validlastname(
                                                              name))
                                                            return null;
                                                          else {
                                                            return "enter last name";
                                                          }
                                                        },
                                                        hintText: Txt.last_name,
                                                        keyboadType:
                                                            TextInputType.text,
                                                        isPwd: false,
                                                        onTapDate: () {},
                                                      ),
                                                    ),
                                                  ],
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
                                                      child: TextInputFileds(
                                                          controlr: date,
                                                          validator: (dob) {
                                                            if (validDate(dob))
                                                              return null;
                                                            else
                                                              return "select dob";
                                                          },
                                                          onTapDate: () {
                                                            _selectDate(
                                                                context, date);
                                                            print("values");
                                                          },
                                                          hintText: Txt.dob,
                                                          keyboadType:
                                                              TextInputType
                                                                  .none,
                                                          isPwd: false),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 19),
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
                                                                            10)),
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
                                                                  "Select Gender",
                                                            ),
                                                            items:  getGender(),
                                                            onChanged: (value) {
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
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
                                                                            10)),
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
                                                                  "Select Nationality",
                                                            ),
                                                            items: _nationality,
                                                            onChanged: (value) {
                                                              setState(() {});
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: TextInputFileds(
                                                          controlr: phonenumber,
                                                          onTapDate: () {},
                                                          validator: (number) {
                                                            if (validphonenumber(
                                                                number))
                                                              return null;
                                                            else
                                                              return "enter phone number";
                                                          },
                                                          hintText:
                                                              Txt.phone_number,
                                                          keyboadType:
                                                              TextInputType
                                                                  .number,
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
                                                  child: TextInputFileds(
                                                      controlr: home_address,
                                                      onTapDate: () {},
                                                      validator: (address) {
                                                        if (validadress(
                                                            address))
                                                          return null;
                                                        else
                                                          return "enter your address";
                                                      },
                                                      hintText: Txt.address,
                                                      keyboadType: TextInputType
                                                          .visiblePassword,
                                                      isPwd: false),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),

                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 20),
                                              child: Container(
                                                height: 40.sp,
                                                width: 90.w,
                                                child: DropdownButtonFormField(
                                                  hint:
                                                      Text('Please choose one'),
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            8.0)),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1)),
                                                    contentPadding:
                                                        EdgeInsets.all(8.0),
                                                    labelText:
                                                        "Select Visa Type ",
                                                  ),
                                                  items: _visa,
                                                  onChanged: (value) {
                                                    setState(() {});
                                                  },
                                                ),
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  child: TextInputFileds(
                                                      controlr: email,
                                                      onTapDate: () {},
                                                      validator: (number) {
                                                        if (validEmail(number))
                                                          return null;
                                                        else
                                                          return "enter email";
                                                      },
                                                      hintText: Txt.email,
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
                                                  child: TextInputFileds(
                                                      controlr:
                                                          permission_to_work_in_ireland,
                                                      validator: (permission) {
                                                        if (vaidpermission_to_work_in_ireland(
                                                            permission))
                                                          return null;
                                                        else
                                                          return "enter permission";
                                                      },
                                                      onTapDate: () {},
                                                      hintText: Txt
                                                          .permission_to_work_in_ireland,
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
                                                  child: TextInputFileds(
                                                      controlr: ppsnumber,
                                                      validator: (permission) {
                                                        if (validppsnumber(
                                                            permission))
                                                          return null;
                                                        else
                                                          return "enter pps number";
                                                      },
                                                      onTapDate: () {},
                                                      hintText: Txt.pps_number,
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
                                                  child: TextInputFileds(
                                                      controlr: bank_iban,
                                                      validator: (number) {
                                                        if (validbankiban(
                                                            number))
                                                          return null;
                                                        else
                                                          return "enter bankiban";
                                                      },
                                                      onTapDate: () {},
                                                      hintText: Txt.bankiban,
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
                                                  child: TextInputFileds(
                                                      controlr: bank_bic,
                                                      validator: (number) {
                                                        if (validbankbic(
                                                            number))
                                                          return null;
                                                        else
                                                          return "enter bankbic";
                                                      },
                                                      onTapDate: () {},
                                                      hintText: Txt.bankbic,
                                                      keyboadType:
                                                          TextInputType.text,
                                                      isPwd: false),
                                                ),
                                              ],
                                            ),

                                            SizedBox(
                                              height: 15,
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

  List<DropdownMenuItem<String>> _nationality = [
    DropdownMenuItem(
      child: new Text(
        "indian",
      ),
      //value: "Male",
    ),
    DropdownMenuItem(
      child: new Text(
        "indian",
      ),
      value: "",
    ),
  ];

  List<DropdownMenuItem<String>> _visa = [
    DropdownMenuItem(
      child: new Text(
        "job visa",
      ),
      //value: "Male",
    ),
    DropdownMenuItem(
      child: new Text(
        "visiting visa",
      ),
      value: "",
    ),
  ];

  getGender() {
    List<DropdownMenuItem<String>> _genders = [];
    if (null != genderList) {
      for (var item in genderList) {
        _genders.add(DropdownMenuItem(
          child: Text(item.gender!),
          //value: "Male",
        ));
      }
    }
    return _genders;
  }

  List<DropdownMenuItem<String>> _genders = [
    DropdownMenuItem(
      child: new Text(
        "male",
      ),
      //value: "Male",
    ),
    DropdownMenuItem(
      child: new Text(
        "female",
      ),
      value: "",
    ),
  ];

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
                      final prefs = await SharedPreferences.getInstance();
                      var token = prefs.getString(
                        "TOKEN",
                      );

                      var validate = formKey.currentState?.validate();
                      if (null != validate) {
                        if (validate) {
                          //   ProfileBlocc.ProfileUser(
                          //       gender.text, first_name.text, last_name, dob, nationality, home_address, permission_to_work_in_ireland, visa_type, phone_number, email, pps_number, bank_iban, bank_bic)
                        }
                        // use the information provided
                      }
                      //showFeactureAlert(context, date: "");
                      // use the information provided
                    },
                    label: "SUBMIT")
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

  void listner() {
    profileBloc.getProfileStream.listen((event) {
      print("Profile Stream");
      print(event.userResponse?.data?.items?[0].email);
      print(event.userResponse?.data?.items?[0].firstName);
      print(event.userResponse?.data?.items?[0].lastName);

      if (null != event.userResponse?.data?.items?[0]) {
        var item = event.userResponse?.data?.items?[0];
        if (null != item) {
          first_name.text = item.firstName!;
          last_name.text = item.lastName!;
        }
      }
    });

    // profileBloc.gender.listen((event) {
    //   genderList = event;
    // });
  }

  void observerResponse() {
    profileBloc.profileStream.listen((event) {

    });
  }
}

_selectDate(BuildContext context, TextEditingController dateController) async {
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

//
// _selectTime(BuildContext context, TextEditingController anycontroller) async {
//   print("time");
//
//   final TimeOfDay? timeOfDay = await showTimePicker(
//     context: context,
//     initialTime: TimeOfDay.now(),
//     initialEntryMode: TimePickerEntryMode.input,
//     confirmText: "CONFIRM",
//     cancelText: "NOT NOW",
//     helpText: "BOOKING TIME",
//   );
//
//   if (timeOfDay != null) {
//     anycontroller.text = timeOfDay.format(context);
//   }
// }
//
List<DropdownMenuItem<String>> _nationality = [
  DropdownMenuItem(
    child: new Text(
      "indian",
    ),
    //value: "Male",
  ),
  DropdownMenuItem(
    child: new Text(
      "indian",
    ),
    value: "",
  ),
];

List<DropdownMenuItem<String>> _visa = [
  DropdownMenuItem(
    child: new Text(
      "job visa",
    ),
    //value: "Male",
  ),
  DropdownMenuItem(
    child: new Text(
      "visiting visa",
    ),
    value: "",
  ),
];

List<DropdownMenuItem<String>> _genders = [
  DropdownMenuItem(
    child: new Text(
      "male",
    ),
    //value: "Male",
  ),
  DropdownMenuItem(
    child: new Text(
      "female",
    ),
    value: "",
  ),
];
