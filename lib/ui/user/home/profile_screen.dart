import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../Constants/app_defaults.dart';
import '../../../blocs/profile_update_bloc.dart';
import '../../../model/user_get_response.dart';
import '../../../utils/constants.dart';
import '../../widgets/buttons/drawable_button.dart';
import '../../widgets/profile_detail.dart';
import '../../widgets/profile_documents.dart';
import '../app_bar.dart';
import '../side_menu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _ProfileState extends State<ProfileScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didUpdateWidget(covariant ProfileScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    profileBloc.getUserInfo();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: SideMenu(),
      ),
      appBar: AppBarCommon(
        _scaffoldKey,
        scaffoldKey: _scaffoldKey,
      ),
      backgroundColor: Constants.colors[9],
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: StreamBuilder<UserGetResponse>(
                stream: profileBloc.getProfileStream,
                builder: (context, AsyncSnapshot<UserGetResponse> snapshot) {
                  var data = snapshot.data?.userResponse?.data;

                  String? firstName = data?.items?[0].firstName;
                  String? lastName = data?.items?[0].lastName;
                  String? employeeNo = data?.items?[0].employeeNo;
                  String? hourlyRate = data?.items?[0].hourlyRate;
                  String? gender = data?.items?[0].gender;
                  String? dob = data?.items?[0].dob;
                  String? homeAddress = data?.items?[0].homeAddress;
                  String? email = data?.items?[0].email;
                  String? phoneNumber = data?.items?[0].phoneNumber;
                  String? ppsNumber = data?.items?[0].ppsNumber;
                  String? bankIban = data?.items?[0].bankIban;

                  Items? item = data?.items?[0];
                  String fullName =
                      firstName.toString() + " " + lastName.toString();

                  return Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Constants.colors[4],
                                    Constants.colors[3],
                                  ]),
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.all(
                            AppDefaults.padding,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.12,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: AspectRatio(
                                        aspectRatio: 1 / 1,
                                        child: Image.network(
                                          'https://i.imgur.com/PJpPD6S.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: AppDefaults.margin),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if(fullName != null)
                                      Text(
                                        fullName,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.sp,
                                            fontFamily: "SFProMedium",
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(height: 5),

                                      Text(
                                        'Staff Nurses',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11.sp,
                                            fontFamily: "S",
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(height: 5),
                                      if(employeeNo != null)
                                      Text(
                                        employeeNo,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12.sp,
                                            fontFamily: "S",
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      if(hourlyRate!=null)
                                          Text(
                                            hourlyRate,
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: Constants.colors[8],
                                                fontWeight: FontWeight.w700),
                                          ),





                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      DrawableButton(
                                        onPressed: () {},
                                        label: "Edit",
                                        asset:
                                            "assets/images/icon/swipe-to-right.svg",
                                        backgroundColor: Constants.colors[4],
                                        textColors: Constants.colors[0],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppDefaults.margin),
                              // Actions
                            ],
                          ),
                        ),

                        if(null!=item)
                            ProfileDetailCard(items: item),

                        ProfileDocumentsCard()
                      ],
                    ),
                  );
                }),
          ),
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
