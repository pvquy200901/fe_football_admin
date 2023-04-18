import 'package:fe_football_admin/widget/dialog/dialog_confirm_order.dart';
import 'package:fe_football_admin/widget/navigation/nav_leftBar.dart';
import 'package:fe_football_admin/widget/selling/create_order/chose_date_menu.dart';
import 'package:fe_football_admin/widget/selling/create_order/chose_time_menu.dart';
import 'package:fe_football_admin/widget/selling/create_order/landing_stadium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:intl/intl.dart';

import '../../../api/api.dart';
import '../../../config/style.dart';
import '../../../config/text.dart';
import '../../../screens/dashboard/sidebar.dart';
import 'item_stadium.dart';

class OrderCreateView extends StatefulWidget {
 String name;
  String address;
  int price;
  OrderCreateView(
      {super.key,
      required this.name,
      required this.address,
      required this.price});
  @override
  _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderCreateView> {
  SideBarWidget _sideBarWidget = SideBarWidget();
    String name = "";
    String address = "";
    int price = 0;
    String day = DateTime.now().day.toString();
    String mon = DateTime.now().month.toString().padLeft(2, '0');
    String dateOrder = "";
    String startOrder = "";
    String endOrder = "";
    int lastday =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day;

    bool click = true;
    bool click1 = true;
    bool click2 = true;
    bool click3 = true;
    bool click4 = true;
    bool click5 = true;
    bool click6 = true;
    bool click_ = true;
    bool click_1 = true;
    bool click_2 = true;
    bool click_3 = true;
    bool click_4 = true;
    bool click_5 = true;
    bool click_6 = true;
    bool click_7 = true;
    bool click_8 = true;
    bool click_9 = true;
    bool click_10 = true;

    bool checkedDate = false;
    bool checkedTime = false;
    bool checked = false;

    bool show = true;


      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = widget.name;
    address = widget.address;
    price = widget.price;
  }


  @override
  Widget build(BuildContext context) {
  
    return AdminScaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Visibility(
                child: CustomText(
                  text: 'Đặt sân',
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
        sideBar: _sideBarWidget.SideBarMenus(context, '/order'),
        body:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
        child:  Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height*1.1,
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Đặt sân",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),

                        //===============================
                        FutureBuilder(
                          future: api.getInfoStadium(widget.name),
                          builder: (context, snapshot) {
                            if(snapshot.hasData){
                              return   Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Color.fromARGB(255, 33, 12, 48),
                                          Colors.white12,
                                        ]),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(15.0),
                                        bottomRight: Radius.circular(15.0),
                                        topLeft: Radius.circular(15.0),
                                        bottomLeft: Radius.circular(15.0)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          SizedBox(
                                            height: 10,
                                          ),
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15.0),
                                              topLeft: Radius.circular(15.0),
                                              bottomLeft: Radius.circular(15.0),
                                              bottomRight: Radius.circular(15),
                                            ),
                                            child: SizedBox.fromSize(
                                              size: Size.fromRadius(90), // Image radius
                                              child: Image.network(
                                                  'http://localhost:50000/api/File/image/${snapshot.data!.images![0]}',
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "7:00 - 22:30",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w100,
                                                      fontSize: 16.0,
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  snapshot.data!.name!,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w100,
                                                      fontSize: 26.0,
                                                      color: Colors.white),
                                                ),
                                                Container(
                                                  width: 250,
                                                  child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      children: <Widget>[
                                                        Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.center,
                                                            children: <Widget>[
                                                              Text(
                                                                snapshot.data!.address!,
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                    FontWeight.normal,
                                                                    fontSize: 14.0,
                                                                    overflow:
                                                                    TextOverflow.clip,
                                                                    color: Colors.black),
                                                              ),
                                                            ]),
                                                      ]),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );

                            }
                            else{
                              return CircularProgressIndicator();
                            }
                          },),


                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 25),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Visibility(
                                  visible: true,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: (click == true)
                                              ? Color.fromARGB(255, 112, 145, 201)
                                              : Color.fromARGB(255, 255, 22, 22),
                                          side: BorderSide(
                                              width: 1, color: Colors.black),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10))),
                                      onPressed: () {
                                        if ((int.parse(day) ) <= lastday&&
                                            ((int.parse(day) )) >= 10)
                                          dateOrder = (DateTime.now().month.toString().padLeft(2, '0'))
                                               +
                                              "/" +
                                              (DateTime.now().day).toString() +
                                              "/" +
                                              (DateTime.now().year).toString();

                                        if ((int.parse(day) ) <= lastday&&
                                            ((int.parse(day) )) < 10)
                                          dateOrder = (DateTime.now().month.toString().padLeft(2, '0'))
                                              .toString() +
                                              "/0" +
                                              (DateTime.now().day ).toString() +
                                              "/" +
                                              (DateTime.now().year).toString();

                                        if ((int.parse(day) ) > lastday &&
                                            ((int.parse(day) ) - lastday) < 10)
                                          dateOrder =
                                              (int.parse(mon) + 1).toString() +
                                                  "/0" +
                                                  ((int.parse(day) ) - lastday)
                                                      .toString() +
                                                  "/" +
                                                  (DateTime.now().year).toString();
                                        print(dateOrder);
                                        if ((int.parse(day) ) > lastday &&
                                            ((int.parse(day) ) - lastday) >= 10)
                                          dateOrder =
                                              (int.parse(mon) + 1).toString() +
                                                  "/" +
                                                  ((int.parse(day) ) - lastday)
                                                      .toString() +
                                                  "/" +
                                                  (DateTime.now().year).toString();


                                        setState(() {
                                          click = !click;
                                          click1 = true;
                                          click2 = true;
                                          click3 = true;
                                          click4 = true;
                                          click5 = true;
                                          click6 = true;
                                          checkedDate = true;
                                        });
                                        print(checkedDate.toString() + "============" + dateOrder.toString());
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          if ((int.parse(day)) <= lastday)
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    mon + "\n",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    (int.parse(day)).toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ]),
                                          if ((int.parse(day)) > lastday)
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    (int.parse(mon) + 1)
                                                        .toString() +
                                                        "\n",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    day = (lastday).toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ]),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Visibility(
                                  visible: true,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: (click1 == true)
                                              ? Color.fromARGB(255, 112, 145, 201)
                                              : Color.fromARGB(255, 255, 22, 22),
                                          side: BorderSide(
                                              width: 1, color: Colors.black),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10))),
                                      onPressed: () {
                                        setState(() {
                                          click = true;
                                          click1 = !click1;
                                          click2 = true;
                                          click3 = true;
                                          click4 = true;
                                          click5 = true;
                                          click6 = true;
                                          checkedDate = true;
                                        });
                                        if ((int.parse(day) + 1) <= lastday&&
                                            ((int.parse(day) + 1)) > 10)
                                          dateOrder = (DateTime.now().month.toString().padLeft(2, '0'))
                                              .toString() +
                                              "/" +
                                              (DateTime.now().day + 1).toString() +
                                              "/" +
                                              (DateTime.now().year).toString();

                                        if ((int.parse(day) + 1) <= lastday&&
                                            ((int.parse(day) + 1)) < 10)
                                          dateOrder = (DateTime.now().month)
                                              .toString() +
                                              "/0" +
                                              (DateTime.now().day + 1).toString() +
                                              "/" +
                                              (DateTime.now().year).toString();

                                        if ((int.parse(day) + 1) > lastday &&
                                            ((int.parse(day) + 1) - lastday) < 10)
                                          dateOrder =
                                              (int.parse(mon) + 1).toString() +
                                                  "/0" +
                                                  ((int.parse(day) + 1) - lastday)
                                                      .toString() +
                                                  "/" +
                                                  (DateTime.now().year).toString();
                                        print(dateOrder);
                                        if ((int.parse(day) + 1) > lastday &&
                                            ((int.parse(day) + 1) - lastday) >= 10)
                                          dateOrder =
                                              (int.parse(mon) + 1).toString() +
                                                  "/" +
                                                  ((int.parse(day) + 1) - lastday)
                                                      .toString() +
                                                  "/" +
                                                  (DateTime.now().year).toString();
                                        print(dateOrder);
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          if ((int.parse(day) + 1) <= lastday)
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    mon + "\n",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    (int.parse(day) + 1).toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ]),
                                          if ((int.parse(day) + 1) > lastday)
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    (int.parse(mon) + 1)
                                                        .toString() +
                                                        "\n",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    ((int.parse(day) + 1) - lastday)
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ]),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Visibility(
                                  visible: true,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: (click2 == true)
                                              ? Color.fromARGB(255, 112, 145, 201)
                                              : Color.fromARGB(255, 255, 22, 22),
                                          side: BorderSide(
                                              width: 1, color: Colors.black),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10))),
                                      onPressed: () {
                                        setState(() {
                                          click = true;
                                          click1 = true;
                                          click2 = !click2;
                                          click3 = true;
                                          click4 = true;
                                          click5 = true;
                                          click6 = true;
                                          checkedDate = true;
                                        });
                                        if ((int.parse(day) + 2) <= lastday&&
                                            ((int.parse(day) + 2)) > 10)
                                          dateOrder = (DateTime.now().month.toString().padLeft(2, '0'))
                                              .toString() +
                                              "/" +
                                              (DateTime.now().day + 2).toString() +
                                              "/" +
                                              (DateTime.now().year).toString();

                                        if ((int.parse(day) + 2) <= lastday&&
                                            ((int.parse(day) + 2)) < 10)
                                          dateOrder = (DateTime.now().month)
                                              .toString() +
                                              "/0" +
                                              (DateTime.now().day + 2).toString() +
                                              "/" +
                                              (DateTime.now().year).toString();

                                        if ((int.parse(day) + 2) > lastday &&
                                            ((int.parse(day) + 2) - lastday) < 10)
                                          dateOrder =
                                              (int.parse(mon) + 1).toString() +
                                                  "/0" +
                                                  ((int.parse(day) + 2) - lastday)
                                                      .toString() +
                                                  "/" +
                                                  (DateTime.now().year).toString();
                                        print(dateOrder);
                                        if ((int.parse(day) + 2) > lastday &&
                                            ((int.parse(day) + 2) - lastday) >= 10)
                                          dateOrder =
                                              (int.parse(mon) + 1).toString() +
                                                  "/" +
                                                  ((int.parse(day) + 2) - lastday)
                                                      .toString() +
                                                  "/" +
                                                  (DateTime.now().year).toString();
                                        print(dateOrder);
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          if ((int.parse(day) + 2) <= lastday)
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    mon + "\n",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    (int.parse(day) + 2).toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ]),
                                          if ((int.parse(day) + 2) > lastday)
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    (int.parse(mon) + 1)
                                                        .toString() +
                                                        "\n",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    ((int.parse(day) + 2) - lastday)
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ]),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Visibility(
                                  visible: true,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: (click3 == true)
                                              ? Color.fromARGB(255, 112, 145, 201)
                                              : Color.fromARGB(255, 255, 22, 22),
                                          side: BorderSide(
                                              width: 1, color: Colors.black),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10))),
                                      onPressed: () {
                                        setState(() {
                                          click = true;
                                          click1 = true;
                                          click2 = true;
                                          click3 = !click3;
                                          click4 = true;
                                          click5 = true;
                                          click6 = true;
                                          checkedDate = true;
                                        });
                                        if ((int.parse(day) + 3) <= lastday&&
                                            ((int.parse(day) + 3)) >= 10)
                                          dateOrder = (DateTime.now().month.toString().padLeft(2, '0'))
                                              .toString() +
                                              "/" +
                                              (DateTime.now().day + 3).toString() +
                                              "/" +
                                              (DateTime.now().year).toString();

                                        if ((int.parse(day) + 3) <= lastday&&
                                            ((int.parse(day) + 3)) < 10)
                                          dateOrder = (DateTime.now().month)
                                              .toString() +
                                              "/0" +
                                              (DateTime.now().day + 3).toString() +
                                              "/" +
                                              (DateTime.now().year).toString();

                                        if ((int.parse(day) + 3) > lastday &&
                                            ((int.parse(day) + 3) - lastday) < 10)
                                          dateOrder =
                                              (int.parse(mon) + 1).toString() +
                                                  "/0" +
                                                  ((int.parse(day) + 3) - lastday)
                                                      .toString() +
                                                  "/" +
                                                  (DateTime.now().year).toString();
                                        print(dateOrder);
                                        if ((int.parse(day) + 3) > lastday &&
                                            ((int.parse(day) + 3) - lastday) >= 10)
                                          dateOrder =
                                              (int.parse(mon) + 1).toString() +
                                                  "/" +
                                                  ((int.parse(day) + 3) - lastday)
                                                      .toString() +
                                                  "/" +
                                                  (DateTime.now().year).toString();
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          if ((int.parse(day) + 3) <= lastday)
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    mon + "\n",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    (int.parse(day) + 3).toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ]),
                                          if ((int.parse(day) + 3) > lastday)
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    (int.parse(mon) + 1)
                                                        .toString() +
                                                        "\n",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    ((int.parse(day) + 3) - lastday)
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ]),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Visibility(
                                  visible: true,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: (click4 == true)
                                              ? Color.fromARGB(255, 112, 145, 201)
                                              : Color.fromARGB(255, 255, 22, 22),
                                          side: BorderSide(
                                              width: 1, color: Colors.black),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10))),
                                      onPressed: () {
                                        setState(() {
                                          click = true;
                                          click1 = true;
                                          click2 = true;
                                          click3 = true;
                                          click4 = !click4;
                                          click5 = true;
                                          click6 = true;
                                          checkedDate = true;
                                        });
                                        if ((int.parse(day) + 4) <= lastday&&
                                            ((int.parse(day) + 4)) >= 10)
                                          dateOrder = (DateTime.now().month.toString().padLeft(2, '0'))
                                              .toString() +
                                              "/" +
                                              (DateTime.now().day + 4).toString() +
                                              "/" +
                                              (DateTime.now().year).toString();

                                        if ((int.parse(day) + 4) <= lastday&&
                                            ((int.parse(day) + 4)) < 10)
                                          dateOrder = (DateTime.now().month)
                                              .toString() +
                                              "/0" +
                                              (DateTime.now().day + 4).toString() +
                                              "/" +
                                              (DateTime.now().year).toString();

                                        if ((int.parse(day) + 4) > lastday &&
                                            ((int.parse(day) + 4) - lastday) < 10)
                                          dateOrder =
                                              (int.parse(mon) + 1).toString() +
                                                  "/0" +
                                                  ((int.parse(day) + 4) - lastday)
                                                      .toString() +
                                                  "/" +
                                                  (DateTime.now().year).toString();
                                        print(dateOrder);
                                        if ((int.parse(day) + 4) > lastday &&
                                            ((int.parse(day) + 4) - lastday) >= 10)
                                          dateOrder =
                                              (int.parse(mon) + 1).toString() +
                                                  "/" +
                                                  ((int.parse(day) + 4) - lastday)
                                                      .toString() +
                                                  "/" +
                                                  (DateTime.now().year).toString();
                                        print(dateOrder);
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          if ((int.parse(day) + 4) <= lastday)
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    mon + "\n",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    (int.parse(day) + 4).toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ]),
                                          if ((int.parse(day) + 4) > lastday)
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    (int.parse(mon) + 1)
                                                        .toString() +
                                                        "\n",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    ((int.parse(day) + 4) - lastday)
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ]),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Visibility(
                                  visible: true,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: (click5 == true)
                                              ? Color.fromARGB(255, 112, 145, 201)
                                              : Color.fromARGB(255, 255, 22, 22),
                                          side: BorderSide(
                                              width: 1, color: Colors.black),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10))),
                                      onPressed: () {
                                        setState(() {
                                          click = true;
                                          click1 = true;
                                          click2 = true;
                                          click3 = true;
                                          click4 = true;
                                          click5 = !click5;
                                          click6 = true;
                                          checkedDate = true;
                                        });
                                        if ((int.parse(day) + 5) <= lastday&&
                                            ((int.parse(day) + 5)) >= 10)
                                          dateOrder = (DateTime.now().month.toString().padLeft(2, '0'))
                                              .toString() +
                                              "/" +
                                              (DateTime.now().day + 5).toString() +
                                              "/" +
                                              (DateTime.now().year).toString();

                                        if ((int.parse(day) + 5) <= lastday&&
                                            ((int.parse(day) + 5)) < 10)
                                          dateOrder = (DateTime.now().month)
                                              .toString() +
                                              "/0" +
                                              (DateTime.now().day + 5).toString() +
                                              "/" +
                                              (DateTime.now().year).toString();

                                        if ((int.parse(day) + 4) > lastday &&
                                            ((int.parse(day) + 5) - lastday) < 10)
                                          dateOrder =
                                              (int.parse(mon) + 1).toString() +
                                                  "/0" +
                                                  ((int.parse(day) + 5) - lastday)
                                                      .toString() +
                                                  "/" +
                                                  (DateTime.now().year).toString();
                                        print(dateOrder);
                                        if ((int.parse(day) + 5) > lastday &&
                                            ((int.parse(day) + 5) - lastday) >= 10)
                                          dateOrder =
                                              (int.parse(mon) + 1).toString() +
                                                  "/" +
                                                  ((int.parse(day) + 5) - lastday)
                                                      .toString() +
                                                  "/" +
                                                  (DateTime.now().year).toString();
                                        print(dateOrder);
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          if ((int.parse(day) + 5) <= lastday)
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    mon + "\n",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    (int.parse(day) + 5).toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ]),
                                          if ((int.parse(day) + 5) > lastday)
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    (int.parse(mon) + 1)
                                                        .toString() +
                                                        "\n",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    ((int.parse(day) + 5) - lastday)
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ]),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Visibility(
                                  visible: true,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: (click6 == true)
                                              ? Color.fromARGB(255, 112, 145, 201)
                                              : Color.fromARGB(255, 255, 22, 22),
                                          side: BorderSide(
                                              width: 1, color: Colors.black),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(10))),
                                      onPressed: () {
                                        setState(() {
                                          click = true;
                                          click1 = true;
                                          click2 = true;
                                          click3 = true;
                                          click4 = true;
                                          click5 = true;
                                          click6 = !click6;
                                          checkedDate = true;
                                        });
                                        if ((int.parse(day) + 6) <= lastday&&
                                            ((int.parse(day) + 6)) >= 10)
                                          dateOrder = (DateTime.now().month.toString().padLeft(2, '0'))
                                              .toString() +
                                              "/" +
                                              (DateTime.now().day + 6).toString() +
                                              "/" +
                                              (DateTime.now().year).toString();

                                        if ((int.parse(day) + 6) <= lastday&&
                                            ((int.parse(day) + 6)) < 10)
                                          dateOrder = (DateTime.now().month)
                                              .toString() +
                                              "/0" +
                                              (DateTime.now().day + 4).toString() +
                                              "/" +
                                              (DateTime.now().year).toString();

                                        if ((int.parse(day) + 6) > lastday &&
                                            ((int.parse(day) + 6) - lastday) < 10)
                                          dateOrder =
                                              (int.parse(mon) + 1).toString() +
                                                  "/0" +
                                                  ((int.parse(day) + 6) - lastday)
                                                      .toString() +
                                                  "/" +
                                                  (DateTime.now().year).toString();
                                        print(dateOrder);
                                        if ((int.parse(day) + 6) > lastday &&
                                            ((int.parse(day) + 6) - lastday) >= 10)
                                          dateOrder =
                                              (int.parse(mon) + 1).toString() +
                                                  "/" +
                                                  ((int.parse(day) + 6) - lastday)
                                                      .toString() +
                                                  "/" +
                                                  (DateTime.now().year).toString();
                                        print(dateOrder);
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          if ((int.parse(day) + 6) <= lastday)
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    mon + "\n",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    (int.parse(day) + 6).toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ]),
                                          if ((int.parse(day) + 6) > lastday)
                                            Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    (int.parse(mon) + 1)
                                                        .toString() +
                                                        "\n",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                  ),
                                                  Text(
                                                    ((int.parse(day) + 6) - lastday)
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 24),
                                                  ),
                                                ]),
                                        ],
                                      )),
                                ),
                              ]),
                        ),

//=============================CHỌN THỜI GIAN ORDER===================================

                        Visibility(
                          visible: (checkedDate == true) ?true: false,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 25, horizontal: 25),
                            child:
                            Column(mainAxisAlignment: MainAxisAlignment.center,
                                // gap between lines
                                children: <Widget>[
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        FutureBuilder(
                                          future:
                                          api.getListOrderAllTime(dateOrder),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {

                                              print("DATE ORDER :" + dateOrder);
                                              for (int i = 0;
                                              i < snapshot.data!.length;
                                              i++) {
                                                if (snapshot.data![i].time ==
                                                    "07:00") {
                                                  return Visibility(
                                                    visible: false,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                            (click_ == true)
                                                                ? Color.fromARGB(
                                                                255,
                                                                222,
                                                                231,
                                                                246)
                                                                : Color.fromARGB(
                                                                255,
                                                                255,
                                                                22,
                                                                22),
                                                            side: BorderSide(
                                                                width: 1,
                                                                color:
                                                                Colors.black),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    15))),
                                                        onPressed: () {
                                                          setState(() {
                                                            click_ = !click_;
                                                            click_1 = true;
                                                            click_2 = true;
                                                            click_3 = true;
                                                            click_4 = true;
                                                            click_5 = true;
                                                            click_6 = true;
                                                            click_7 = true;
                                                            click_8 = true;
                                                            click_9 = true;
                                                            click_10 = true;
                                                            checkedTime = true;
                                                          });
                                                          startOrder = dateOrder +
                                                              " " +
                                                              "07:00";
                                                          endOrder = dateOrder +
                                                              " " +
                                                              "08:30";
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: <Widget>[
                                                            Text(
                                                              "07:00 - 08:30",
                                                              style: TextStyle(
                                                                  color:
                                                                  Colors.black,
                                                                  fontSize: 18),
                                                            ),
                                                          ],
                                                        )),
                                                  );
                                                }
                                              }
                                              return Visibility(
                                                visible: true,
                                                child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: (click_ ==
                                                            true)
                                                            ? Color.fromARGB(
                                                            255, 222, 231, 246)
                                                            : Color.fromARGB(
                                                            255, 255, 22, 22),
                                                        side: BorderSide(
                                                            width: 1,
                                                            color: Colors.black),
                                                        shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                15))),
                                                    onPressed: () {
                                                      setState(() {
                                                        click_ = !click_;
                                                        click_1 = true;
                                                        click_2 = true;
                                                        click_3 = true;
                                                        click_4 = true;
                                                        click_5 = true;
                                                        click_6 = true;
                                                        click_7 = true;
                                                        click_8 = true;
                                                        click_9 = true;
                                                        click_10 = true;
                                                        checkedTime = true;
                                                      });
                                                      startOrder =
                                                          dateOrder + " " + "07:00";
                                                      endOrder =
                                                          dateOrder + " " + "08:30";
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Text(
                                                          "07:00 - 08:30",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 18),
                                                        ),
                                                      ],
                                                    )),
                                              );
                                            } else {
                                              print("DATE ORDER :" + dateOrder);
                                              return CircularProgressIndicator();
                                            }
                                          },
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        FutureBuilder(
                                          future:
                                          api.getListOrderAllTime(dateOrder),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              for (int i = 0;
                                              i < snapshot.data!.length;
                                              i++) {
                                                if (snapshot.data![i].time ==
                                                    "08:30") {
                                                  return Visibility(
                                                    visible: false,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                            (click_1 == true)
                                                                ? Color.fromARGB(
                                                                255,
                                                                222,
                                                                231,
                                                                246)
                                                                : Color.fromARGB(
                                                                255,
                                                                255,
                                                                22,
                                                                22),
                                                            side: BorderSide(
                                                                width: 1,
                                                                color:
                                                                Colors.black),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    15))),
                                                        onPressed: () {
                                                          setState(() {
                                                            click_ = true;
                                                            click_1 = !click_1;
                                                            click_2 = true;
                                                            click_3 = true;
                                                            click_4 = true;
                                                            click_5 = true;
                                                            click_6 = true;
                                                            click_7 = true;
                                                            click_8 = true;
                                                            click_9 = true;
                                                            click_10 = true;
                                                            checkedTime = true;
                                                          });
                                                          startOrder = dateOrder +
                                                              " " +
                                                              "08:30";
                                                          print(startOrder);
                                                          endOrder = dateOrder +
                                                              " " +
                                                              "10:00";
                                                          print(endOrder);
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: <Widget>[
                                                            Text(
                                                              "08:30 - 10:00",
                                                              style: TextStyle(
                                                                  color:
                                                                  Colors.black,
                                                                  fontSize: 18),
                                                            ),
                                                          ],
                                                        )),
                                                  );
                                                }
                                              }
                                              return Visibility(
                                                visible: true,
                                                child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: (click_1 ==
                                                            true)
                                                            ? Color.fromARGB(
                                                            255, 222, 231, 246)
                                                            : Color.fromARGB(
                                                            255, 255, 22, 22),
                                                        side: BorderSide(
                                                            width: 1,
                                                            color: Colors.black),
                                                        shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                15))),
                                                    onPressed: () {
                                                      setState(() {
                                                        click_ = true;
                                                        click_1 = !click_1;
                                                        click_2 = true;
                                                        click_3 = true;
                                                        click_4 = true;
                                                        click_5 = true;
                                                        click_6 = true;
                                                        click_7 = true;
                                                        click_8 = true;
                                                        click_9 = true;
                                                        click_10 = true;
                                                        checkedTime = true;
                                                      });
                                                      startOrder =
                                                          dateOrder + " " + "08:30";
                                                      print(startOrder);
                                                      endOrder =
                                                          dateOrder + " " + "10:00";
                                                      print(endOrder);
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Text(
                                                          "08:30 - 10:00",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 18),
                                                        ),
                                                      ],
                                                    )),
                                              );
                                            } else {
                                              return CircularProgressIndicator();
                                            }
                                          },
                                        ),

                                        SizedBox(
                                          width: 15,
                                        ),
                                        FutureBuilder(
                                          future:
                                          api.getListOrderAllTime(dateOrder),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              for (int i = 0;
                                              i < snapshot.data!.length;
                                              i++) {
                                                if (snapshot.data![i].time ==
                                                    "10:00") {
                                                  return Visibility(
                                                    visible: false,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                            (click_2 == true)
                                                                ? Color.fromARGB(
                                                                255,
                                                                222,
                                                                231,
                                                                246)
                                                                : Color.fromARGB(
                                                                255,
                                                                255,
                                                                22,
                                                                22),
                                                            side: BorderSide(
                                                                width: 1,
                                                                color:
                                                                Colors.black),
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius.circular(
                                                                    15))),
                                                        onPressed: () {
                                                          setState(() {
                                                            click_ = true;
                                                            click_1 = true;
                                                            click_2 = !click_2;
                                                            click_3 = true;
                                                            click_4 = true;
                                                            click_5 = true;
                                                            click_6 = true;
                                                            click_7 = true;
                                                            click_8 = true;
                                                            click_9 = true;
                                                            click_10 = true;
                                                            checkedTime = true;
                                                          });
                                                          startOrder = dateOrder +
                                                              " " +
                                                              "10:00";
                                                          print(startOrder);
                                                          endOrder = dateOrder +
                                                              " " +
                                                              "11:30";
                                                          print(endOrder);
                                                        },
                                                        child: Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: <Widget>[
                                                            Text(
                                                              "10:00 - 11:30",
                                                              style: TextStyle(
                                                                  color:
                                                                  Colors.black,
                                                                  fontSize: 18),
                                                            ),
                                                          ],
                                                        )),
                                                  );
                                                }
                                              }
                                              return Visibility(
                                                visible: true,
                                                child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: (click_2 ==
                                                            true)
                                                            ? Color.fromARGB(
                                                            255, 222, 231, 246)
                                                            : Color.fromARGB(
                                                            255, 255, 22, 22),
                                                        side: BorderSide(
                                                            width: 1,
                                                            color: Colors.black),
                                                        shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                15))),
                                                    onPressed: () {
                                                      setState(() {
                                                        click_ = true;
                                                        click_1 = true;
                                                        click_2 = !click_2;
                                                        click_3 = true;
                                                        click_4 = true;
                                                        click_5 = true;
                                                        click_6 = true;
                                                        click_7 = true;
                                                        click_8 = true;
                                                        click_9 = true;
                                                        click_10 = true;
                                                        checkedTime = true;
                                                      });
                                                      startOrder =
                                                          dateOrder + " " + "10:00";
                                                      print(startOrder);
                                                      endOrder =
                                                          dateOrder + " " + "11:30";
                                                      print(endOrder);
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Text(
                                                          "10:00 - 11:30",
                                                          style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 18),
                                                        ),
                                                      ],
                                                    )),
                                              );
                                            } else {
                                              return CircularProgressIndicator();
                                            }
                                          },
                                        ),

                                        SizedBox(
                                          width: 15,
                                        ),
                                        // Visibility(
                                        //   visible: (show == true) ? true : false,
                                        //   child: ElevatedButton(
                                        //       style: ElevatedButton.styleFrom(
                                        //           backgroundColor: (click_3 == true)
                                        //               ? Color.fromARGB(
                                        //                   255, 222, 231, 246)
                                        //               : Color.fromARGB(
                                        //                   255, 255, 22, 22),
                                        //           side: BorderSide(
                                        //               width: 1,
                                        //               color: Colors.black),
                                        //           shape: RoundedRectangleBorder(
                                        //               borderRadius:
                                        //                   BorderRadius.circular(
                                        //                       15))),
                                        //       onPressed: () {
                                        //         setState(() {
                                        //           click_ = true;
                                        //           click_1 = true;
                                        //           click_2 = true;
                                        //           click_3 = !click_3;
                                        //           click_4 = true;
                                        //           click_5 = true;
                                        //           click_6 = true;
                                        //           click_7 = true;
                                        //           click_8 = true;
                                        //           click_9 = true;
                                        //           click_10 = true;
                                        //           checkedTime = true;
                                        //         });
                                        //         startOrder =
                                        //             dateOrder + " " + "10:30";
                                        //         print(startOrder);
                                        //         endOrder =
                                        //             dateOrder + " " + "12:00";
                                        //         print(endOrder);
                                        //       },
                                        //       child: Row(
                                        //         mainAxisAlignment:
                                        //             MainAxisAlignment.center,
                                        //         children: <Widget>[
                                        //           Text(
                                        //             "10:30 - 12:00",
                                        //             style: TextStyle(
                                        //                 color: Colors.black,
                                        //                 fontSize: 18),
                                        //           ),
                                        //         ],
                                        //       )),
                                        // ),
                                        // SizedBox(
                                        //   width: 15,
                                        // ),
                                      ]),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      FutureBuilder(
                                        future: api.getListOrderAllTime(dateOrder),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            for (int i = 0;
                                            i < snapshot.data!.length;
                                            i++) {
                                              if (snapshot.data![i].time ==
                                                  "12:00") {
                                                return Visibility(
                                                  visible: false,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                          (click_4 == true)
                                                              ? Color.fromARGB(
                                                              255,
                                                              222,
                                                              231,
                                                              246)
                                                              : Color.fromARGB(
                                                              255,
                                                              255,
                                                              22,
                                                              22),
                                                          side: BorderSide(
                                                              width: 1,
                                                              color: Colors.black),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(15))),
                                                      onPressed: () {
                                                        setState(() {
                                                          click_ = true;
                                                          click_1 = true;
                                                          click_2 = true;
                                                          click_3 = true;
                                                          click_4 = !click_4;
                                                          click_5 = true;
                                                          click_6 = true;
                                                          click_7 = true;
                                                          click_8 = true;
                                                          click_9 = true;
                                                          click_10 = true;
                                                          checkedTime = true;
                                                        });
                                                        startOrder = dateOrder +
                                                            " " +
                                                            "12:00";
                                                        print(startOrder);
                                                        endOrder = dateOrder +
                                                            " " +
                                                            "13:30";
                                                        print(endOrder);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: <Widget>[
                                                          Text(
                                                            "12:00 - 13:30",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 18),
                                                          ),
                                                        ],
                                                      )),
                                                );
                                              }
                                            }
                                            return Visibility(
                                              visible: true,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: (click_4 ==
                                                          true)
                                                          ? Color.fromARGB(
                                                          255, 222, 231, 246)
                                                          : Color.fromARGB(
                                                          255, 255, 22, 22),
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: Colors.black),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                                  onPressed: () {
                                                    setState(() {
                                                      click_ = true;
                                                      click_1 = true;
                                                      click_2 = true;
                                                      click_3 = true;
                                                      click_4 = !click_4;
                                                      click_5 = true;
                                                      click_6 = true;
                                                      click_7 = true;
                                                      click_8 = true;
                                                      click_9 = true;
                                                      click_10 = true;
                                                      checkedTime = true;
                                                    });
                                                    startOrder =
                                                        dateOrder + " " + "12:00";
                                                    print(startOrder);
                                                    endOrder =
                                                        dateOrder + " " + "13:30";
                                                    print(endOrder);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text(
                                                        "12:00 - 13:30",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  )),
                                            );
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      FutureBuilder(
                                        future: api.getListOrderAllTime(dateOrder),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            for (int i = 0;
                                            i < snapshot.data!.length;
                                            i++) {
                                              if (snapshot.data![i].time ==
                                                  "13:30") {
                                                return Visibility(
                                                  visible: false,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                          (click_5 == true)
                                                              ? Color.fromARGB(
                                                              255,
                                                              222,
                                                              231,
                                                              246)
                                                              : Color.fromARGB(
                                                              255,
                                                              255,
                                                              22,
                                                              22),
                                                          side: BorderSide(
                                                              width: 1,
                                                              color: Colors.black),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(15))),
                                                      onPressed: () {
                                                        setState(() {
                                                          click_ = true;
                                                          click_1 = true;
                                                          click_2 = true;
                                                          click_3 = true;
                                                          click_4 = true;
                                                          click_5 = !click_5;
                                                          click_6 = true;
                                                          click_7 = true;
                                                          click_8 = true;
                                                          click_9 = true;
                                                          click_10 = true;
                                                          checkedTime = true;
                                                        });
                                                        startOrder = dateOrder +
                                                            " " +
                                                            "13:30";
                                                        print(startOrder);
                                                        endOrder = dateOrder +
                                                            " " +
                                                            "15:00";
                                                        print(endOrder);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: <Widget>[
                                                          Text(
                                                            "13:30 - 15:00",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 18),
                                                          ),
                                                        ],
                                                      )),
                                                );
                                              }
                                            }
                                            return Visibility(
                                              visible: true,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: (click_5 ==
                                                          true)
                                                          ? Color.fromARGB(
                                                          255, 222, 231, 246)
                                                          : Color.fromARGB(
                                                          255, 255, 22, 22),
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: Colors.black),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                                  onPressed: () {
                                                    setState(() {
                                                      click_ = true;
                                                      click_1 = true;
                                                      click_2 = true;
                                                      click_3 = true;
                                                      click_4 = true;
                                                      click_5 = !click_5;
                                                      click_6 = true;
                                                      click_7 = true;
                                                      click_8 = true;
                                                      click_9 = true;
                                                      click_10 = true;
                                                      checkedTime = true;
                                                    });
                                                    startOrder =
                                                        dateOrder + " " + "13:30";
                                                    print(startOrder);
                                                    endOrder =
                                                        dateOrder + " " + "15:00";
                                                    print(endOrder);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text(
                                                        "13:30 - 15:00",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  )),
                                            );
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      FutureBuilder(
                                        future: api.getListOrderAllTime(dateOrder),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            for (int i = 0;
                                            i < snapshot.data!.length;
                                            i++) {
                                              if (snapshot.data![i].time ==
                                                  "15:00") {
                                                return Visibility(
                                                  visible: false,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                          (click_6 == true)
                                                              ? Color.fromARGB(
                                                              255,
                                                              222,
                                                              231,
                                                              246)
                                                              : Color.fromARGB(
                                                              255,
                                                              255,
                                                              22,
                                                              22),
                                                          side: BorderSide(
                                                              width: 1,
                                                              color: Colors.black),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(15))),
                                                      onPressed: () {
                                                        setState(() {
                                                          click_ = true;
                                                          click_1 = true;
                                                          click_2 = true;
                                                          click_3 = true;
                                                          click_4 = true;
                                                          click_5 = true;
                                                          click_6 = !click_6;
                                                          click_7 = true;
                                                          click_8 = true;
                                                          click_9 = true;
                                                          click_10 = true;
                                                          checkedTime = true;
                                                        });
                                                        startOrder = dateOrder +
                                                            " " +
                                                            "15:00";
                                                        print(startOrder);
                                                        endOrder = dateOrder +
                                                            " " +
                                                            "16:30";
                                                        print(endOrder);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: <Widget>[
                                                          Text(
                                                            "15:00 - 16:30",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 18),
                                                          ),
                                                        ],
                                                      )),
                                                );
                                              }
                                            }
                                            return Visibility(
                                              visible: true,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: (click_6 ==
                                                          true)
                                                          ? Color.fromARGB(
                                                          255, 222, 231, 246)
                                                          : Color.fromARGB(
                                                          255, 255, 22, 22),
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: Colors.black),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                                  onPressed: () {
                                                    setState(() {
                                                      click_ = true;
                                                      click_1 = true;
                                                      click_2 = true;
                                                      click_3 = true;
                                                      click_4 = true;
                                                      click_5 = true;
                                                      click_6 = !click_6;
                                                      click_7 = true;
                                                      click_8 = true;
                                                      click_9 = true;
                                                      click_10 = true;
                                                      checkedTime = true;
                                                    });
                                                    startOrder =
                                                        dateOrder + " " + "15:00";
                                                    print(startOrder);
                                                    endOrder =
                                                        dateOrder + " " + "16:30";
                                                    print(endOrder);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text(
                                                        "15:00 - 16:30",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  )),
                                            );
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      FutureBuilder(
                                        future: api.getListOrderAllTime(dateOrder),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            for (int i = 0;
                                            i < snapshot.data!.length;
                                            i++) {
                                              if (snapshot.data![i].time ==
                                                  "16:30") {
                                                return Visibility(
                                                  visible: false,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                          (click_7 == true)
                                                              ? Color.fromARGB(
                                                              255,
                                                              222,
                                                              231,
                                                              246)
                                                              : Color.fromARGB(
                                                              255,
                                                              255,
                                                              22,
                                                              22),
                                                          side: BorderSide(
                                                              width: 1,
                                                              color: Colors.black),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(15))),
                                                      onPressed: () {
                                                        setState(() {
                                                          click_ = true;
                                                          click_1 = true;
                                                          click_2 = true;
                                                          click_3 = true;
                                                          click_4 = true;
                                                          click_5 = true;
                                                          click_6 = true;
                                                          click_7 = !click_7;
                                                          click_8 = true;
                                                          click_9 = true;
                                                          click_10 = true;
                                                          checkedTime = true;
                                                        });
                                                        startOrder = dateOrder +
                                                            " " +
                                                            "16:30";
                                                        print(startOrder);
                                                        endOrder = dateOrder +
                                                            " " +
                                                            "18:00";
                                                        print(endOrder);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: <Widget>[
                                                          Text(
                                                            "16:30 - 18:00",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 18),
                                                          ),
                                                        ],
                                                      )),
                                                );
                                              }
                                            }
                                            return Visibility(
                                              visible: true,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: (click_7 ==
                                                          true)
                                                          ? Color.fromARGB(
                                                          255, 222, 231, 246)
                                                          : Color.fromARGB(
                                                          255, 255, 22, 22),
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: Colors.black),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                                  onPressed: () {
                                                    setState(() {
                                                      click_ = true;
                                                      click_1 = true;
                                                      click_2 = true;
                                                      click_3 = true;
                                                      click_4 = true;
                                                      click_5 = true;
                                                      click_6 = true;
                                                      click_7 = !click_7;
                                                      click_8 = true;
                                                      click_9 = true;
                                                      click_10 = true;
                                                      checkedTime = true;
                                                    });
                                                    startOrder =
                                                        dateOrder + " " + "16:30";
                                                    print(startOrder);
                                                    endOrder =
                                                        dateOrder + " " + "18:00";
                                                    print(endOrder);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text(
                                                        "16:30 - 18:00",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  )),
                                            );
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      FutureBuilder(
                                        future: api.getListOrderAllTime(dateOrder),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            for (int i = 0;
                                            i < snapshot.data!.length;
                                            i++) {
                                              if (snapshot.data![i].time ==
                                                  "18:00") {
                                                return Visibility(
                                                  visible: false,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                          (click_8 == true)
                                                              ? Color.fromARGB(
                                                              255,
                                                              222,
                                                              231,
                                                              246)
                                                              : Color.fromARGB(
                                                              255,
                                                              255,
                                                              22,
                                                              22),
                                                          side: BorderSide(
                                                              width: 1,
                                                              color: Colors.black),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(15))),
                                                      onPressed: () {
                                                        setState(() {
                                                          click_ = true;
                                                          click_1 = true;
                                                          click_2 = true;
                                                          click_3 = true;
                                                          click_4 = true;
                                                          click_5 = true;
                                                          click_6 = true;
                                                          click_7 = true;
                                                          click_8 = !click_8;
                                                          click_9 = true;
                                                          click_10 = true;
                                                          checkedTime = true;
                                                        });
                                                        startOrder = dateOrder +
                                                            " " +
                                                            "18:00";
                                                        print(startOrder);
                                                        endOrder = dateOrder +
                                                            " " +
                                                            "19:30";
                                                        print(endOrder);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: <Widget>[
                                                          Text(
                                                            "18:00 - 19:30",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 18),
                                                          ),
                                                        ],
                                                      )),
                                                );
                                              }
                                            }
                                            return Visibility(
                                              visible: true,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: (click_8 ==
                                                          true)
                                                          ? Color.fromARGB(
                                                          255, 222, 231, 246)
                                                          : Color.fromARGB(
                                                          255, 255, 22, 22),
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: Colors.black),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                                  onPressed: () {
                                                    setState(() {
                                                      click_ = true;
                                                      click_1 = true;
                                                      click_2 = true;
                                                      click_3 = true;
                                                      click_4 = true;
                                                      click_5 = true;
                                                      click_6 = true;
                                                      click_7 = true;
                                                      click_8 = !click_8;
                                                      click_9 = true;
                                                      click_10 = true;
                                                      checkedTime = true;
                                                    });
                                                    startOrder =
                                                        dateOrder + " " + "18:00";
                                                    print(startOrder);
                                                    endOrder =
                                                        dateOrder + " " + "19:30";
                                                    print(endOrder);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text(
                                                        "18:00 - 19:30",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  )),
                                            );
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      FutureBuilder(
                                        future: api.getListOrderAllTime(dateOrder),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            for (int i = 0;
                                            i < snapshot.data!.length;
                                            i++) {
                                              if (snapshot.data![i].time ==
                                                  "19:30") {
                                                return Visibility(
                                                  visible: false,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                          (click_9 == true)
                                                              ? Color.fromARGB(
                                                              255,
                                                              222,
                                                              231,
                                                              246)
                                                              : Color.fromARGB(
                                                              255,
                                                              255,
                                                              22,
                                                              22),
                                                          side: BorderSide(
                                                              width: 1,
                                                              color: Colors.black),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(15))),
                                                      onPressed: () {
                                                        setState(() {
                                                          click_ = true;
                                                          click_1 = true;
                                                          click_2 = true;
                                                          click_3 = true;
                                                          click_4 = true;
                                                          click_5 = true;
                                                          click_6 = true;
                                                          click_7 = true;
                                                          click_8 = true;
                                                          click_9 = !click_9;
                                                          click_10 = true;
                                                          checkedTime = true;
                                                        });
                                                        startOrder = dateOrder +
                                                            " " +
                                                            "19:30";
                                                        print(startOrder);
                                                        endOrder = dateOrder +
                                                            " " +
                                                            "21:00";
                                                        print(endOrder);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: <Widget>[
                                                          Text(
                                                            "19:30 - 21:00",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 18),
                                                          ),
                                                        ],
                                                      )),
                                                );
                                              }
                                            }
                                            return Visibility(
                                              visible: false,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: (click_9 ==
                                                          true)
                                                          ? Color.fromARGB(
                                                          255, 222, 231, 246)
                                                          : Color.fromARGB(
                                                          255, 255, 22, 22),
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: Colors.black),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                                  onPressed: () {
                                                    setState(() {
                                                      click_ = true;
                                                      click_1 = true;
                                                      click_2 = true;
                                                      click_3 = true;
                                                      click_4 = true;
                                                      click_5 = true;
                                                      click_6 = true;
                                                      click_7 = true;
                                                      click_8 = true;
                                                      click_9 = !click_9;
                                                      click_10 = true;
                                                      checkedTime = true;
                                                    });
                                                    startOrder =
                                                        dateOrder + " " + "19:30";
                                                    print(startOrder);
                                                    endOrder =
                                                        dateOrder + " " + "21:00";
                                                    print(endOrder);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text(
                                                        "19:30 - 21:00",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  )),
                                            );
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      FutureBuilder(
                                        future: api.getListOrderAllTime(dateOrder),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            for (int i = 0;
                                            i < snapshot.data!.length;
                                            i++) {
                                              if (snapshot.data![i].time ==
                                                  "21:00") {
                                                return Visibility(
                                                  visible: false,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                          (click_10 == true)
                                                              ? Color.fromARGB(
                                                              255,
                                                              222,
                                                              231,
                                                              246)
                                                              : Color.fromARGB(
                                                              255,
                                                              255,
                                                              22,
                                                              22),
                                                          side: BorderSide(
                                                              width: 1,
                                                              color: Colors.black),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(15))),
                                                      onPressed: () {
                                                        setState(() {
                                                          click_ = true;
                                                          click_1 = true;
                                                          click_2 = true;
                                                          click_3 = true;
                                                          click_4 = true;
                                                          click_5 = true;
                                                          click_6 = true;
                                                          click_7 = true;
                                                          click_8 = true;
                                                          click_9 = true;
                                                          click_10 = !click_10;
                                                          checkedTime = true;
                                                        });
                                                        startOrder = dateOrder +
                                                            " " +
                                                            "21:00";
                                                        print(startOrder);
                                                        endOrder = dateOrder +
                                                            " " +
                                                            "22:30";
                                                        print(endOrder);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: <Widget>[
                                                          Text(
                                                            "21:00 - 22:30",
                                                            style: TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 18),
                                                          ),
                                                        ],
                                                      )),
                                                );
                                              }
                                            }
                                            return Visibility(
                                              visible: true,
                                              child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: (click_10 ==
                                                          true)
                                                          ? Color.fromARGB(
                                                          255, 222, 231, 246)
                                                          : Color.fromARGB(
                                                          255, 255, 22, 22),
                                                      side: BorderSide(
                                                          width: 1,
                                                          color: Colors.black),
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              15))),
                                                  onPressed: () {
                                                    setState(() {
                                                      click_ = true;
                                                      click_1 = true;
                                                      click_2 = true;
                                                      click_3 = true;
                                                      click_4 = true;
                                                      click_5 = true;
                                                      click_6 = true;
                                                      click_7 = true;
                                                      click_8 = true;
                                                      click_9 = true;
                                                      click_10 = !click_10;
                                                      checkedTime = true;
                                                    });
                                                    startOrder =
                                                        dateOrder + " " + "21:00";
                                                    print(startOrder);
                                                    endOrder =
                                                        dateOrder + " " + "22:30";
                                                    print(endOrder);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Text(
                                                        "21:00 - 22:30",
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 18),
                                                      ),
                                                    ],
                                                  )),
                                            );
                                          } else {
                                            return CircularProgressIndicator();
                                          }
                                        },
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),

                        //===============================================
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MaterialButton(
                              color: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(16.0))),
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 16.0),
                                child: Text(
                                  "Hủy",
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),

                            Visibility(
                              visible: (checkedTime == true)? true : false,
                              child:  MaterialButton(
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(16.0))),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: true,
                                      builder: (BuildContext cxt) {
                                        return new DialogConfirmOrder(startTime: startOrder, endTime: endOrder, name: name,);
                                      });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 2.0, horizontal: 16.0),
                                  child: Text(
                                    "Đặt sân",
                                    style:
                                    TextStyle(color: Colors.black, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ));
  }
}
