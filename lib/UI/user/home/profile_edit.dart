import 'dart:core';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/utils/validator.dart';

import '../../../Constants/sharedPrefKeys.dart';
import '../../../Constants/strings.dart';
import '../../../Constants/toast.dart';
import '../../../blocs/profile_update_bloc.dart';
import '../../../model/country_list.dart';
import '../../../model/gender_list.dart';
import '../../../model/visa_type_list.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../widgets/buttons/login_button.dart';
import '../../widgets/input_text.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  _CreateShiftState createState() => _CreateShiftState();
}

List<GenderList> genderList = [];

class _CreateShiftState extends State<ProfileEditScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var genderId ;
  var nationalityId ;
  var visatypeId ;

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

  final items = ["job visa", "visiting visa"];

  // LoginBloc _loginBloc = LoginBloc();
  // ToastMsg toastMsg = ToastMsg();
  bool visible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileBloc.getUserInfo();
    profileBloc.getDropDownValues();
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
                                                                left: 18,
                                                                right: 18),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.5,
                                                          child: StreamBuilder(
                                                            stream: profileBloc
                                                                .genderStream,
                                                            builder: (context,
                                                                AsyncSnapshot<
                                                                        List<
                                                                            GenderList>>
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
                                                                              5.0)),
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
                                                                      "Gender",
                                                                ),
                                                                items: snapshot
                                                                    .data
                                                                    ?.map(
                                                                        (item) {
                                                                  return DropdownMenuItem(
                                                                    child:
                                                                        new Text(
                                                                      item.gender!,
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
                                                                      is GenderList) {
                                                                    print(
                                                                        "value");
                                                                    print(value
                                                                        ?.rowId);
                                                                    print(value
                                                                        ?.gender);

                                                                    genderId = value
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


                                                      child: Container(
                                                        //  width: MediaQuery.of(context).size.width * 0.5,
                                                        child: StreamBuilder(
                                                          stream: profileBloc
                                                              .countryStream,
                                                          builder: (context,
                                                              AsyncSnapshot<
                                                                      List<
                                                                          CountryList>>
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
                                                                            5.0)),
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
                                                                    "Nationality",
                                                              ),
                                                              items: snapshot
                                                                  .data
                                                                  ?.map(
                                                                      (item) {
                                                                return DropdownMenuItem(
                                                                  child:
                                                                      new Text(
                                                                    item.countryName!,
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
                                                                    is CountryList) {
                                                                  print(
                                                                      "value");
                                                                  print(value
                                                                      ?.rowId);
                                                                  print(value
                                                                      ?.countryName);

                                                                  nationalityId =
                                                                      value
                                                                          .rowId!;
                                                                }
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
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
                                                width: 400,
                                                child: StreamBuilder(
                                                  stream: profileBloc
                                                      .visatypeStream,
                                                  builder: (context,
                                                      AsyncSnapshot<
                                                              List<
                                                                  VisaTypeList>>
                                                          snapshot) {
                                                    print(
                                                        "snapshot.data?.length");
                                                    print(
                                                        snapshot.data?.length);
                                                    if (null == snapshot.data ||
                                                        snapshot.data?.length ==
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
                                                                  Radius
                                                                      .circular(
                                                                          5)),
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
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
                                                            EdgeInsets.all(3.0),
                                                        labelText: "Visa Type ",
                                                      ),
                                                      items: snapshot.data
                                                          ?.map((item) {
                                                        return DropdownMenuItem(
                                                          child: new Text(
                                                            item.type!,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 8.sp,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          value: item,
                                                        );
                                                      }).toList(),
                                                      onChanged:
                                                          (Object? value) {
                                                        if (value
                                                            is VisaTypeList) {
                                                          print("value");
                                                          print(value?.rowId);
                                                          print(value?.type);

                                                          visatypeId =
                                                              value.rowId!;
                                                        }
                                                      },
                                                    );
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
                      var auth_tokn =
                      prefs.getString(SharedPrefKey.AUTH_TOKEN);
                      print("for validation");
                      print(auth_tokn);


                      var validate = formKey.currentState?.validate();
                      if (null != validate) {
                        if (validate) {
                          if (null != auth_tokn) {
                            print("after validation");
                            profileBloc.ProfileUser(

                                auth_tokn,

                                first_name.text,
                                last_name.text,
                                date.text,
                                genderId.toString(),
                                nationalityId.toString(),
                                home_address.text,
                                permission_to_work_in_ireland.text,
                                visatypeId.toString(),
                                phonenumber.text,
                                email.text,
                                ppsnumber.text,
                                bank_iban.text,
                                bank_bic.text);
                          }
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
          date.text = item.dob!;
          email.text =item.email!;
          genderId = item.gender!;
          nationalityId =item.nationality!;
          permission_to_work_in_ireland.text = item.firstName!;
          visatypeId = item.visaType!;
          phonenumber.text = item.phoneNumber!;
          ppsnumber.text = item.ppsNumber!;
          bank_iban.text = item.bankIban!;
          bank_bic.text = item.bankBic!;



        }
      }
    });

    // profileBloc.gender.listen((event) {
    //   genderList = event;
    // });
  }

  void observerResponse() {
    profileBloc.profileStream.listen((event) {
      print("RESPONSE FROM UI");
      print(event.response?.status?.statusMessage.toString());
      print(event.response?.status?.statusCode);
      var message = event?.response?.status?.statusMessage.toString();
      if (event.response?.status?.statusCode == 200) {


        first_name.text = "";
        last_name.text = "";
        date.text = "";
        genderId = "";
        nationalityId = "";
        home_address.text = "";
        permission_to_work_in_ireland.text = "";
        visatypeId = "";
        phonenumber.text = "";
        email.text = "";
        ppsnumber.text = "";
        bank_iban.text = "";
        bank_bic.text = "";

        showAlertDialoge(context, title: "Success", message: message!);


      } else {
        showAlertDialoge(context,
            title: "Invalid", message: message!);
      }

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
