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
import '../../widgets/loading_widget.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  _HomeScreentate createState() => _HomeScreentate();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
var token;

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

  @override
  void didUpdateWidget(covariant MyBookingScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    confirmBloc.dispose();
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
          backgroundColor: Constants.colors[9],
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
          body: RefreshIndicator(

            onRefresh: () async {


            },
              color: Colors.white,
              backgroundColor: Colors.purple,
              strokeWidth: 5,
            child: Container(
                child: StreamBuilder(
                    stream: confirmBloc.viewrequest,
                    builder: (BuildContext context,
                        AsyncSnapshot<UserViewRequestResponse> snapshot) {
                      if (snapshot.hasData) {
                        return TabBarView(children: [
                          bookingList(0, snapshot),
                          bookingList(1, snapshot),
                          bookingList(2, snapshot)
                        ]);
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return Center(
                        child: Visibility(
                          child: Container(
                            width: 100.w,
                            height: 80.h,
                            child: const Center(
                              child: LoadingWidget(),
                            ),
                          ),
                        ),
                      );
                    })),
          )),
    );
  }
}

Widget bookingList(
    int position, AsyncSnapshot<UserViewRequestResponse> snapshot) {
  return SingleChildScrollView(
    child: Column(children: [buildList(snapshot, position)]),
  );
}

Widget buildList(
    AsyncSnapshot<UserViewRequestResponse> snapshot, int position) {
  var allList = getFilterList(snapshot, position);
  var list = [];
  if (position == 0) {
    list = allList.requested;
  }

  if (position == 1) {
    list = allList.confirmed;
  }

  if (position == 2) {
    list = allList.reject;
  }

  return ListView.builder(
    itemCount: list.length,
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemBuilder: (BuildContext context, int index) {
      var items = list[index];
      return Column(
        children: [
          MyBookingListWidget(
            items: items!,
            position: 12,
            onTapView: () {
              // showFeactureAlert(context, date: "");
            },
            onTapCancel: (item) {

              print("Tapped");
            },
            onTapCall: () {},
            onTapMap: () {
              // showFeactureAlert(context, date: "");
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

Future getDataitems() async {
  token = await TokenProvider().getToken();
  confirmBloc.fetchUserViewRequest(token);
}

FilterBookingList getFilterList(
    AsyncSnapshot<UserViewRequestResponse> snapshot, int position) {
  FilterBookingList list = FilterBookingList();
  List<Items>? allList = snapshot.data?.response?.data?.items;

  for (var item in allList!) {
    print("item.status");
    print(item.status);

    if (item.status == "Accepted") {
      list.confirmed.add(item);
    }
    if (item.status == "Pending") {
      list.requested.add(item);
    }
    if (item.status == "Rejected") {
      list.reject.add(item);
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
