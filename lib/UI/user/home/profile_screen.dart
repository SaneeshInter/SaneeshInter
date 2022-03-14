import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Constants/app_defaults.dart';
import '../../../utils/constants.dart';
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: SideMenu(),
      ),
      appBar: AppBarCommon(_scaffoldKey, scaffoldKey: _scaffoldKey,),
      backgroundColor: Constants.colors[9],
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
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
                              width: MediaQuery.of(context).size.width * 0.12,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Sanjay Abraham',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "SFProMedium",
                                      fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height : 5),
                                Text(
                                  'Staff Nurses',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: "S",
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(height : 5),
                                Text(
                                  'Emp No:6950',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: "S",
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                    'assets/images/icon/righarrow.svg'))
                          ],
                        ),
                        const SizedBox(height: AppDefaults.margin),
                        // Actions
                      ],
                    ),
                  ),
                  ProfileDetailCard(),
                  ProfileDocumentsCard()
                ],
              ),
            ),
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
