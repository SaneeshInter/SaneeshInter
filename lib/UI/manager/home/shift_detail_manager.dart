import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/UI/user/detail/shift_rows.dart';

import '../../../../utils/constants.dart';
import '../../../Constants/sharedPrefKeys.dart';
import '../../../blocs/manager_view_detail.dart';
import '../../../model/manager_view_request.dart';
import '../../Widgets/buttons/call_button.dart';
import '../../Widgets/buttons/submit_button.dart';
import '../../user/detail/drawable_custom_row.dart';

class ShiftDetailManagerScreen extends StatefulWidget {
  const ShiftDetailManagerScreen({Key? key}) : super(key: key);

  @override
  _CreateShiftState createState() => _CreateShiftState();
}

class _CreateShiftState extends State<ShiftDetailManagerScreen> {
  String? token;
  String? shift_id = "1";

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  Future getData() async {
    SharedPreferences shdPre = await SharedPreferences.getInstance();
    token = shdPre.getString(SharedPrefKey.AUTH_TOKEN);
    print("token inn deta");
    print(token);
    print(shift_id);
    managerviewrequestBloc.fetchManagerViewBooking(token!, shift_id!);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.colors[9],
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: managerviewrequestBloc.managerviewrequest,
            builder:
                (context, AsyncSnapshot<ManagerViewRequestResponse> snapshot) {
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 30.h,
                              child: SizedBox.fromSize(
                                  size: Size.fromRadius(10), // Image radius
                                  child: Image.asset(
                                    "assets/images/icon/dubai.jpg",
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 14, top: 10),
                                            child: Text(
                                              snapshot!
                                                  .data!
                                                  .response!
                                                  .data!
                                                  .hospitalDetails![0]
                                                  .hospitalRowId
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontFamily: "SFProMedium",
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          CustomRow(
                                            onPressed: () {},
                                            label: snapshot!
                                                .data!
                                                .response!
                                                .data!
                                                .hospitalDetails![0]
                                                .province
                                                .toString(),
                                            asset:
                                                "assets/images/icon/location.svg",
                                            textColors: Colors.green,
                                            size: 9.sp,
                                          ),
                                          CustomRow(
                                            onPressed: () {},
                                            label: snapshot!
                                                .data!
                                                .response!
                                                .data!
                                                .hospitalDetails![0]
                                                .longitude
                                                .toString(),
                                            asset:
                                                "assets/images/icon/time.svg",
                                            textColors: Colors.black,
                                            size: 9.sp,
                                          ),
                                          CustomRow(
                                            onPressed: () {},
                                            label:snapshot!
                                                .data!
                                                .response!
                                                .data!
                                                .hospitalDetails![0]
                                                .hospitalName
                                                .toString(),
                                            asset:
                                                "assets/images/icon/ward.svg",
                                            textColors: Colors.black,
                                            size: 9.sp,
                                          ),
                                          CustomRow(
                                            onPressed: () {},
                                            label:
                                            snapshot!
                                                .data!
                                                .response!
                                                .data!
                                                .hospitalDetails![0]
                                                .email
                                                .toString(),
                                            asset:
                                                "assets/images/icon/email.svg",
                                            textColors: Colors.black,
                                            size: 9.sp,
                                          ),
                                          CustomRow(
                                            onPressed: () {},
                                            label:  snapshot!
                                                .data!
                                                .response!
                                                .data!
                                                .hospitalDetails![0]
                                                .phone
                                                .toString(),
                                      asset: "assets/images/icon/price-tag.svg",
                                      textColors: Colors.black,
                                      size: 9.sp,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Divider(
                                        thickness: 1,
                                        indent: 12,
                                        endIndent: 12,
                                      ),
                                    ),
                                    CustomRowz(
                                      onPressed: () {},
                                      label:
                                          "There are many variations of passages of Lorem\n"
                                          " Ipsum available, but the majority have suffered \n"
                                          "alteration in some form, by injected humour,",
                                      asset: "assets/images/icon/check.svg",
                                      textColors: Colors.black,
                                    ),
                                    CustomRowz(
                                      onPressed: () {},
                                      label:
                                          "There are many variations of passages of Lorem\n"
                                          " Ipsum available, but the majority have suffered \n"
                                          "alteration in some form, by injected humour,",
                                      asset: "assets/images/icon/check.svg",
                                      textColors: Colors.black,
                                    ),
                                    CustomRowz(
                                      onPressed: () {},
                                      label:
                                          "There are many variations of passages of Lorem\n"
                                          " Ipsum available, but the majority have suffered \n"
                                          "alteration in some form, by injected humour,",
                                      asset: "assets/images/icon/check.svg",
                                      textColors: Colors.black,
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

                  SizedBox(
                    height: 2.h,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
