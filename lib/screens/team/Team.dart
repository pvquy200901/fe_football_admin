import 'package:fe_football_admin/main.dart';
import 'package:fe_football_admin/widget/customer/item_list_customer.dart';
import 'package:fe_football_admin/widget/customer/nav_customer/nav_top_list_customer.dart';
import 'package:fe_football_admin/widget/dashboard_widget/manager_centerNav.dart';
import 'package:fe_football_admin/widget/dashboard_widget/total_value.dart';
import 'package:fe_football_admin/widget/navigation/nav_leftBar.dart';
import 'package:fe_football_admin/widget/team/item_list_team.dart';
import 'package:fe_football_admin/widget/team/nav_customer/nav_top_list_team.dart';
import 'package:flutter/material.dart';

class TeamView extends StatelessWidget {
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
                Colors.blueGrey,
              ]),
        ),
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              LeftNavbar(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 15,
                  ),
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
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      // Color.fromARGB(255, 60, 134, 245),
                                      Colors.grey,
                                      Colors.pink,
                                      Colors.grey,
                                    ]),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "Số đội hiện tại",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontFamily: 'Merriweather'),
                                  ),
                                  Text(
                                    "15",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Merriweather'),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 450),
                            Text(
                              "Danh sách đội",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Merriweather'),
                            ),
                            Container(width: 550),
                          ],
                        ),
                        NavTopListTeam(),
                        Container(
                          color: Colors.white,
                          height: 1,
                          width: 1250,
                        ),
                        for (int i = 0; i < 15; i++) ItemListTeam(),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
