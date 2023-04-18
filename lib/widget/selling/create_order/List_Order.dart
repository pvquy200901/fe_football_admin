import 'package:fe_football_admin/main.dart';
import 'package:fe_football_admin/screens/stadium/Stadium_Create.dart';
import 'package:fe_football_admin/widget/customer/item_list_customer.dart';
import 'package:fe_football_admin/widget/customer/nav_customer/nav_top_list_customer.dart';
import 'package:fe_football_admin/widget/dashboard_widget/manager_centerNav.dart';
import 'package:fe_football_admin/widget/dashboard_widget/total_value.dart';
import 'package:fe_football_admin/widget/navigation/nav_leftBar.dart';
import 'package:fe_football_admin/widget/selling/create_order/OrderItemList.dart';
import 'package:fe_football_admin/widget/selling/create_order/order_create.dart';
import 'package:fe_football_admin/widget/stadium/item_list_stadium.dart';
import 'package:flutter/material.dart';

import '../../../api/api.dart';
import 'item_stadium.dart';
import 'listWaitConfirm.dart';

class OrderListView extends StatelessWidget {
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
                            Text(
                              "Danh sách sân",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Merriweather'),
                            ),
                          ],
                        ),
                         MaterialButton(
                              color: Colors.orangeAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(26.0))),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return new ListWaitConfirm();
                                }));
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 2.0),
                                child: Text(
                                  "Đơn đợi xác nhận",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                            ),
                        FutureBuilder(
        future: api.getListStadium(),
        builder: (context, snapshot) {
        if(snapshot.hasData){
          return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              spacing: 8.0, // gap between adjacent chips
              runSpacing: 4.0, // gap between lines
              children: <Widget>[
                for (int i = 0; i < snapshot.data!.length; i++)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ItemStadium(model: snapshot.data![i]),
                    ],
                  ),
              ]),
        ],
      );
        }
        else{return CircularProgressIndicator();}
      },),
                        SizedBox(
                          height: 15,
                        ),
                        // MaterialButton(
                        //   color: Colors.greenAccent,
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(26.0))),
                        //   onPressed: () {
                        //     Navigator.push(context,
                        //         MaterialPageRoute(builder: (context) {
                        //       return new OrderCreateView();
                        //     }));
                        //   },
                        //   child: Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         vertical: 2.0, horizontal: 2.0),
                        //     child: Text(
                        //       "Đặt sân +",
                        //       style: TextStyle(
                        //           color: Colors.black,
                        //           fontSize: 16,
                        //           fontStyle: FontStyle.normal),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 5,
                        ),
                        // Container(
                        //   color: Colors.white,
                        //   height: 1,
                        //   width: 1250,
                        // ),
                        // for (int i = 0; i < 5; i++) Order_ItemList(),
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
