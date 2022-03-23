import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpresshealthdev/UI/user/detail/profile_details_row.dart';

import '../../Constants/app_defaults.dart';
import '../../utils/constants.dart';
import '../user/home/profile_edit.dart';
import 'buttons/drawable_button.dart';

class ProfileDetailCard extends StatelessWidget {
  const ProfileDetailCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: AppDefaults.borderRadius,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ProfileDetailCard()));
        },
        borderRadius: AppDefaults.borderRadius,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: AppDefaults.borderRadius,
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(2, 0),
                  spreadRadius: 1,
                )
              ],
            ),
            child: Column(
              children: [
                /// TOP PART APPOINTMENT
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDefaults.padding,
                    vertical: AppDefaults.padding,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Personal Details',
                            style: TextStyle(
                                color: Constants.colors[3],
                                fontSize: 18,
                                fontFamily: "SFProMedium",
                                fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                          DrawableButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ProfileEditScreen()),
                              );
                            },
                            label: "Edit",
                            asset: "assets/images/icon/swipe-to-right.svg",
                            backgroundColor: Constants.colors[2],
                            textColors: Constants.colors[4],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      ProfileDetailsRow(
                          label: "Gender:Male",
                          asset: "assets/images/icon/sex.svg"),
                      SizedBox(width: 15.0),
                      ProfileDetailsRow(
                          label: "Date Of Birth:00/00/00",
                          asset: "assets/images/icon/confetti.svg"),
                      SizedBox(width: 15.0),
                      ProfileDetailsRow(
                          label: "Address",
                          asset: "assets/images/icon/Pin.svg"),
                      SizedBox(width: 15.0),
                      ProfileDetailsRow(
                          label: "Email",
                          asset: "assets/images/icon/email.svg"),
                      SizedBox(width: 15.0),
                      ProfileDetailsRow(
                          label: "Phone Number",
                          asset: "assets/images/icon/phone.svg"),
                      SizedBox(width: 15.0),
                      ProfileDetailsRow(
                          label: "PPS Number",
                          asset: "assets/images/icon/passport.svg"),
                      SizedBox(width: 15.0),
                      ProfileDetailsRow(
                          label: "Bank Details",
                          asset: "assets/images/icon/bank.svg"),
                      SizedBox(width: 15.0),
                    ],
                  ),
                ),

                /// Bottom Section
              ],
            ),
          ),
        ),
      ),
    );
  }
}
