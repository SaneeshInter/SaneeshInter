import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constants/app_defaults.dart';
import '../../utils/constants.dart';
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
                            onPressed: () {},
                            label: "Edit",
                            asset: "assets/images/icon/swipe-to-right.svg",
                            backgroundColor: Constants.colors[2],
                            textColors: Constants.colors[4],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                child: SvgPicture.asset(
                                    'assets/images/icon/sex.svg')),
                            SizedBox(width: 15.0),
                            Text(
                              'Gender:Male',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                child: SvgPicture.asset(
                                    'assets/images/icon/confetti.svg')),
                            SizedBox(width: 15.0),
                            Text(
                              'Date Of Birth:00/00/00',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                child: SvgPicture.asset(
                                    'assets/images/icon/flag.svg')),
                            SizedBox(width: 15.0),
                            Text(
                              'Nationality',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                child: SvgPicture.asset(
                                    'assets/images/icon/Pin.svg')),
                            SizedBox(width: 15.0),
                            Text(
                              'Address',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                child: SvgPicture.asset(
                                    'assets/images/icon/email.svg')),
                            SizedBox(width: 15.0),
                            Text(
                              'Email',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                child: SvgPicture.asset(
                                    'assets/images/icon/phone.svg',color: Colors.grey,)),
                            SizedBox(width: 15.0),
                            Text(
                              'Phone Number',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                child: SvgPicture.asset(
                                    'assets/images/icon/passport.svg')),
                            SizedBox(width: 15.0),
                            Text(
                              'PPS Number',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Container(
                                height: 20,
                                width: 20,
                                child: SvgPicture.asset(
                                    'assets/images/icon/bank.svg')),
                            SizedBox(width: 15.0),
                            Text(
                              'Bank Details',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                  ),
                            ),
                          ],
                        ),
                      ),
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
