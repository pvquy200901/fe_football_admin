import 'package:fe_football_admin/main.dart';
import 'package:fe_football_admin/screens/dashboard/sidebar.dart';
import 'package:fe_football_admin/widget/dashboard_widget/ban/violator_list.dart';
import 'package:fe_football_admin/widget/dashboard_widget/manager_centerNav.dart';
import 'package:fe_football_admin/widget/dashboard_widget/report/list_report.dart';
import 'package:fe_football_admin/widget/dashboard_widget/top_team/top_team_order_list.dart';
import 'package:fe_football_admin/widget/dashboard_widget/total_value.dart';
import 'package:fe_football_admin/widget/navigation/nav_leftBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

import '../../config/style.dart';
import '../../config/text.dart';
import 'overView.dart';


class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}
class _DashboardViewState extends State<DashboardView> {

  SideBarWidget _sideBarWidget = SideBarWidget();
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
      title: Row(
        children: [
          Visibility(
              child: CustomText(
                text: 'Quản lý hệ thống',
                color: lightgrey,
                size: 20,
                fontWeight: FontWeight.bold,
              )),
          Expanded(
            child: Container(),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            color: dark.withOpacity(.7),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: dark.withOpacity(.7),
                ),
              ),
              Positioned(
                  top: 7,
                  right: 7,
                  child: Container(
                      width: 12,
                      height: 12,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: blue,
                          shape: BoxShape.circle,
                          border: Border.all(color: light, width: 2))))
            ],
          ),
          Container(
            width: 1,
            height: 22,
            color: lightgrey,
          ),
          const SizedBox(
            height: 24,
          ),
          const SizedBox(
            width: 16,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: light,
                child: Icon(
                  Icons.person_outline,
                  color: dark,
                ),
              ),
            ),
          )
        ],
      ),
      iconTheme: IconThemeData(
        color: dark,
      ),
      backgroundColor: light,
      // iconTheme: IconThemeData(
      //   color: Colors.white,
      // ),
      // title: Text(
      //   'Gobike dashboard'.toUpperCase(),
      //   style: TextStyle(
      //     color: Colors.white,
      //     fontWeight: FontWeight.w900,
      //     fontSize: 19,
      //   ),
      // ),
      ),

        backgroundColor: light,
        sideBar: _sideBarWidget.SideBarMenus(context, '/dashboardView'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Visibility(
                  //   visible:_firebaseServices!.bursary.where("email",isEqualTo: user!.email).where("stackholder", isEqualTo: 'super-admin').snapshots()!=null,
                    child: OverviewCards()),
              ],
            ),
          ),
        )
      // body: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //         begin: Alignment.centerLeft,
      //         end: Alignment.bottomRight,
      //         colors: [
      //           Colors.blueGrey,
      //           Color.fromARGB(255, 6, 22, 29),
      //         ]),
      //   ),
      //   child: SingleChildScrollView(
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: <Widget>[
      //         LeftNavbar(),
      //         Container(
      //             width: MediaQuery.of(context).size.width * 8.8 / 10,
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 SizedBox(
      //                   height: 15,
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [TotalValueTopNav()],
      //                 ),
      //                 SizedBox(
      //                   height: 15,
      //                 ),
      //                 Container(
      //                   height: 2,
      //                   width: 1200,
      //                   color: Colors.white,
      //                 ),
      //                 SizedBox(
      //                   height: 15,
      //                 ),
      //                 Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.center,
      //                       children: [
      //                         SizedBox(
      //                           width: 50,
      //                         ),
      //                         Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [
      //                             Text(
      //                               "Danh sách vi phạm tiêu chuẩn",
      //                               style: TextStyle(
      //                                   color: Colors.white,
      //                                   fontSize: 22.0,
      //                                   fontWeight: FontWeight.bold,
      //                                   fontFamily: 'Merriweather'),
      //                             ),
      //                             Container(
      //                               height: 1,
      //                               width: 250,
      //                               color: Colors.white,
      //                             ),
      //                             SizedBox(
      //                               height: 15,
      //                             ),
      //                             Container(
      //                               height: MediaQuery.of(context).size.height -
      //                                   190,
      //                               child: SingleChildScrollView(
      //                                 //You can also change the scroll direction
      //                                 child: Column(
      //                                   mainAxisAlignment:
      //                                       MainAxisAlignment.center,
      //                                   crossAxisAlignment:
      //                                       CrossAxisAlignment.start,
      //                                   children: [ViolatorsList()],
      //                                 ),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       ],
      //                     ),
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.end,
      //                       children: [
      //                         Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           children: [TopteamItem()],
      //                         ),
      //                       ],
      //                     ),
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       children: [
      //                         Column(
      //                           mainAxisAlignment: MainAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               "Phản hồi",
      //                               style: TextStyle(
      //                                   color: Colors.white,
      //                                   fontSize: 22.0,
      //                                   fontWeight: FontWeight.bold,
      //                                   fontFamily: 'Merriweather'),
      //                             ),
      //                             Container(
      //                               height: 1,
      //                               width: 50,
      //                               color: Colors.white,
      //                             ),
      //                             SizedBox(
      //                               height: 15,
      //                             ),
      //                             Container(
      //                               height: MediaQuery.of(context).size.height -
      //                                   190,
      //                               child: SingleChildScrollView(
      //                                 //You can also change the scroll direction
      //                                 child: Column(
      //                                   mainAxisAlignment:
      //                                       MainAxisAlignment.start,
      //                                   crossAxisAlignment:
      //                                       CrossAxisAlignment.start,
      //                                   children: [ListReport()],
      //                                 ),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                         SizedBox(
      //                           width: 50,
      //                         ),
      //                       ],
      //                     ),
      //                   ],
      //                 ),
      //               ],
      //             )),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

