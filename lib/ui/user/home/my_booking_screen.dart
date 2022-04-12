import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import 'package:xpresshealthdev/UI/user/home/filter_booking_list.dart';
import 'package:xpresshealthdev/blocs/shift_confirmed_bloc.dart';
import 'package:xpresshealthdev/model/user_view_request_response.dart';

import '../../../resources/token_provider.dart';
import '../../../utils/colors_util.dart';
import '../../../utils/constants.dart';
import '../../../utils/utils.dart';
import '../../Widgets/my_booking_list_widget.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  _HomeScreentate createState() => _HomeScreentate();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreentate extends State<MyBookingScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int devicePixelRatio = 3;
  int perPageItem = 3;
  int pageCount = 0;
  int selectedIndex = 0;
  int lastPageItemLength = 0;
  var selected = 0;
  var itemSelected = 0;
  late PageController pageController;
  final ScrollController _controller = ScrollController();
  var token;

  @override
  void didUpdateWidget(covariant MyBookingScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  Future getDataitems() async {
    token = await TokenProvider().getToken();
    confirmBloc.fetchUserViewRequest(token);
  }

  @override
  void initState() {
    getDataitems();

    pageController = PageController(initialPage: 0);
    pageCount = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: HexColor("#ffffff"),
        appBar: AppBar(
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/images/icon/menu.svg',
              width: 5.w,
              height: 4.2.w,
            ),
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
          ),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
            //change your color here
          ),
          backgroundColor: HexColor("#ffffff"),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    'assets/images/icon/logo.svg',
                    fit: BoxFit.contain,
                    height: 8.w,
                  )),
            ],
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/icon/searchicon.svg',
                width: 5.w,
                height: 5.w,
              ), //Image.asset('assets/images/icon/searchicon.svg',width: 20,height: 20,fit: BoxFit.contain,),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(65),
            child: Container(
              color: Constants.colors[9],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.black,
                    tabs: [
                      Tab(
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Requested"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Confirmed"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Rejected"),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
        body: TabBarView(
            children: [bookingList(0), bookingList(1), bookingList(2)]),
      ),
    );
  }
}

Widget bookingList(int position) {
  return SingleChildScrollView(
    child: Container(
        child: Column(children: [
      StreamBuilder(
          stream: confirmBloc.viewrequest,
          builder: (BuildContext context,
              AsyncSnapshot<UserViewRequestResponse> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot, position);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          })
    ])),
  );
}

Widget buildList(
    AsyncSnapshot<UserViewRequestResponse> snapshot, int position) {
  List<Items>? requested;
  List<Items>? confirmed;
  List<Items>? accepted;

  if (position == 0) {
    requested = getFilterList(snapshot, position);
  }

  if (position == 1) {}

  if (position == 2) {}

  return ListView.builder(
    itemCount: snapshot.data?.response?.data?.items?.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      var name = "Shift Confirmed";
      var description = " Confirmed";

      var items = snapshot.data?.response?.data?.items![index];
      if (items != null) {
        name = items.jobDetails!;
        name = items.category!;
      }

      return Column(
        children: [
          MyBookingListWidget(
            items: items!,
            position: 12,
            onTapView: () {
              showFeactureAlert(context, date: "");
            },
            onTapCall: () {},
            onTapMap: () {
              showFeactureAlert(context, date: "");
            },
            onTapBooking: () {
              print("Tapped");
              showAddTimeSheet(context, date: "");
            },
            key: null,
          ),
        ],
      );
    },
  );
}

List<Items>? getFilterList(
    AsyncSnapshot<UserViewRequestResponse> snapshot, int position) {

  FilterBookingList getFilterList= FilterBookingList();

 // getFilterList.requested="";


  List<Items> list = [];
  List<Items> requested = [];
  List<Items> confirmed = [];
  List<Items> accepted = [];
  List<Items>? allList = snapshot.data?.response?.data?.items;




  for (var item in allList!) {
    if (position == 0) {
      if (item.status == "requested") {
        requested.add(item);
      }
    }
  }
  for (var item in allList!) {
    if (position == 1) {
      if (item.status == "confirmed") {
        confirmed.add(item);
      }
    }
  }
  for (var item in allList!) {
    if (position == 2) {
      if (item.status == "accepted") {
        accepted.add(item);
      }
    }


  }



  return list;
}


class BodyWidget extends StatelessWidget {
  final Color color;

  BodyWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: color,
      alignment: Alignment.center,
    );
  }
}
