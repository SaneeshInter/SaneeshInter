import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/UI/user/detail/shift_rows.dart';

import '../../../../utils/constants.dart';
import '../../../Constants/sharedPrefKeys.dart';
import '../../../blocs/manager_view_detail.dart';
import '../../../model/manager_view_request.dart';
import '../../../utils/utils.dart';
import '../../user/detail/drawable_custom_row.dart';
import '../../widgets/request_user_list.dart';

class ShiftDetailManagerScreen extends StatefulWidget {
  const ShiftDetailManagerScreen({Key? key}) : super(key: key);

  @override
  _CreateShiftState createState() => _CreateShiftState();
}

class _CreateShiftState extends State<ShiftDetailManagerScreen> {
  String? token;
  String? shift_id = "1";
  String? job_request_row_id;

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
    managerviewrequestBloc.fetchManagerViewRequest(token!, shift_id!);
    acceptjobrequestBloc.fetchAcceptJobRequestResponse(
        token!, job_request_row_id!);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    getData();
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
                                              "At. " +
                                                  snapshot!
                                                      .data!
                                                      .response!
                                                      .data!
                                                      .hospitalDetails![0]
                                                      .hospitalName
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
                                                .address
                                                .toString(),
                                            asset:
                                                "assets/images/icon/location.svg",
                                            textColors: Colors.green,
                                            size: 9.sp,
                                          ),
                                          CustomRow(
                                            onPressed: () {},
                                            label: "From " +
                                                snapshot!.data!.response!.data!
                                                    .shiftDetails![0].timeFrom
                                                    .toString() +
                                                "AM To " +
                                                snapshot!.data!.response!.data!
                                                    .shiftDetails![0].timeFrom
                                                    .toString() +
                                                " PM",
                                            asset:
                                                "assets/images/icon/time.svg",
                                            textColors: Colors.black,
                                            size: 9.sp,
                                          ),
                                          CustomRow(
                                            onPressed: () {},
                                            label: snapshot!
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
                                            label: snapshot!.data!.response!
                                                .data!.hospitalDetails![0].email
                                                .toString(),
                                            asset:
                                                "assets/images/icon/email.svg",
                                            textColors: Colors.black,
                                            size: 9.sp,
                                          ),
                                          CustomRow(
                                            onPressed: () {},
                                            label: snapshot!.data!.response!
                                                .data!.hospitalDetails![0].phone
                                                .toString(),
                                            asset:
                                                "assets/images/icon/price-tag.svg",
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
                                            label: snapshot!
                                                .data!
                                                .response!
                                                .data!
                                                .shiftDetails![0]
                                                .jobDetails
                                                .toString(),
                                            asset:
                                                "assets/images/icon/check.svg",
                                            textColors: Colors.black,
                                          ),
                                          CustomRowz(
                                            onPressed: () {},
                                            label: snapshot!
                                                .data!
                                                .response!
                                                .data!
                                                .shiftDetails![0]
                                                .jobDetails
                                                .toString(),
                                            asset:
                                                "assets/images/icon/check.svg",
                                            textColors: Colors.black,
                                          ),
                                          CustomRowz(
                                            onPressed: () {},
                                            label: snapshot!
                                                .data!
                                                .response!
                                                .data!
                                                .shiftDetails![0]
                                                .jobDetails
                                                .toString(),
                                            asset:
                                                "assets/images/icon/check.svg",
                                            textColors: Colors.black,
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Container(
                                            child: Text(
                                              "Request Shift",
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                          Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            elevation: 0,
                                            color: Colors.greenAccent[100],
                                            child: SizedBox(
                                              height: 35.h,
                                              child: Padding(

                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: ListView.builder(

                                                  itemCount: snapshot
                                                      .data!
                                                      .response!
                                                      .data!
                                                      .jobRequestDetails!
                                                      .length,
                                                  shrinkWrap: true,
                                                  physics:
                                                      NeverScrollableScrollPhysics(),
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    var name =
                                                        "Approved time sheet";
                                                    var description =
                                                        "timesheets";
                                                    return Column(
                                                      children: [
                                                        RequestuserListWidget(
                                                          onTapView: () {},
                                                          onTapCall: () {},
                                                          onTapMap: () {},
                                                          onTapBooking:
                                                              (JobRequestDetails
                                                                  item) {
                                                            print("Tapped");
                                                            print(item.jobId);
                                                            print(
                                                                item.userName);
                                                            print(item.userId);

                                                            acceptjobrequestBloc
                                                                .fetchAcceptJobRequestResponse(
                                                                    token!,
                                                                    item.jobId
                                                                        .toString());
                                                            // showBookingAlert(context, date: "Show Timesheet");
                                                          },
                                                          item: snapshot
                                                                  .data!
                                                                  .response!
                                                                  .data!
                                                                  .jobRequestDetails![
                                                              index],
                                                        ),
                                                        SizedBox(
                                                            height:
                                                                screenHeight(
                                                                    context,
                                                                    dividedBy:
                                                                        100)),
                                                      ],
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
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
