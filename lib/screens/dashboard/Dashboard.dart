import 'package:fe_football_admin/main.dart';
import 'package:fe_football_admin/widget/dashboard_widget/manager_centerNav.dart';
import 'package:fe_football_admin/widget/dashboard_widget/top_team/top_team_order_list.dart';
import 'package:fe_football_admin/widget/dashboard_widget/total_value.dart';
import 'package:fe_football_admin/widget/navigation/nav_leftBar.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blueGrey,
                Color.fromARGB(255, 6, 22, 29),
              ]),
        ),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LeftNavbar(),
              Container(
                  width: MediaQuery.of(context).size.width * 8.8 / 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [TotalValueTopNav()],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [TopteamItem()],
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
