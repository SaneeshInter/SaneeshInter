import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Constants/app_defaults.dart';
import '../../utils/constants.dart';
import 'buttons/drawable_button.dart';

class ProfileDocumentsCard extends StatelessWidget {
  const ProfileDocumentsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
color: Colors.transparent,
      child: Container(
        child: Column(
          children: [
            /// TOP PART APPOINTMENT
            Column(
              children: [
                const SizedBox(height : 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'QQQ1Level 5 Certification',
                          style:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Container(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                                'assets/images/icon/check.svg')),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height : 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'Infection Prevention ',
                          style:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Container(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                                'assets/images/icon/check.svg')),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height : 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'Employement Contract Signed',
                          style:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Container(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                                'assets/images/icon/check.svg')),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height : 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'Passport or ID card',
                          style:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Container(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                                'assets/images/icon/check.svg')),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height : 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'Any other training or documentation',
                          style:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Container(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                                'assets/images/icon/check.svg')),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height : 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'Best locations you can work in ? Dubline 15 Finglas',
                          style:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Container(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                                'assets/images/icon/check.svg')),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height : 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'Do you drive ?. Yes',
                          style:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Container(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                                'assets/images/icon/check.svg')),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height : 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'Have you got the Covid- 19 vaccination?. Medium',
                          style:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Container(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                                'assets/images/icon/check.svg')),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height : 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'Do youy consent a grada vetting to be Yes ? Completed ',
                          style:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Spacer(),
                        Container(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                                'assets/images/icon/check.svg')),
                      ],
                    ),
                  ),
                ),

              ],
            ),

            /// Bottom Section
          ],
        ),
      ),
    );
  }
}
