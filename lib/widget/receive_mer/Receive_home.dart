import 'package:fe_football_admin/main.dart';
import 'package:fe_football_admin/screens/news/News_Accept.dart';
import 'package:fe_football_admin/widget/customer/item_list_customer.dart';
import 'package:fe_football_admin/widget/customer/nav_customer/nav_top_list_customer.dart';
import 'package:fe_football_admin/widget/dashboard_widget/manager_centerNav.dart';
import 'package:fe_football_admin/widget/dashboard_widget/total_value.dart';
import 'package:fe_football_admin/widget/input_widget/input_field.dart';
import 'package:fe_football_admin/widget/input_widget/input_field1.dart';
import 'package:fe_football_admin/widget/navigation/nav_leftBar.dart';
import 'package:fe_football_admin/widget/news/item_list_news.dart';
import 'package:fe_football_admin/widget/news/nav_news/nav_top_list_news.dart';
import 'package:fe_football_admin/widget/team/item_list_team.dart';
import 'package:fe_football_admin/widget/team/nav_customer/nav_top_list_team.dart';
import 'package:flutter/material.dart';

import 'item_mer.dart';

class ReceiveMerchandiseView extends StatelessWidget {
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
                        Text(
                          "Quản lí hàng hóa",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InputField1(label: "Têm sản phẩm:", content: ""),
                            SizedBox(
                              width: 70,
                            ),
                            Text(
                              "",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            InputField1(label: "Số lượng:", content: ""),
                            SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InputField1(label: "Giá nhập vào:", content: ""),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "VNĐ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            InputField1(label: "Giá bán ra:", content: ""),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MaterialButton(
                          color: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return new ReceiveMerchandiseView();
                            }));
                          },
                          child: Text(
                            "Nhập hàng +",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          color: Colors.white,
                          height: 1,
                          width: 1250,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 1.5,
                          child: SingleChildScrollView(
                            //You can also change the scroll direction
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0; i < 150; i++)
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 30,
                                              child: Text(
                                                ((i + 1).toString() + "- "),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                            ),
                                            ItemMerchandise(),
                                          ])
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
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
